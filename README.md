# GitHub Copilot Starter

GitHub Copilot Starter is a template repository for teams and organizations who want to standardize, document, and automate their coding practices with GitHub Copilot. It is ideal for:

-   **Engineering teams** seeking consistent code quality and onboarding
-   **Open source projects** wanting clear contribution guidelines
-   **Agencies and consultancies** delivering projects with repeatable standards
-   **Individual developers** who want to customize Copilot for their workflow

Use this starter to define, manage, and share custom instructions and prompts for Copilot, making your development process more efficient, maintainable, and accessible.

## Table of Contents

-   [Overview](#overview)
-   [Features](#features)
-   [Project Structure](#project-structure)
-   [Getting Started](#getting-started)
-   [Agent Skills (Dynamic Loading)](#agent-skills-dynamic-loading)
-   [Custom Instructions (Always Active)](#custom-instructions-always-active)
-   [Custom Prompts](#custom-prompts)
-   [Specification-Driven Workflow Prompt (Optional)](#specification-driven-workflow-prompt-optional)
-   [Contributing](#contributing)
-   [License](#license)
-   [Acknowledgements](#acknowledgements)

## Overview

GitHub Copilot Starter is a template repository for configuring, customizing, and managing instructions and prompts for GitHub Copilot and related developer tools. It is designed to help teams and individuals define their own coding standards, workflows, and best practices, making Copilot more effective and tailored to their needs.

## Features

-   **Agent Skills**: Modular, dynamically-loaded skills following the [Agent Skills specification](https://agentskills.io/specification) for ~70% reduction in baseline token usage
-   **Custom instructions**: Universal principles (security, accessibility, best practices) that apply to all code
-   **Flexible instruction system**: Easily add, edit, or remove instruction files for coding standards, workflows, UI guidelines, accessibility, testing, and more
-   **Customizable prompts**: Define your own Copilot prompts and conventions for your team or project
-   **Best practices templates**: Includes example instructions for SOLID, DRY, KISS, commit messages, accessibility, and more
-   **Specification-driven workflow**: Optionally use the included workflow for requirements, design, implementation, and validation
-   **No fixed tech stack**: Adapt to any language, framework, or toolchain

## Project Stskills/` — Agent Skills (dynamically loaded when relevant)
-   `.github/instructions/` — Custom instructions (always active, universal principles)
-   `.github/prompts/` — Custom prompts for specific workflows

-   `.github/instructions/` — Core instruction files (edit or add your own)
-   `/src`, `/tests`, `/public`, `/config`, `/docs` — Example folders for typical projects (customize or remove as needed)

## Getting Started

1. **Clone the repository**
    ```zsh
    git clone https://github.com/devbyrayray/github-copilot-starter.git
    cd github-copilot-starskills and instructions**
    - Browse Agent Skills in `.github/skills/` for language/framework-specific standards
    - Edit custom instructions in `.github/instructions/` for universal principles
    - Customize prompts in `.github/prompts/` for specific workflows
3. **Integrate with your project**
    - Copy or merge the skills, instructions, and prompts into your own repository
    - Adjust folder structure as needed for your tech stack
4. Agent Skills (Dynamic Loading)

Agent Skills are modular, discoverable instructions that AI agents load dynamically based on the task at hand. Skills are located in `.github/skills/` and follow the [Agent Skills specification](https://agentskills.io/specification).

**Language & Framework Standards:**
-   [JavaScript/TypeScript Standards](.github/skills/javascript-typescript-standards/) - ES2022, Node.js, async/await patterns
-   [Vue.js Development](.github/skills/vue-development/) - Vue 3 Composition API, SFC patterns
-   [Nuxt.js Development](.github/skills/nuxt-development/) - Nuxt 3, SSR/SSG, file-based routing
-   [CSS Standards](.github/skills/css-standards/) - CSS organization, selectors, responsive design
-   [Tailwind CSS](.github/skills/tailwind-css/) - Tailwind v4+, @theme directive, utility classes
-   [HTML Standards](.github/skills/html-standards/) - Semantic markup, accessibility, security
-   [C# Standards](.github/skills/csharp-standards/) - C# naming conventions, modern features
-   [.NET Development](.github/skills/dotnet-development/) - .NET architecture, dependency injection
-   [Markdown Standards](.github/skills/markdown-standards/) - Documentation formatting, validation

**Workflow Skills:**
-   [Testing & TDD](.github/skills/testing-tdd/) - TDD methodology, Vitest, xUnit
-   [Commit Conventions](.github/skills/commit-conventions/) - Conventional Commits + validation script

**Benefits:**
-   🚀 ~70% reduction in baseline token usage
-   📦 Progressive disclosure (metadata → instructions → resources)
-   🔍 Better discovery through rich descriptions
-   🛠️ Support for executable scripts (e.g., commit validation)

[📖 Learn more about Agent Skills](.github/skills/README.md)

## Custom Instructions (Always Active)

Universal principles and guidelines that apply to all code are located in `.github/instructions/`:

-   [Coding Standards](.github/instructions/coding.instructions.md) - General coding conventions
-   [Best Practices](.github/instructions/best-practices.instructions.md) - SOLID, DRY, KISS principles
-   [Security](.github/instructions/security.instructions.md) - OWASP Top 10 security patterns
-   [Accessibility](.github/instructions/accessibility.instructions.md) - Universal accessibility guidelines
-   [UI Guidelines](.github/instructions/ui-guidelines.instructions.md) - Design principles
-   [Configuration](.github/instructions/config.instructions.md) - Configuration file standards
-   [Project Structure](.github/instructions/project-file-structure.instructions.md) - Repository organization
-   [Tooling](.github/instructions/tools.instructions.md) - Development tools and workflows

These instructions remain as custom instructions because they contain universal architecture patterns that should always be considered.
    -   Nuxt.js standards ([nuxt.instructions.md](.github/instructions/nuxt.instructions.md))
    -   Markdown standards ([markdown.instructions.md](.github/instructions/markdown.instructions.md))
    -   Project structure ([project-file-structure.instructions.md](.github/instructions/project-file-structure.instructions.md))
    -   Security ([security.instructions.md](.github/instructions/security.instructions.md))
    -   Testing & TDD ([testing.instructions.md](.github/instructions/testing.instructions.md))
    -   Tooling ([tools.instructions.md](.github/instructions/tools.instructions.md))- Add, remove, or modify instructions to fit your project

## Custom Prompts

-   All custom prompts are located in `.github/prompts/` and can be used to guide Copilot and developer workflows:
    -   **code-review.prompt.md**: For code reviews, helps reviewers provide actionable, constructive feedback focused on readability, maintainability, and adherence to repository instructions and best practices.
    -   **review-custom-instructions.prompt.md**: For reviewing the `copilot-instructions.md` file, ensuring instructions are clear, concise, and effective for generating context-aware Copilot responses.
    -   **spec-driven-workflow.prompt.md**: For managing and documenting requirements, design, and implementation tasks in a specification-driven manner using structured templates.

## Specification-Driven Workflow Prompt (Optional)

-   Use the included prompt for requirements, design, and implementation, or define your own
-   See [spec-driven-workflow.prompt.md](.github/prompts/spec-driven-workflow.prompt.md)

## Contributing

-   Update instruction files to share new standards or best practices
-   Use [Conventional Commits](.github/instructions/commit.instructions.md) for commit messages
-   Encourage team members to propose improvements to instructions

## License

MIT

## Acknowledgements

-   GitHub Copilot
-   All contributors to Copilot instructions and best practices
