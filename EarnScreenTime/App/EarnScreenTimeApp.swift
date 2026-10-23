import SwiftUI
import FamilyControls
import AVFoundation

@main
struct EarnScreenTimeApp: App {
    var body: some Scene {
        WindowGroup { ContentView() }
    }
}

struct ContentView: View {
    @StateObject private var model = AppModel()
    @Environment(\.scenePhase) private var phase
    @State private var picking = false
    @State private var working: Exercise?

    var body: some View {
        NavigationStack {
            Form {
                Section("Status") {
                    Label(model.unlocked ? "Unlocked until midnight" : "Locked",
                          systemImage: model.unlocked ? "lock.open" : "lock")
                }
                Section("Today's gym session") {
                    Picker("Session", selection: Binding(get: { model.session }, set: { model.setToday($0) })) {
                        ForEach(Session.allCases) { Text($0.name).tag($0) }
                    }
                    Text("Advances daily. Change it if you skip/shift a gym day.").font(.footnote)
                }
                Section("Locked apps") {
                    Button("Choose apps & sites") { picking = true }
                    Text("\(model.selection.applicationTokens.count) apps, \(model.selection.categoryTokens.count) categories, \(model.selection.webDomainTokens.count) sites")
                        .font(.footnote)
                }
                Section("Unlock workout") {
                    Stepper("Reps: \(model.target)", value: $model.target, in: 5...200, step: 5)
                    if model.allowed.isEmpty {
                        Text("No recovery-safe exercise today.")
                    }
                    ForEach(model.allowed) { ex in
                        Button("\(ex.rawValue) x \(model.target)") { working = ex }
                            .disabled(model.unlocked)
                    }
                    Text("Exercises skip muscles trained today or yesterday.").font(.footnote)
                }
                if let e = model.error { Text(e).foregroundStyle(.red) }
            }
            .navigationTitle("Earn Screen Time")
        }
        .familyActivityPicker(isPresented: $picking, selection: $model.selection)
        .fullScreenCover(item: $working) { ex in
            WorkoutView(exercise: ex, target: model.target) { model.complete() }
        }
        .task { await model.setup() }
        .onChange(of: phase) { if $0 == .active { model.refresh(); Shared.lockIfNeeded() } }
    }
}

struct WorkoutView: View {
    let exercise: Exercise
    let target: Int
    let onDone: () -> Void
    @StateObject private var counter = RepCounter()
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        ZStack {
            CameraPreview(session: counter.session).ignoresSafeArea()
            VStack {
                Text("\(counter.reps) / \(target)")
                    .font(.system(size: 80, weight: .bold)).foregroundStyle(.white).shadow(radius: 4)
                Text(exercise.tip).foregroundStyle(.white).multilineTextAlignment(.center).padding().shadow(radius: 4)
                Spacer()
                Button("Cancel") { dismiss() }.buttonStyle(.borderedProminent).padding()
            }
        }
        .onAppear { counter.start(exercise) }
        .onDisappear { counter.stop() }
        .onChange(of: counter.reps) { r in
            if r >= target { counter.stop(); onDone(); dismiss() }
        }
    }
}

struct CameraPreview: UIViewRepresentable {
    let session: AVCaptureSession

    final class PreviewView: UIView {
        override class var layerClass: AnyClass { AVCaptureVideoPreviewLayer.self }
    }

    func makeUIView(context: Context) -> PreviewView {
        let v = PreviewView()
        let layer = v.layer as! AVCaptureVideoPreviewLayer
        layer.session = session
        layer.videoGravity = .resizeAspectFill
        return v
    }

    func updateUIView(_ uiView: PreviewView, context: Context) {}
}
