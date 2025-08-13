---
applyTo: "*.py,**/*.py"
---

# Copilot Code Generation Guidelines

## 1. Core Philosophy
- When I ask you to solve complex domain problems, please prioritize a Domain-Driven Design (DDD) approach.
- For all Object-Oriented Programming (OOP) suggestions, strictly adhere to SOLID principles.
- Maintain high code quality and actively avoid generating code with "bad smells".

## 2. Architecture and Design Patterns

### Domain-Driven Design (DDD)
- **Rich Domain Models**: Your generated domain models (entities, value objects) MUST encapsulate business logic and rules. Methods on these models should operate on their own state.
- **AVOID Anemic Domain Models**: Do not suggest domain models that are just bags of properties with getters and setters. Business logic should NOT be placed exclusively in service classes (Transaction Script pattern).
- **Example**: Instead of a `UserService` that validates and manipulates a `User` object from the outside, the validation logic (e.g., `changeEmail`, `deactivate`) should be a method within the `User` class itself.

### Clean Architecture
- **Dependency Rule**: When suggesting architectural layers (e.g., Use Cases, Entities, Infrastructure), you MUST enforce the Dependency Rule. Inner layers (e.g., Entities) must NEVER depend on or import anything from outer layers (e.g., Frameworks, UI, Databases).
- **Dependency Inversion**: Use interfaces (or abstract classes) in inner layers and implement them in outer layers to invert control flow.

## 3. SOLID Principles (For OOP)

- **Single Responsibility Principle (SRP)**: A class should have only one reason to change.
- **Open/Closed Principle (OCP)**: Software entities should be open for extension, but closed for modification.
- **Liskov Substitution Principle (LSP)**: Subtypes must be substitutable for their base types.
- **Interface Segregation Principle (ISP)**: Clients should not be forced to depend on interfaces they do not use.
- **Dependency Inversion Principle (DIP)**: High-level modules should not depend on low-level modules. Both should depend on abstractions.

## 4. Code Quality and "Bad Smells" to Avoid

- **Primitive Obsession**:
  - **DO NOT** use primitive types (string, int, bool) to represent domain concepts.
  - **DO** suggest creating simple Value Objects. For example, instead of `string email`, create a `EmailAddress` class that encapsulates validation and behavior. Instead of `decimal price`, create a `Money` value object.

- **Long Parameter List**:
  - **AVOID** generating functions or methods with more than 3-4 parameters.
  - **DO** suggest grouping parameters into a dedicated object (Parameter Object / DTO). For instance, instead of `createUser(string name, string email, string password, int age)`, suggest `createUser(CreateUserCommand command)`.

- **Comments as Crutches**: Generate self-documenting code. Use clear naming for variables, methods, and classes instead of relying on comments to explain complex logic. Comments should explain *why*, not *what*.
