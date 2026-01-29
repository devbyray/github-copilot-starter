---
name: commit-conventions
description: Standards for writing clear and consistent commit messages using Conventional Commits format. Use when making git commits, reviewing commit history, creating pull requests, or when the user asks about commit message formatting, git workflows, or version control best practices.
metadata:
  author: devbyray
  version: "1.0"
  standard: "conventional-commits"
  tool: "git"
---

# Commit Message Conventions

Writing clear and consistent commit messages is essential for maintaining an understandable and traceable code history. Follow the **Conventional Commits** format.

## Commit Message Structure

```
<type>[scope]: <short description>

[optional body]

[optional footer]
```

### Components

**`<type>`** (required) - The type of change:
- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation changes
- `style`: Code formatting without functional changes
- `refactor`: Code improvements without new features
- `test`: Adding or updating tests
- `chore`: Maintenance tasks (dependency updates, config changes)
- `perf`: Performance improvements
- `ci`: CI/CD configuration changes
- `build`: Build system or dependency changes

**`[scope]`** (optional) - The component, module, or section affected:
- Examples: `(auth)`, `(api)`, `(ui)`, `(header)`, `(footer)`

**`<short description>`** (required) - Brief description of the change:
- Max 50-72 characters
- Use present tense
- Lowercase start (after type)
- No period at the end

**`[body]`** (optional) - Detailed explanation:
- Wrap at 72 characters
- Explain what and why, not how
- Separate from description with blank line

**`[footer]`** (optional) - Breaking changes or issue references:
- `BREAKING CHANGE:` for breaking changes
- Issue references: `Closes #123`, `Fixes #456`

## Commit Message Rules

1. **Concise and specific**: Keep description under 72 characters
2. **Present tense**: Use "Add" not "Added", "Fix" not "Fixed"
3. **No period**: Don't end the description with a period
4. **Imperative mood**: Write as if giving a command
5. **Clear scope**: Use scope to indicate what part of the codebase changed

## Examples

### New Feature
```
feat(header): add dropdown menu to navbar
```

### Bug Fix
```
fix(api): resolve error when fetching user data
```

### Documentation
```
docs(readme): add installation instructions
```

### Code Refactor
```
refactor(utils): restructure formatting logic
```

### Tests
```
test(auth): add tests for password recovery
```

### Maintenance
```
chore(dependencies): update axios to v1.3.0
```

### Performance
```
perf(images): optimize image loading with lazy loading
```

### Breaking Change
```
feat(api): change authentication endpoint structure

BREAKING CHANGE: The /auth endpoint now returns a different response structure.
Clients must update to handle the new format.
```

### With Issue Reference
```
fix(login): prevent memory leak on logout

The logout function was not properly cleaning up event listeners,
causing a memory leak after repeated login/logout cycles.

Fixes #234
```

### Multiple Scopes
```
feat(api, ui): add user profile avatar upload
```

## Bad Examples (Don't Do This)

❌ `Fixed bug` - Too vague, missing type and scope
❌ `feat: Added new feature.` - Has period, past tense
❌ `update readme` - Missing type
❌ `feat(API): Add Feature` - Uppercase scope and description
❌ `WIP commit` - Not descriptive, use proper type

## Good Examples (Do This)

✅ `feat(auth): add two-factor authentication`
✅ `fix(cart): resolve total calculation error`
✅ `docs(api): update endpoint documentation`
✅ `refactor(user-service): simplify user validation logic`
✅ `test(checkout): add integration tests for payment flow`

## Commit Frequency

- Commit early and often
- Each commit should be a logical unit of work
- Commits should not break the build
- Group related changes together

## When to Apply

Apply these conventions when:
- Making any git commit
- Creating pull requests
- Reviewing commit history
- Setting up git hooks
- Generating changelogs
- User asks about commit standards

## Tools

Consider using these tools to enforce commit conventions:
- **commitlint**: Lint commit messages
- **husky**: Git hooks for validation
- **commitizen**: Interactive commit message builder
- **standard-version**: Automated versioning and changelog
