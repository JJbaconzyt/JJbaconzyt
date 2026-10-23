import Foundation

/// Body regions your PPLURLR lifting hits. Edit `trains` to match your real plan.
enum Region { case push, pull, legs }

/// PPLURLR = Push, Pull, Legs, Upper, Lower, Rest.
enum Session: Int, CaseIterable, Identifiable {
    case push, pull, legs, upper, lower, rest
    var id: Int { rawValue }

    var name: String { ["Push", "Pull", "Legs", "Upper", "Lower", "Rest"][rawValue] }

    var trains: Set<Region> {
        switch self {
        case .push: return [.push]
        case .pull: return [.pull]
        case .legs, .lower: return [.legs]
        case .upper: return [.push, .pull]
        case .rest: return []
        }
    }

    var previous: Session { Session(rawValue: (rawValue + 5) % 6)! }
}

/// Unlock exercises. `regions` = what they fatigue. Sit-ups count as core (not lifted in PPLURLR).
enum Exercise: String, CaseIterable, Identifiable {
    case pushUp = "Push-ups", squat = "Squats", sitUp = "Sit-ups"
    var id: String { rawValue }

    var regions: Set<Region> {
        switch self {
        case .pushUp: return [.push]
        case .squat: return [.legs]
        case .sitUp: return []
        }
    }

    /// Joint triple (a, vertex b, c) whose angle is tracked.
    var tip: String {
        switch self {
        case .pushUp: return "Prop phone on floor, side view, full body in frame."
        case .squat: return "Prop phone ~2m away, side view, full body in frame."
        case .sitUp: return "Prop phone on floor, side view, full body in frame."
        }
    }

    /// (down-threshold, up-threshold) in degrees for the tracked joint angle.
    var thresholds: (low: Double, high: Double) {
        switch self {
        case .pushUp: return (90, 160)
        case .squat: return (100, 160)
        case .sitUp: return (85, 125)
        }
    }

    /// Allowed only if it avoids anything trained today or yesterday (recovery).
    func isAllowed(on session: Session) -> Bool {
        regions.isDisjoint(with: session.trains.union(session.previous.trains))
    }
}

/// Which PPLURLR session is today. Anchored to a date so it advances daily; you can re-anchor if you skip a gym day.
enum Cycle {
    static var today: Session {
        let d = Shared.defaults
        let anchorIndex = d.integer(forKey: "anchorIndex")
        let anchorDate = (d.object(forKey: "anchorDate") as? Date) ?? Calendar.current.startOfDay(for: Date())
        let days = Calendar.current.dateComponents([.day], from: Calendar.current.startOfDay(for: anchorDate),
                                                    to: Calendar.current.startOfDay(for: Date())).day ?? 0
        return Session(rawValue: ((anchorIndex + days) % 6 + 6) % 6)!
    }

    static func setToday(_ s: Session) {
        Shared.defaults.set(s.rawValue, forKey: "anchorIndex")
        Shared.defaults.set(Calendar.current.startOfDay(for: Date()), forKey: "anchorDate")
    }
}
