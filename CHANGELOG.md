# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [0.0.2] - 2026-01-29

### Added

- **Agent Skills System** - Implemented 11 modular Agent Skills following the [Agent Skills specification](https://agentskills.io/specification):
  - `javascript-typescript-standards` - ES2022, Node.js, async/await patterns
  - `vue-development` - Vue 3 Composition API, SFC patterns
  - `nuxt-development` - Nuxt 3, SSR/SSG, file-based routing
  - `css-standards` - CSS organization, selectors, responsive design
  - `tailwind-css` - Tailwind v4+, @theme directive, utility classes
  - `html-standards` - Semantic markup, accessibility, security
  - `csharp-standards` - C# naming conventions, modern features
  - `dotnet-development` - .NET architecture, dependency injection
  - `markdown-standards` - Documentation formatting, validation
  - `testing-tdd` - TDD methodology, Vitest, xUnit
  - `commit-conventions` - Conventional Commits + validation script
- Agent Skills README with comprehensive skill documentation
- Migration guide explaining rationale and benefits of Agent Skills
- Executable validation script for commit messages (`commit-conventions/scripts/validate-commit.sh`)

### Changed

- Restructured project to use Agent Skills for language/framework-specific guidelines
- Updated README with separate sections for Agent Skills and Custom Instructions
- Updated `coding.instructions.md` to reference new Agent Skills structure
- Updated `copilot-instructions.md` with guidelines structure documentation
- Custom instructions now focus on universal principles (security, accessibility, best practices)

### Removed

- Deprecated custom instruction files that have been migrated to Agent Skills:
  - `javascript-typescript.instructions.md`
  - `vue.instructions.md`
  - `nuxt.instructions.md`
  - `css.instructions.md`
  - `tailwind.instructions.md`
  - `html.instructions.md`
  - `csharp.instructions.md`
  - `dotnet.instructions.md`
  - `markdown.instructions.md`
  - `testing.instructions.md`
  - `commit.instructions.md`

### Performance

- **~70% reduction in baseline token usage** through dynamic loading of Agent Skills
- Skills load only when relevant to the current task
- Progressive disclosure pattern (metadata → instructions → resources)

## [0.0.1] - 2025-07-25

### Added

- Initial release with custom instructions system
- Core instruction files for coding standards, accessibility, security
- Custom prompts for code review and specification-driven workflow
- Example project structure
- Comprehensive documentation

[Unreleased]: https://github.com/devbyrayray/github-copilot-starter/compare/v0.0.2...HEAD
[0.0.2]: https://github.com/devbyrayray/github-copilot-starter/compare/v0.0.1...v0.0.2
[0.0.1]: https://github.com/devbyrayray/github-copilot-starter/releases/tag/v0.0.1
