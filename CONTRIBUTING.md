# Contributing to KeepReceipt

Thank you for your interest in contributing to KeepReceipt!

## Getting Started

1. Fork the repository
2. Clone your fork: `git clone https://github.com/debudebuye/KeepReceipt-App.git`
3. Create a branch: `git checkout -b feature/your-feature-name`
4. Make your changes
5. Run tests: `flutter test`
6. Commit your changes: `git commit -m 'Add some feature'`
7. Push to your fork: `git push origin feature/your-feature-name`
8. Open a Pull Request

## Development Setup

```bash
# Install dependencies
flutter pub get

# Generate code
flutter pub run build_runner build --delete-conflicting-outputs

# Run tests
flutter test

# Run the app
flutter run
```

## Code Style

- Follow the [Dart Style Guide](https://dart.dev/guides/language/effective-dart/style)
- Use `flutter analyze` to check for issues
- Format code with `dart format .`

## Testing

### Unit Tests

- Write unit tests for new features in the `test/` directory
- Use mocks for external dependencies (repositories, services, etc.)
- Unit tests run in isolation without platform plugins
- Run with: `flutter test`

### Integration Tests

- For tests requiring platform plugins (sqflite, path_provider, etc.), use the `integration_test/` directory
- Integration tests run on actual devices/emulators with full platform support
- Run with: `flutter test integration_test/`

### Guidelines

- Ensure all tests pass before submitting PR
- Aim for good test coverage
- Mock platform-dependent code in unit tests
- Use integration tests for end-to-end scenarios

## Pull Request Process

1. Update the README.md with details of changes if needed
2. Ensure all tests pass
3. Update documentation as needed
4. The PR will be merged once approved by maintainers

## Code of Conduct

- Be respectful and inclusive
- Focus on constructive feedback
- Help others learn and grow

## Questions?

Feel free to open an issue for any questions or concerns.
