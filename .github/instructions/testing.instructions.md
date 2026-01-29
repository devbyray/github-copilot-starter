---
description: '⚠️ DEPRECATED: This instruction file has been migrated to Agent Skills. See .github/skills/testing-tdd/'
applyTo: '**'
deprecated: true
migrated-to: '.github/skills/testing-tdd/SKILL.md'
---

# ⚠️ DEPRECATED

This instruction file has been migrated to **Agent Skills** for better performance and dynamic loading.

**New location**: [.github/skills/testing-tdd/SKILL.md](../skills/testing-tdd/SKILL.md)

Please refer to the new skill for all Testing & TDD standards.

---

# Original Content (For Reference)

# Testing & TDD Instructions

1. **Write the test first**:
    - Frontend: use Vitest.
    - Backend: use xUnit or MsTest (based on project).
    - Name tests clearly: `shouldDoSomethingWhenCondition()`.
2. **Generate code with Copilot** based on the test.
3. **Run tests** and iterate until all pass.

This ensures reliability and confidence when adding new features.
