---
description: '⚠️ DEPRECATED: This instruction file has been migrated to Agent Skills. See .github/skills/commit-conventions/'
applyTo: '**'
tool: git
deprecated: true
migrated-to: '.github/skills/commit-conventions/SKILL.md'
---

# ⚠️ DEPRECATED

This instruction file has been migrated to **Agent Skills** for better performance and dynamic loading.

**New location**: [.github/skills/commit-conventions/SKILL.md](../skills/commit-conventions/SKILL.md)

**Bonus**: The new skill includes an executable validation script at `commit-conventions/scripts/validate-commit.sh`!

Please refer to the new skill for all commit message standards.

---

# Original Content (For Reference)

# Commit Message Instructions

Writing clear and consistent commit messages is important for keeping the code history understandable and traceable. Follow the **Conventional Commits** format:

### **Commit Message Structure**

```
<type>[scope]: <short description>
```

- **`<type>`**: The type of change:
    - `feat`: New feature.
    - `fix`: Bug fix.
    - `docs`: Documentation changes.
    - `style`: Code formatting without functional changes.
    - `refactor`: Improvements to existing code without new features.
    - `test`: Adding or updating tests.
    - `chore`: Maintenance tasks, like dependency updates.

- **`[scope]`** _(optional)_: The component, module, or section you worked on.
- **`<short description>`**: Briefly describe the change in present tense (max. 50-72 characters).

---

### **Commit Message Rules**

1. **Concise and specific**: Use a maximum of 50-72 characters for the short description.
2. **Present tense**: For example, "Add validation" instead of "Added validation".
3. **No period at the end**: End the short description without a period.

---

### **Examples**

#### New Feature

```
feat(header): add dropdown menu to navbar
```

#### Bug Fix

```
fix(api): resolve error when fetching user data
```

#### Documentation

```
docs(readme): add installation instructions
```

#### Refactor

```
refactor(utils): restructure formatting logic
```

#### Tests

```
test(auth): add tests for password recovery
```

#### Maintenance

```
chore(dependencies): update axios to v1.3.0
```

With these guidelines, you write consistent commit messages that help keep the codebase maintainable.
