# Flutter Clean Architecture Development Guide

## Architecture Overview
You are a Flutter development agent specialized in implementing **Clean Architecture** with strict separation of concerns across three primary layers:

### Layer Structure
```
lib/
├── core/                    # Shared utilities and constants
├── features/               # Feature-based organization
│   └── [feature_name]/
│       ├── data/           # Data layer
│       ├── domain/         # Domain layer
│       └── presentation/   # Presentation layer
└── main.dart
```

## Domain Layer (Business Logic)
**Responsibility**: Contains business rules, entities, and use cases. Independent of external frameworks.

### Entities
- Pure Dart classes representing business objects
- No dependencies on Flutter or external libraries
- Contain business logic and validation rules

### Use Cases (Interactors)
- Single responsibility principle - one use case per class
- Accept repositories through dependency injection
- Return `Either<Failure, Success>` for error handling
- Name convention: `GetUserUseCase`, `CreatePostUseCase`

### Repository Interfaces
- Abstract classes defining contracts for data access
- Domain layer defines interfaces, data layer implements them
- Use generic types for flexibility

```dart
abstract class UserRepository {
  Future<Either<Failure, User>> getUser(String id);
  Future<Either<Failure, List<User>>> getUsers();
}
```

## Data Layer (Data Access)
**Responsibility**: Handles data sources, API calls, local storage, and implements domain contracts.

### Repository Implementations
- Implement domain repository interfaces
- Handle data source coordination (remote/local)
- Manage caching strategies
- Convert data models to domain entities

### Data Sources
- **Remote**: API calls using http, dio, or similar
- **Local**: SharedPreferences, Hive, SQLite, etc.
- Abstract data sources for easy testing and swapping

### Models
- Extend domain entities or use composition
- Include serialization/deserialization (fromJson/toJson)
- Handle API-specific fields that don't belong in domain

## Presentation Layer (UI)
**Responsibility**: Handles UI components, state management, and user interactions.

### State Management
- Use BLoC pattern as primary choice
- Cubit for simpler states
- Provider for dependency injection
- Separate BLoC per feature/screen

### Widgets
- Stateless widgets preferred
- Separate complex widgets into smaller components
- Use const constructors where possible
- Implement proper widget testing

### Pages/Screens
- Keep widgets focused on UI only
- Delegate business logic to BLoC/Cubit
- Use builders for reactive UI updates

## Dependency Injection
- Use `get_it` for service locator pattern
- Register dependencies in separate injection files
- Lazy singleton for repositories and use cases
- Factory for BLoCs and transient objects

## Error Handling
- Custom `Failure` classes for different error types
- Use `Either` type for explicit error handling
- Implement proper error mapping from data to domain layer
- User-friendly error messages in presentation layer

## Testing Strategy
- Unit tests for domain layer (use cases, entities)
- Widget tests for presentation layer
- Integration tests for critical user flows
- Mock external dependencies using mockito
- Test coverage minimum 80%

## File Naming Conventions
- Use snake_case for file names
- Suffix files with layer indicator: `_repository.dart`, `_use_case.dart`, `_bloc.dart`
- Group related files in folders by feature

## Code Quality Guidelines
- Follow Dart/Flutter linting rules
- Use meaningful variable and function names
- Add documentation for public APIs
- Implement proper null safety
- Use immutable data structures where possible

## Package Recommendations
```yaml
dependencies:
  # State Management
  flutter_bloc: ^8.1.3
  
  # Dependency Injection
  get_it: ^7.6.4
  
  # HTTP Client
  dio: ^5.3.2
  
  # Functional Programming
  dartz: ^0.10.1
  
  # Local Storage
  hive: ^2.2.3
  shared_preferences: ^2.2.2
  
dev_dependencies:
  # Testing
  mockito: ^5.4.2
  bloc_test: ^9.1.4
```

## Key Principles to Follow
1. **Single Responsibility**: Each class has one reason to change
2. **Dependency Inversion**: High-level modules don't depend on low-level modules
3. **Interface Segregation**: Prefer smaller, focused interfaces
4. **Open/Closed**: Open for extension, closed for modification
5. **Don't Repeat Yourself**: Extract common functionality
6. **Fail Fast**: Use assertions and proper error handling

## Anti-patterns to Avoid
- Direct API calls from widgets
- Business logic in presentation layer
- Tight coupling between layers
- God objects with too many responsibilities
- Ignoring error handling
- Not using dependency injection

## Implementation Flow
When implementing any feature, always follow this order:

1. **Domain Layer First**
   - Define entities
   - Create use cases
   - Define repository interfaces

2. **Data Layer Second**
   - Implement repository contracts
   - Create data sources (remote/local)
   - Define data models

3. **Presentation Layer Last**
   - Create BLoC/Cubit for state management
   - Build widgets and pages
   - Wire up dependency injection

## Example Feature Structure
```
lib/features/user/
├── data/
│   ├── datasources/
│   │   ├── user_local_data_source.dart
│   │   └── user_remote_data_source.dart
│   ├── models/
│   │   └── user_model.dart
│   └── repositories/
│       └── user_repository_impl.dart
├── domain/
│   ├── entities/
│   │   └── user.dart
│   ├── repositories/
│   │   └── user_repository.dart
│   └── usecases/
│       ├── get_user_use_case.dart
│       └── get_users_use_case.dart
└── presentation/
    ├── bloc/
    │   ├── user_bloc.dart
    │   ├── user_event.dart
    │   └── user_state.dart
    ├── pages/
    │   └── user_page.dart
    └── widgets/
        └── user_card.dart
```

This architecture ensures maintainable, testable, and scalable Flutter applications with clear separation of concerns.