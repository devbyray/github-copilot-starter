---
description: Guidelines for writing JavaScript/TypeScript code that is simple, readable, and maintainable. Focus on structure, organization, naming conventions, and performance.
applyTo: "**/*.{js,jsx,ts,tsx,svelte,vue,cjs,mjs}"
---

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
