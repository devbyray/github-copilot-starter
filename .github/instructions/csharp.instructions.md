---
description: '⚠️ DEPRECATED: This instruction file has been migrated to Agent Skills. See .github/skills/csharp-standards/'
applyTo: '**/*.cs'
deprecated: true
migrated-to: '.github/skills/csharp-standards/SKILL.md'
---

# ⚠️ DEPRECATED

This instruction file has been migrated to **Agent Skills** for better performance and dynamic loading.

**New location**: [.github/skills/csharp-standards/SKILL.md](../skills/csharp-standards/SKILL.md)

Please refer to the new skill for all C# standards.

---

# Original Content (For Reference)

# C# Coding Standards & Conventions

## General Guidelines

1. Use PascalCase for class, interface, enum, and method names.
2. Use camelCase for local variables and parameters.
3. Use explicit access modifiers (public, private, protected, internal) for all types and members.
4. Prefer expression-bodied members for simple properties and methods.
5. Use var for local variable declarations when the type is obvious from the right side of the assignment; otherwise, use the explicit type.
6. Always use braces `{}` for all control flow statements (if, else, for, foreach, while, etc.), even for single statements.
7. Use single quotes for char literals and double quotes for string literals.
8. Prefer pattern matching and modern C# features where appropriate.
9. Avoid magic numbers; use named constants or enums.
10. Write XML documentation comments for public APIs, classes, and methods.
11. End every statement with a semicolon.

## Example

```csharp
/// <summary>
/// Calculates the sum of two integers.
/// </summary>
public static int Add(int a, int b)
{
    return a + b;
}
```
