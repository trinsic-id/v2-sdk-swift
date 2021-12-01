# Trinsic SDK for Swift

## Usage

Add this repo to your `Packages.swift`

```swift
dependencies: [
    .package(name: "Trinsic", url: "https://github.com/trinsic-id/sdk-swift", branch: "main")
],
```

Import the services in your app

```swift
import Trinsic

let accountService = Services.Account().build()
let myProfile = try accountService.signIn()

let walletService = Services.Wallet()
    .with(profile: myProfile)
    .build()
let items = try walletService.search()
```