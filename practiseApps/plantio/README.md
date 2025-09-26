# Plantio (Flutter Practice App)

A Flutter app built as part of practice projects to explore Flutter development.

## Features

- 🌱 Basic plant/gardening themed UI  check theme (https://www.figma.com/design/RnEEzie3TkRN8PSb1tWn0s/Plant-App-Freebies--Community-?node-id=8-274&p=f&t=0T6pqxPEx7biBWbd-0)
- 📱 Cross-platform support (Android, iOS, Web, Desktop depending on setup)  
- 🔌 Plugin integration for platform-specific behavior  

## Getting Started

### Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install) installed (latest stable version recommended)  
- Dart SDK (comes bundled with Flutter)  
- A device, emulator, or simulator set up for testing

### Installation & Run

Clone this repository and navigate to the project folder:

```bash
git clone https://github.com/Alionit01/Flutter_Practice.git
cd Flutter_Practice/practiseApps/plantio
```

(Optional) clean previous builds:

```bash
flutter clean
```

Get dependencies:

```bash
flutter pub get
```

Run the app:

```bash
flutter run
```

To target a specific platform/device:

```bash
flutter run -d <device_id>
```

For web:

```bash
flutter run -d chrome
```

For desktop (if enabled):

```bash
flutter run -d windows
flutter run -d macos
flutter run -d linux
```

## Project Structure

```
lib/                  — main Dart source code  
assets/               — images, fonts, and other resources  
android/              — Android native code  
ios/                  — iOS native code  
linux/, macos/, etc.  — platform-specific code  
pubspec.yaml          — project dependencies & assets  
```

## Notes

- Ensure you are on the **stable** Flutter channel for best results.  
- Line-ending warnings (LF/CRLF) are safe to ignore on Windows.  
- This project is for **practice and learning** purposes, so expect experimental features.  

## License

MIT © 2025 Ali ur Rehman
