import ManagedSettings

enum Block {
    static let store = ManagedSettingsStore(named: .init("adultBlock"))

    /// Turns on Apple's built-in adult-site filter (Safari + WebKit views).
    static func apply() {
        store.webContent.blockedByFilter = .auto()
    }
}
