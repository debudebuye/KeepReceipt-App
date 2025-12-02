# KeepReceipt

A modern, offline-first receipt organizer built with Flutter and Clean Architecture.

[![Flutter](https://img.shields.io/badge/Flutter-3.0+-02569B?logo=flutter)](https://flutter.dev)
[![License](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Tests](https://img.shields.io/badge/Tests-9%2F9%20Passing-success)](test/)

## Features

- 📸 **Receipt Capture** - Take photos with camera or upload images
- 💾 **Offline Storage** - All data stored locally with Hive
- 🗜️ **Image Compression** - Automatic 60-80% file size reduction
- 🔍 **Search & Filter** - Find receipts by store, category, or date
- 📊 **Organize** - Categorize receipts for easy tracking
- 🔒 **Privacy First** - Your data never leaves your device
- 🌐 **Cross-Platform** - iOS, Android, and Web support

## Getting Started

### Prerequisites

- Flutter SDK 3.0 or higher
- Dart 3.0 or higher

### Installation

```bash
# Clone the repository
git clone https://github.com/debudebuye/KeepReceipt-App.git
cd KeepReceipt-App

# Install dependencies
flutter pub get

# Generate code
flutter pub run build_runner build --delete-conflicting-outputs

# Run the app
flutter run
```

### Running Tests

```bash
flutter test
```

## Architecture

This project follows **Clean Architecture** principles with a feature-based structure:

```
lib/
├── app/              # App configuration and routing
├── core/             # Shared utilities and base classes
└── features/         # Feature modules
    ├── receipt/      # Receipt management
    └── settings/     # App settings
```

### Key Technologies

- **State Management**: Riverpod
- **Local Database**: Hive
- **Routing**: GoRouter
- **Dependency Injection**: GetIt
- **Functional Programming**: Dartz

## Building for Production

### Android

```bash
flutter build apk --release
# or
flutter build appbundle --release
```

### iOS

```bash
flutter build ios --release
```

### Web

```bash
flutter build web --release
```

## Contributing

Contributions are welcome! Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on our code of conduct and the process for submitting pull requests.

## Documentation

- [Architecture](ARCHITECTURE.md) - Technical architecture details
- [Usage Guide](docs/USAGE.md) - How to use the app
- [Deployment](docs/DEPLOYMENT.md) - Deployment instructions
- [Security](SECURITY.md) - Security and privacy policy
- [Changelog](CHANGELOG.md) - Version history

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Privacy

KeepReceipt is designed with privacy in mind:
- All data is stored locally on your device
- No data is sent to external servers
- No tracking or analytics
- You have complete control over your data

## Support

For issues, questions, or suggestions:
- Open an issue on [GitHub Issues](https://github.com/debudebuye/KeepReceipt-App/issues)

---

**Made with ❤️ using Flutter**
