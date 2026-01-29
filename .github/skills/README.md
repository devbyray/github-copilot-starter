# Agent Skills

This directory contains Agent Skills following the [Agent Skills specification](https://agentskills.io/specification).

## What are Agent Skills?

Agent Skills are modular, discoverable instructions that AI agents can load dynamically based on the task at hand. Unlike static custom instructions that are always loaded, skills are activated only when relevant, reducing context overhead and improving performance.

## Skills in this Repository

### Language & Framework Standards

| Skill                                                                 | Description                            | When Used                               |
| --------------------------------------------------------------------- | -------------------------------------- | --------------------------------------- |
| [javascript-typescript-standards](./javascript-typescript-standards/) | JavaScript/TypeScript coding standards | Working with .js, .ts, .jsx, .tsx files |
| [csharp-standards](./csharp-standards/)                               | C# coding conventions                  | Working with .cs files                  |
| [css-standards](./css-standards/)                                     | CSS/SCSS/SASS best practices           | Working with stylesheets                |
| [html-standards](./html-standards/)                                   | HTML semantic markup & accessibility   | Working with HTML templates             |
| [markdown-standards](./markdown-standards/)                           | Markdown documentation standards       | Writing .md files                       |

### Framework-Specific Skills

| Skill                                       | Description                        | When Used                      |
| ------------------------------------------- | ---------------------------------- | ------------------------------ |
| [vue-development](./vue-development/)       | Vue.js 3 Composition API standards | Working with .vue components   |
| [nuxt-development](./nuxt-development/)     | Nuxt.js 3 development patterns     | Building Nuxt applications     |
| [dotnet-development](./dotnet-development/) | .NET project structure & patterns  | .NET/ASP.NET Core projects     |
| [tailwind-css](./tailwind-css/)             | Tailwind CSS v4+ usage             | Using Tailwind utility classes |

### Workflow Skills

| Skill                                       | Description                      | When Used                       |
| ------------------------------------------- | -------------------------------- | ------------------------------- |
| [testing-tdd](./testing-tdd/)               | Test-Driven Development workflow | Writing tests, implementing TDD |
| [commit-conventions](./commit-conventions/) | Conventional Commits standard    | Making git commits              |

## Skill Structure

Each skill follows the Agent Skills specification:

```
skill-name/
├── SKILL.md           # Main skill file with frontmatter and instructions
├── scripts/           # Executable scripts (optional)
│   └── example.sh
└── references/        # Additional reference docs (optional)
    └── REFERENCE.md
```

## Using Skills

Skills are automatically discovered by compatible AI agents. The agent will:

1. **Load metadata** (~100 tokens): Reads `name` and `description` from all skills at startup
2. **Activate skill** (<5000 tokens): Loads the full `SKILL.md` when relevant to the task
3. **Load resources** (as needed): Accesses scripts and reference files only when required

This progressive disclosure pattern keeps context usage efficient.

## Migrated from Custom Instructions

The following custom instructions have been converted to Agent Skills for better performance and discoverability:

- ✅ `javascript-typescript.instructions.md` → `javascript-typescript-standards`
- ✅ `vue.instructions.md` → `vue-development`
- ✅ `nuxt.instructions.md` → `nuxt-development`
- ✅ `css.instructions.md` → `css-standards`
- ✅ `tailwind.instructions.md` → `tailwind-css`
- ✅ `html.instructions.md` → `html-standards`
- ✅ `csharp.instructions.md` → `csharp-standards`
- ✅ `dotnet.instructions.md` → `dotnet-development`
- ✅ `markdown.instructions.md` → `markdown-standards`
- ✅ `testing.instructions.md` → `testing-tdd`
- ✅ `commit.instructions.md` → `commit-conventions`

## Remaining as Custom Instructions

These instructions remain as custom instructions because they contain universal architecture patterns that should always be active:

- `best-practices.instructions.md` - SOLID, DRY, KISS principles
- `security.instructions.md` - OWASP Top 10 security patterns
- `accessibility.instructions.md` - Universal accessibility guidelines
- `ui-guidelines.instructions.md` - General design principles

## Validation

To validate skill format:

```bash
# Install skills-ref (if available)
npm install -g @agentskills/skills-ref

# Validate a skill
skills-ref validate .github/skills/javascript-typescript-standards
```

## Contributing

When creating new skills:

1. Follow the [Agent Skills specification](https://agentskills.io/specification)
2. Include clear `name` and `description` in frontmatter
3. Keep main `SKILL.md` under 500 lines
4. Move detailed docs to `references/` directory
5. Add executable scripts to `scripts/` directory
6. Update this README with the new skill

## Benefits of Agent Skills

- 🚀 **Dynamic Loading**: Skills load only when needed
- 📦 **Progressive Disclosure**: Metadata → Instructions → Resources
- 🔍 **Better Discovery**: Rich descriptions help agents identify relevant skills
- 🛠️ **Executable Scripts**: Skills can include automation tools
- 📚 **Organized References**: Complex docs split into focused files
- 🔄 **Version Control**: Skills can be versioned independently

## Resources

- [Agent Skills Documentation](https://agentskills.io/)
- [Agent Skills Specification](https://agentskills.io/specification)
- [Agent Skills GitHub](https://github.com/agentskills/agentskills)
