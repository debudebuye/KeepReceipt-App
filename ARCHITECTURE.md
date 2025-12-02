# Architecture

## Overview

KeepReceipt follows **Clean Architecture** principles with a feature-based modular structure.

## Layers

### 1. Domain Layer
**Location**: `lib/features/*/domain/`

Contains pure business logic with no dependencies on external frameworks.

- **Entities**: Core business objects (e.g., `Receipt`)
- **Repositories**: Abstract interfaces
- **Use Cases**: Single-responsibility business operations

### 2. Data Layer
**Location**: `lib/features/*/data/`

Implements repository interfaces and handles data sources.

- **Models**: Data transfer objects with serialization
- **Data Sources**: Local (Hive) data access
- **Repository Implementations**: Concrete implementations

### 3. Presentation Layer
**Location**: `lib/features/*/presentation/`

Handles UI and state management.

- **Pages**: Screen widgets
- **Providers**: Riverpod state management
- **Widgets**: Reusable UI components

## Data Flow

```
User Action (UI)
    ↓
Riverpod Provider
    ↓
Use Case (Domain)
    ↓
Repository Interface (Domain)
    ↓
Repository Implementation (Data)
    ↓
Data Source (Hive)
    ↓
Model → Entity
    ↓
Back to UI
```

## Feature Structure

```
features/
└── receipt/
    ├── data/
    │   ├── datasources/
    │   ├── models/
    │   └── repositories/
    ├── domain/
    │   ├── entities/
    │   ├── repositories/
    │   └── usecases/
    └── presentation/
        ├── pages/
        └── providers/
```

## Key Principles

- **Separation of Concerns**: Each layer has a specific responsibility
- **Dependency Inversion**: Domain layer has no dependencies
- **Single Responsibility**: Each class has one reason to change
- **Testability**: Easy to test each layer independently

## Technology Stack

| Layer | Technology |
|-------|-----------|
| State Management | Riverpod |
| Local Database | Hive |
| Routing | GoRouter |
| DI | GetIt |
| Functional | Dartz |

## Error Handling

Uses functional error handling with `Either<Failure, T>`:

```dart
Future<Either<Failure, Receipt>> addReceipt(Receipt receipt);
```

## Testing Strategy

- **Unit Tests**: Domain layer (use cases, entities)
- **Widget Tests**: Presentation layer (pages, widgets)
- **Integration Tests**: Full feature flows
