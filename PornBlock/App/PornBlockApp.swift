import SwiftUI
import FamilyControls
import DeviceActivity

@main
struct PornBlockApp: App {
    @State private var status = "Starting..."

    var body: some Scene {
        WindowGroup {
            VStack(spacing: 16) {
                Image(systemName: "shield.lefthalf.filled").font(.system(size: 64))
                Text(status).multilineTextAlignment(.center)
                Text("No off switch in this app.").font(.footnote)
            }
            .padding()
            .task { await enable() }
        }
    }

    private func enable() async {
        do {
            try await AuthorizationCenter.shared.requestAuthorization(for: .individual)
            Block.apply()
            let center = DeviceActivityCenter()
            let name = DeviceActivityName("daily")
            if !center.activities.contains(name) {
                try? center.startMonitoring(name, during: DeviceActivitySchedule(
                    intervalStart: DateComponents(hour: 0, minute: 0),
                    intervalEnd: DateComponents(hour: 23, minute: 59),
                    repeats: true))
            }
            status = "Adult sites blocked."
        } catch {
            status = "Needs Screen Time access: \(error.localizedDescription)"
        }
    }
}
