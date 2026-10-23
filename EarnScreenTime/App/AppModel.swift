import SwiftUI
import FamilyControls
import DeviceActivity

@MainActor
final class AppModel: ObservableObject {
    @Published var selection = Shared.selection {
        didSet { Shared.selection = selection; Shared.lockIfNeeded() }
    }
    @Published var target: Int = {
        let t = Shared.defaults.integer(forKey: "target"); return t == 0 ? 25 : t
    }() {
        didSet { Shared.defaults.set(target, forKey: "target") }
    }
    @Published var unlocked = Shared.isUnlockedToday
    @Published var session = Cycle.today
    @Published var error: String?

    var allowed: [Exercise] { Exercise.allCases.filter { $0.isAllowed(on: session) } }

    func setup() async {
        do {
            try await AuthorizationCenter.shared.requestAuthorization(for: .individual)
            startDailyMonitor()
            Shared.lockIfNeeded()
        } catch { self.error = "Screen Time access failed: \(error.localizedDescription)" }
        refresh()
    }

    func refresh() {
        unlocked = Shared.isUnlockedToday
        session = Cycle.today
    }

    func setToday(_ s: Session) { Cycle.setToday(s); refresh() }

    func complete() { Shared.unlockForToday(); refresh() }

    private func startDailyMonitor() {
        let center = DeviceActivityCenter()
        let name = DeviceActivityName("daily")
        guard !center.activities.contains(name) else { return }
        let schedule = DeviceActivitySchedule(
            intervalStart: DateComponents(hour: 0, minute: 0),
            intervalEnd: DateComponents(hour: 23, minute: 59),
            repeats: true)
        try? center.startMonitoring(name, during: schedule)
    }
}
