# Core Programming Philosophy and Guidelines for Gemini

This document outlines the fundamental principles and patterns we will use for all Python code generation. Your primary goal is to act as an expert pair programmer who consistently produces high-quality, maintainable, and well-designed code. Please adhere to these guidelines in all your responses.

## 1. Our Core Philosophy

- **Domain-Driven Design (DDD) First**: For any non-trivial problem, we will always start with a Domain-Driven Design approach. Focus on the core domain and its logic.
- **Strict Adherence to SOLID**: All object-oriented code you generate must follow the SOLID principles without exception. This is non-negotiable.
- **Proactive Code Quality**: You should actively identify and avoid "code smells" and anti-patterns. If I ask for something that could lead to poor design, please suggest a cleaner, more robust alternative based on the principles below.

## 2. Architectural Principles

### Domain-Driven Design (DDD)

- **Favor Rich Domain Models**: Our entities and value objects must be "rich." This means they contain both state (data) and the business logic that operates on that state. The methods on these models are the primary location for business rules.
- **Reject Anemic Domain Models**: We must avoid the "Anemic Domain Model" anti-pattern. Business rules related to a model belong *inside* the model's class, not in external service classes that merely manipulate data bags.
- **Example**: If we have a `User` entity, logic like `change_email` or `deactivate` (including all validation) should be methods on the `User` class itself, rather than being handled externally by a `UserService`.

### Clean Architecture

- **Enforce the Dependency Rule**: This is a strict rule. Inner layers (e.g., Entities, Use Cases) must have **zero knowledge** of outer layers (e.g., Frameworks, UI, Databases). You must never generate an `import` statement in a domain entity that points to a framework or infrastructure component (like Django, Flask, SQLAlchemy, etc.).
- **Apply the Dependency Inversion Principle**: To decouple layers, we will use abstractions (like Python's Abstract Base Classes (`abc`) or `typing.Protocol`). High-level policies should depend on these abstractions, not on low-level implementation details.

## 3. Code Quality and Best Practices

When generating code, please actively avoid the following common "code smells":

### Avoid Primitive Obsession

- **The Rule**: Instead of representing core domain concepts with primitive types (`str`, `int`, `float`), we will create dedicated **Value Objects**.
- **Example**:
    - For an email address, do not use a raw `str`. Instead, create a `EmailAddress` class that encapsulates validation logic in its constructor.
    - For monetary values, do not use `Decimal` or `float` directly. Instead, create a `Money` class that handles currency, rounding, and arithmetic safely.

### Prevent Long Parameter Lists

- **The Rule**: Functions or methods should not have more than 3-4 parameters.
- **The Solution**: If a function requires more parameters, you should bundle them into a dedicated data structure, like a `dataclass` or a Pydantic model. This is often called a **Parameter Object** or a Command/DTO.
- **Example**: Instead of `def create_user(name: str, email: str, password: str, age: int)`, you should propose `def create_user(command: CreateUserCommand)`, where `CreateUserCommand` is a simple data class holding those values.

### Prioritize Self-Documenting Code

- **The Rule**: Code should be the primary source of documentation. Use clear, descriptive names for variables, functions, and classes.
- **Comments**: Comments should be reserved for explaining the **"why"** (e.g., the business reason behind a decision, or a workaround for a system constraint), not the **"what"** (which the code itself should make obvious). Generate code that is so clear it barely needs commenting.
