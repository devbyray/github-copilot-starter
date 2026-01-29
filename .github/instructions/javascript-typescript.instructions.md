---
description: '⚠️ DEPRECATED: This instruction file has been migrated to Agent Skills. See .github/skills/javascript-typescript-standards/'
applyTo: '**/*.{js,jsx,ts,tsx,svelte,vue,cjs,mjs}'
deprecated: true
migrated-to: '.github/skills/javascript-typescript-standards/SKILL.md'
---

# ⚠️ DEPRECATED

This instruction file has been migrated to **Agent Skills** for better performance and dynamic loading.

**New location**: [.github/skills/javascript-typescript-standards/SKILL.md](../skills/javascript-typescript-standards/SKILL.md)

## Why the Migration?

Agent Skills provide:

- 🚀 Dynamic loading (only when working with JS/TS files)
- 📦 ~70% reduction in constant context usage
- 🔍 Better discoverability
- 📚 Support for executable scripts and references

Please refer to the new skill for all JavaScript/TypeScript standards.

---

# Original Content (For Reference)

## Coding standards

- Use JavaScript with ES2022 features and Node.js (22+) ESM modules
- Use Node.js built-in modules and avoid external dependencies where possible
- Ask the user if you require any additional dependencies before adding them
- Always use async/await for asynchronous code
- Keep the code simple, readable, and maintainable
- Use descriptive variable and function names
- Do not add comments unless absolutely necessary, the code should be self-explanatory
- Never use `null`, always use `undefined` for optional values
- Prefer functions over classes
- Use arrow functions for callbacks
- Use `const` for variables that are not reassigned, and `let` for those that are
- Use template literals for strings that require interpolation
- Use destructuring for objects and arrays where appropriate
- Use `for...of` loops for iterating over arrays and `for...in` loops for iterating over objects
- Use semicolons at the end of statements
- Prefer single quotes for strings
- Use function-based components
- Use arrow functions for callbacks
- Organize code by feature/module
- Write clear, concise JSDoc/TSDoc comments

## Testing

- Use Vitest for testing
- Write tests for all new features and bug fixes
- Ensure tests cover edge cases and error handling
- NEVER change the original code to make it easier to test, instead, write tests that cover the original code as it is
