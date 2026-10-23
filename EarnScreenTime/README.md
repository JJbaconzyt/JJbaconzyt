# Earn Screen Time + PornBlock (iOS)

[Unverified] Written on Linux. NOT compiled or tested. Expect small fixes in Xcode.

## Build (both apps)
1. Mac + Xcode 15+, `brew install xcodegen`.
2. Edit `project.yml`: set `DEVELOPMENT_TEAM`, change `com.example` bundle IDs (and App Group in `Shared.swift` + entitlements for EarnScreenTime).
3. `xcodegen` -> open `.xcodeproj` -> run on a real iPhone (Screen Time APIs do not work in Simulator).
4. Needs paid Apple Developer account for Family Controls capability. [Unverified] Distribution entitlement needs Apple approval.

## EarnScreenTime
- Pick apps (TikTok, Instagram...) in app. Locked every day at 00:00.
- Do reps via camera (Vision pose). Unlocks till midnight.
- Exercise list skips muscles trained today/yesterday. Edit `App/Plan.swift` to match your real lifting.
- Rep thresholds need tuning on your phone.

## Weak spots (known)
- You can lower rep target, change picks, or revoke Screen Time access in Settings -> cheat.
- Camera counting can be fooled / miscount.
