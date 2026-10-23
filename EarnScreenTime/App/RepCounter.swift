import AVFoundation
import Vision

/// Counts reps from the front camera using Vision body-pose joint angles.
final class RepCounter: NSObject, ObservableObject, AVCaptureVideoDataOutputSampleBufferDelegate {
    @Published var reps = 0
    let session = AVCaptureSession()

    private let queue = DispatchQueue(label: "rep.counter")
    private let request = VNDetectHumanBodyPoseRequest()
    private var exercise = Exercise.pushUp
    private var configured = false
    private enum Phase { case unknown, high, low }
    private var phase = Phase.unknown

    func start(_ ex: Exercise) {
        exercise = ex
        phase = .unknown
        reps = 0
        AVCaptureDevice.requestAccess(for: .video) { ok in
            guard ok else { return }
            self.queue.async { self.run() }
        }
    }

    func stop() { queue.async { self.session.stopRunning() } }

    private func run() {
        if !configured {
            session.beginConfiguration()
            session.sessionPreset = .medium
            guard let dev = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .front),
                  let input = try? AVCaptureDeviceInput(device: dev), session.canAddInput(input) else {
                session.commitConfiguration(); return
            }
            session.addInput(input)
            let out = AVCaptureVideoDataOutput()
            out.alwaysDiscardsLateVideoFrames = true
            out.setSampleBufferDelegate(self, queue: queue)
            if session.canAddOutput(out) { session.addOutput(out) }
            session.commitConfiguration()
            configured = true
        }
        session.startRunning()
    }

    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        let handler = VNImageRequestHandler(cmSampleBuffer: sampleBuffer, orientation: .leftMirrored, options: [:])
        try? handler.perform([request])
        guard let obs = request.results?.first, let a = angle(obs) else { return }
        let t = exercise.thresholds
        switch phase {
        case .unknown: if a > t.high { phase = .high }
        case .high: if a < t.low { phase = .low }
        case .low:
            if a > t.high {
                phase = .high
                DispatchQueue.main.async { self.reps += 1 }
            }
        }
    }

    // MARK: angles (orientation-independent, so no rotation maths needed)

    private typealias J = VNHumanBodyPoseObservation.JointName

    private func angle(_ o: VNHumanBodyPoseObservation) -> Double? {
        let sides: [(J, J, J)]
        switch exercise {
        case .pushUp: sides = [(.leftShoulder, .leftElbow, .leftWrist), (.rightShoulder, .rightElbow, .rightWrist)]
        case .squat: sides = [(.leftHip, .leftKnee, .leftAnkle), (.rightHip, .rightKnee, .rightAnkle)]
        case .sitUp: sides = [(.leftShoulder, .leftHip, .leftKnee), (.rightShoulder, .rightHip, .rightKnee)]
        }
        let vals = sides.compactMap { angle(o, $0.0, $0.1, $0.2) }
        return vals.isEmpty ? nil : vals.reduce(0, +) / Double(vals.count)
    }

    private func angle(_ o: VNHumanBodyPoseObservation, _ a: J, _ b: J, _ c: J) -> Double? {
        guard let pa = try? o.recognizedPoint(a), let pb = try? o.recognizedPoint(b), let pc = try? o.recognizedPoint(c),
              pa.confidence > 0.3, pb.confidence > 0.3, pc.confidence > 0.3 else { return nil }
        let v1 = (x: pa.location.x - pb.location.x, y: pa.location.y - pb.location.y)
        let v2 = (x: pc.location.x - pb.location.x, y: pc.location.y - pb.location.y)
        return abs(atan2(v1.x * v2.y - v1.y * v2.x, v1.x * v2.x + v1.y * v2.y)) * 180 / .pi
    }
}
