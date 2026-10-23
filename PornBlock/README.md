# PornBlock (iOS)

[Unverified] Not compiled or tested. Build steps: see `../EarnScreenTime/README.md` (same xcodegen flow).

## Honest limit
No iPhone app can make a block truly permanent. [Unverified] With Screen Time "individual" authorization, you can revoke the app's access in Settings, and deleting the app may drop the filter. The app has no off switch, nothing more.

## Stronger options
1. Set a Screen Time passcode someone else holds; apply Content & Privacy -> Web Content -> Limit Adult Websites.
2. `Hard-Lock.mobileconfig`: [Unverified] needs a *supervised* iPhone (Apple Configurator on Mac, wipes phone). Profile is non-removable without erasing the phone. Erase/restore still undoes it.
