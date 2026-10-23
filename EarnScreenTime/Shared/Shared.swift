import Foundation
import FamilyControls
import ManagedSettings

/// State shared between the app and the Monitor extension (via App Group).
enum Shared {
    static let groupID = "group.com.example.earnscreentime"
    static let defaults = UserDefaults(suiteName: groupID) ?? .standard
    static let store = ManagedSettingsStore(named: .init("earn"))

    static var selection: FamilyActivitySelection {
        get {
            defaults.data(forKey: "selection")
                .flatMap { try? JSONDecoder().decode(FamilyActivitySelection.self, from: $0) }
                ?? FamilyActivitySelection()
        }
        set { defaults.set(try? JSONEncoder().encode(newValue), forKey: "selection") }
    }

    static var isUnlockedToday: Bool {
        guard let d = defaults.object(forKey: "unlockedOn") as? Date else { return false }
        return Calendar.current.isDateInToday(d)
    }

    static func unlockForToday() {
        defaults.set(Date(), forKey: "unlockedOn")
        store.clearAllSettings()
    }

    /// Shields the chosen apps/sites unless today's workout is already done.
    static func lockIfNeeded() {
        guard !isUnlockedToday else { return }
        let s = selection
        store.shield.applications = s.applicationTokens.isEmpty ? nil : s.applicationTokens
        store.shield.webDomains = s.webDomainTokens.isEmpty ? nil : s.webDomainTokens
        store.shield.applicationCategories = s.categoryTokens.isEmpty ? nil : .specific(s.categoryTokens)
        store.shield.webDomainCategories = s.categoryTokens.isEmpty ? nil : .specific(s.categoryTokens)
    }
}
