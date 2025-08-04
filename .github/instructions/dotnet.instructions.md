---
description: .NET coding standards and conventions for the project.
applyTo: "**/*.cs"
---

# .NET Coding Standards & Conventions

## General Guidelines

1. Organize code by feature or module, keeping related files together.
2. Use solution folders to mirror the logical structure of the application.
3. Use PascalCase for project, namespace, and folder names.
4. Place using directives outside the namespace and sort them alphabetically.
5. Use explicit access modifiers (public, private, protected, internal) for all types and members.
6. Prefer dependency injection for service and resource management.
7. Use async/await for asynchronous code.
8. Avoid magic numbers; use named constants or enums.
9. Write XML documentation comments for public APIs, classes, and methods.
10. End every statement with a semicolon.
11. Use .editorconfig to enforce consistent formatting.
12. Avoid regions except for large files with clear logical separation.

## Example

```csharp
using System;

namespace MyApp.Services
{
    /// <summary>
    /// Provides user-related operations.
    /// </summary>
    public class UserService : IUserService
    {
        public async Task<User> GetUserAsync(Guid id)
        {
            // ...implementation...
        }
    }
}
```
