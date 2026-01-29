---
name: javascript-typescript-standards
description: Guidelines for writing JavaScript and TypeScript code that is simple, readable, and maintainable. Use when working with .js, .jsx, .ts, .tsx, .mjs, .cjs files, or when the user asks about JavaScript/TypeScript coding standards, ES2022 features, Node.js modules, async/await patterns, or testing with Vitest.
metadata:
    author: devbyray
    version: '1.0'
    languages: 'javascript, typescript'
    frameworks: 'node.js, vitest'
---

# JavaScript/TypeScript Standards

Apply these standards when writing or reviewing JavaScript/TypeScript code.

## Core Coding Standards

### Language Features

- Use JavaScript with ES2022 features and Node.js (22+) ESM modules
- Use Node.js built-in modules and avoid external dependencies where possible
- Ask the user if you require any additional dependencies before adding them
- Always use async/await for asynchronous code

### Code Quality

- Keep the code simple, readable, and maintainable
- Use descriptive variable and function names
- Do not add comments unless absolutely necessary, the code should be self-explanatory
- Never use `null`, always use `undefined` for optional values

### Syntax Preferences

- Prefer functions over classes
- Use arrow functions for callbacks
- Use `const` for variables that are not reassigned, and `let` for those that are
- Use template literals for strings that require interpolation
- Use destructuring for objects and arrays where appropriate
- Use `for...of` loops for iterating over arrays and `for...in` loops for iterating over objects
- Use semicolons at the end of statements
- Prefer single quotes for strings

### Component & Module Structure

- Use function-based components
- Use arrow functions for callbacks
- Organize code by feature/module
- Write clear, concise JSDoc/TSDoc comments when necessary

## Testing Standards

### Framework

- Use Vitest for testing

### Best Practices

- Write tests for all new features and bug fixes
- Ensure tests cover edge cases and error handling
- Name tests clearly: `shouldDoSomethingWhenCondition()`
- **NEVER change the original code to make it easier to test**; instead, write tests that cover the original code as it is

## Examples

### Good: Modern async/await

```javascript
const fetchUserData = async userId => {
	const response = await fetch(`/api/users/${userId}`)
	const data = await response.json()
	return data
}
```

### Bad: Promises with .then()

```javascript
const fetchUserData = userId => {
	return fetch(`/api/users/${userId}`)
		.then(response => response.json())
		.then(data => data)
}
```

### Good: Descriptive names and const

```javascript
const maxRetryAttempts = 3
const isValidEmail = email => /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)
```

### Bad: Unclear names and var

```javascript
var x = 3
var check = e => /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(e)
```

### Good: Template literals and destructuring

```javascript
const getUserGreeting = ({ firstName, lastName }) => {
	return `Hello, ${firstName} ${lastName}!`
}
```

### Bad: String concatenation

```javascript
const getUserGreeting = user => {
	return 'Hello, ' + user.firstName + ' ' + user.lastName + '!'
}
```

## When to Apply

Apply these standards when:

- Creating new JavaScript/TypeScript files
- Reviewing or refactoring existing code
- User asks about JavaScript/TypeScript best practices
- Working with Node.js projects
- Writing or reviewing tests with Vitest
