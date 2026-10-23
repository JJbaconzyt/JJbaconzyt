import DeviceActivity

/// Re-applies the filter at the start of every day.
class MonitorExtension: DeviceActivityMonitor {
    override func intervalDidStart(for activity: DeviceActivityName) {
        super.intervalDidStart(for: activity)
        Block.apply()
    }
}
