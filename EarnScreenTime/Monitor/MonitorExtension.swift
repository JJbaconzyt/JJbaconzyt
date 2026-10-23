import DeviceActivity

/// Runs at the start of every day (00:00) and re-locks the apps.
class MonitorExtension: DeviceActivityMonitor {
    override func intervalDidStart(for activity: DeviceActivityName) {
        super.intervalDidStart(for: activity)
        Shared.lockIfNeeded()
    }
}
