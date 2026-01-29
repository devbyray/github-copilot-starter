# Migration Guide: Custom Instructions to Agent Skills

This document explains the migration from custom instructions to Agent Skills and the rationale behind each decision.

## Why Migrate?

Agent Skills offer several advantages over static custom instructions:

| Feature | Custom Instructions | Agent Skills |
|---------|---------------------|--------------|
| Loading | Always loaded (high token usage) | Loaded dynamically when needed |
| Discovery | Manual file references | Rich metadata for automatic discovery |
| Organization | Single file only | Main file + scripts + references |
| Execution | Instructions only | Can include executable scripts |
| Versioning | File-level only | Metadata versioning support |

## Migration Decision Matrix

### ✅ Migrated to Agent Skills

**Criteria**: Language/framework-specific, task-specific workflows, executable patterns

| Instruction File | Migrated To | Reason |
|-----------------|-------------|---------|
| javascript-typescript.instructions.md | javascript-typescript-standards | Language-specific style guide |
| vue.instructions.md | vue-development | Framework-specific patterns |
| nuxt.instructions.md | nuxt-development | Framework-specific workflows |
| css.instructions.md | css-standards | Language-specific guidelines |
| tailwind.instructions.md | tailwind-css | Framework-specific configuration |
| html.instructions.md | html-standards | Language-specific markup patterns |
| csharp.instructions.md | csharp-standards | Language-specific conventions |
| dotnet.instructions.md | dotnet-development | Framework-specific architecture |
| markdown.instructions.md | markdown-standards | Format-specific workflows |
| testing.instructions.md | testing-tdd | Specific task workflow (TDD) |
| commit.instructions.md | commit-conventions | Specific task workflow (commits) |

### 🔄 Remain as Custom Instructions

**Criteria**: Universal principles, always-applicable security/accessibility, cross-cutting concerns

| Instruction File | Reason to Keep |
|-----------------|----------------|
| best-practices.instructions.md | Universal architecture patterns (SOLID, DRY, KISS) apply to ALL code |
| security.instructions.md | Security must ALWAYS be considered (OWASP Top 10) |
| accessibility.instructions.md | Accessibility principles apply universally to all UI work |
| ui-guidelines.instructions.md | General design principles that transcend specific frameworks |
| config.instructions.md | Project-wide configuration standards |
| project-file-structure.instructions.md | Repository-wide structural conventions |

## Migration Benefits by Skill

### JavaScript/TypeScript Standards
**Before**: 42 lines always loaded
**After**: ~100 tokens for metadata, full skill loaded only when working with JS/TS files
**Benefit**: 80% reduction in constant context usage

### Vue Development
**Before**: 67 lines always loaded
**After**: Loaded only when working with .vue files
**Benefit**: Zero overhead when working on backend or documentation

### Testing TDD
**Before**: 30 lines always loaded
**After**: Loaded only when writing/running tests
**Benefit**: Can include test runner scripts in `scripts/` directory

### Commit Conventions
**Before**: 65 lines always loaded
**After**: Loaded when making commits, includes validation script
**Benefit**: Executable `validate-commit.sh` script available

## Skill Enhancements

Each migrated skill includes enhancements beyond the original instructions:

### 1. Rich Metadata
```yaml
metadata:
  author: devbyray
  version: "1.0"
  framework: "vue3"
  depends-on: "vue-development"
```

### 2. Better Discovery
```yaml
description: Coding standards for Vue.js 3 development with Composition API. 
  Use when working with .vue files, Vue components, composables, 
  or when the user asks about Vue.js patterns...
```

### 3. Executable Scripts
```
commit-conventions/
├── SKILL.md
└── scripts/
    └── validate-commit.sh  # Git hook for validation
```

### 4. Expanded Examples
Each skill includes more comprehensive examples and common patterns.

### 5. When to Apply Section
Clear guidance on when the skill should be activated.

## Token Usage Analysis

### Before Migration (All Custom Instructions)

```
Total always-loaded instructions: ~800 lines
Approximate tokens: ~16,000 tokens
```

### After Migration (Skills + Remaining Instructions)

```
Always loaded (Custom Instructions): ~200 lines (~4,000 tokens)
Skills metadata (all 11 skills): ~100 tokens each = ~1,100 tokens
Total baseline: ~5,100 tokens

Active skill when working: +2,000-5,000 tokens (only when relevant)
```

**Net Savings**: ~70% reduction in baseline context usage, with skills loaded only when needed.

## Implementation Notes

### Skill Format Compliance

All migrated skills follow the [Agent Skills specification](https://agentskills.io/specification):

- ✅ Valid YAML frontmatter with `name` and `description`
- ✅ Skill name matches directory name
- ✅ Description includes keywords and use cases
- ✅ Main file kept under 500 lines
- ✅ Optional scripts and references in subdirectories

### Naming Conventions

Skill names follow the spec requirements:
- Lowercase only
- Hyphens for separation (no underscores)
- No leading/trailing hyphens
- No consecutive hyphens
- 1-64 characters

### Dependencies

Some skills depend on others:
- `nuxt-development` depends on `vue-development`
- `dotnet-development` depends on `csharp-standards`

This is documented in the `metadata.depends-on` field.

## Future Enhancements

### Potential Additions

1. **Scripts Directory**
   - Linting scripts for each language
   - Test runners
   - Code formatters
   - Validation utilities

2. **References Directory**
   - Detailed API references
   - Framework-specific deep dives
   - Common patterns library
   - Troubleshooting guides

3. **Additional Skills**
   - `react-development`
   - `angular-development`
   - `python-standards`
   - `docker-workflows`
   - `ci-cd-patterns`

## Validation

To ensure skills are valid:

```bash
# Validate all skills
for skill in .github/skills/*/; do
  skills-ref validate "$skill"
done
```

## Rollback Plan

If issues arise, revert by:

1. Re-activating original `.instructions.md` files
2. Removing `@import` or skill activation
3. Keeping skills directory for future use

## Conclusion

The migration to Agent Skills provides:
- ✅ Significant reduction in baseline token usage
- ✅ Better organization and discoverability
- ✅ Ability to include executable scripts
- ✅ Progressive disclosure for complex documentation
- ✅ Independent versioning per skill
- ✅ Standards-compliant format

Universal principles (security, accessibility, SOLID) remain as custom instructions to ensure they're always considered.
