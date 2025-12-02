# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.0] - 2024-12-02

### Added
- Receipt capture using camera (iOS, Android, Web)
- Image compression (60-80% file size reduction)
- Local storage with Hive database
- Manual receipt entry (store name, amount, date, category, notes)
- Search and filter functionality
- Receipt list and detail views
- Data validation for all input fields
- Error handling with user-friendly messages
- Privacy Policy page
- Terms of Service page
- Settings page
- Unit tests for critical paths (9 tests)
- Clean Architecture implementation
- Cross-platform support (iOS, Android, Web)

### Technical
- Riverpod for state management
- Hive for local database
- GoRouter for navigation
- GetIt for dependency injection
- Dartz for functional error handling
- Image compression with image package
- Camera and image_picker for photo capture

### Security
- 100% offline operation
- No data transmission
- Local-only storage
- Privacy-first design
- No tracking or analytics

[1.0.0]: https://github.com/debudebuye/KeepReceipt-App/releases/tag/v1.0.0
