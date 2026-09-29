# DuoCameraDemo

A minimal SwiftUI app that tests the iPhone Duo camera capture accessory.

## What it tests

On iPhone Duo, a camera app can show extra UI on the outer display while its main UI stays on the inner display. The API is `CameraCaptureAccessory` (iOS 27.1).

This app:

- Shows the rear camera preview on the inner display.
- Shows a "Smile!" screen on the outer display with `.sceneAccessory { CameraCaptureAccessory { ... } }`.
- Shows whether the outer display is available (from `.onAvailabilityChange`).
- Has a toggle that turns the outer display content on and off (`isEnabled:`).

The system makes the accessory available only when the app is full screen on the inner display and has an active camera session.

## Requirements

- Xcode 27.1 or later
- A physical iPhone Duo or the iPhone Duo simulator (iOS 27.1 or later)

## Run

1. Open `DuoCameraDemo.xcodeproj`.
2. Set your development team in Signing & Capabilities.
3. Select a physical iPhone Duo or the iPhone Duo simulator and run.
4. Allow camera access.
