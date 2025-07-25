# GitHub Copilot Starter

GitHub Copilot Starter is a template repository for teams and organizations who want to standardize, document, and automate their coding practices with GitHub Copilot. It is ideal for:
- **Engineering teams** seeking consistent code quality and onboarding
- **Open source projects** wanting clear contribution guidelines
- **Agencies and consultancies** delivering projects with repeatable standards
- **Individual developers** who want to customize Copilot for their workflow

Use this starter to define, manage, and share custom instructions and prompts for Copilot, making your development process more efficient, maintainable, and accessible.

## Table of Contents
- [Overview](#overview)
- [Features](#features)
- [Project Structure](#project-structure)
- [Getting Started](#getting-started)
- [Custom Instructions & Guidelines](#custom-instructions--guidelines)
- [Custom Prompts](#custom-prompts)
- [Specification-Driven Workflow Prompt (Optional)](#specification-driven-workflow-prompt-optional)
- [Contributing](#contributing)
- [License](#license)
- [Acknowledgements](#acknowledgements)

## Overview

GitHub Copilot Starter is a template repository for configuring, customizing, and managing instructions and prompts for GitHub Copilot and related developer tools. It is designed to help teams and individuals define their own coding standards, workflows, and best practices, making Copilot more effective and tailored to their needs.

## Features
- **Flexible instruction system**: Easily add, edit, or remove instruction files for coding standards, workflows, UI guidelines, accessibility, testing, and more
- **Customizable prompts**: Define your own Copilot prompts and conventions for your team or project
- **Best practices templates**: Includes example instructions for SOLID, DRY, KISS, commit messages, accessibility, and more
- **Specification-driven workflow**: Optionally use the included workflow for requirements, design, implementation, and validation
- **No fixed tech stack**: Adapt to any language, framework, or toolchain

## Project Structure
- `.github/instructions/` — Core instruction files (edit or add your own)
- `/src`, `/tests`, `/public`, `/config`, `/docs` — Example folders for typical projects (customize or remove as needed)

## Getting Started

1. **Clone the repository**
   ```zsh
   git clone https://github.com/devbyrayray/github-copilot-starter.git
   cd github-copilot-starter
   ```
2. **Review and customize instruction files**
   - Edit files in `.github/instructions/` to match your team's standards and workflow
   - Add new instruction files for additional rules or prompts
3. **Integrate with your project**
   - Copy or merge the instructions into your own repository
   - Adjust folder structure as needed for your tech stack

## Custom Instructions & Guidelines
- All coding standards, workflows, and conventions are defined in `.github/instructions/`
- Example instructions provided for:
  - Coding standards ([coding.instructions.md](.github/instructions/coding.instructions.md))
  - Accessibility ([accessibility.instructions.md](.github/instructions/accessibility.instructions.md))
  - CSS ([css.instructions.md](.github/instructions/css.instructions.md))
  - HTML ([html.instructions.md](.github/instructions/html.instructions.md))
  - UI guidelines ([ui-guidelines.instructions.md](.github/instructions/ui-guidelines.instructions.md))
  - Commit messages ([commit.instructions.md](.github/instructions/commit.instructions.md))
- Add, remove, or modify instructions to fit your project

## Custom Prompts
- All custom prompts are located in `.github/prompts/` and can be used to guide Copilot and developer workflows:
  - **code-review.prompt.md**: For code reviews, helps reviewers provide actionable, constructive feedback focused on readability, maintainability, and adherence to repository instructions and best practices.
  - **review-custom-instructions.prompt.md**: For reviewing the `copilot-instructions.md` file, ensuring instructions are clear, concise, and effective for generating context-aware Copilot responses.
  - **spec-driven-workflow.prompt.md**: For managing and documenting requirements, design, and implementation tasks in a specification-driven manner using structured templates.

## Specification-Driven Workflow Prompt (Optional)
- Use the included prompt for requirements, design, and implementation, or define your own
- See [spec-driven-workflow.prompt.md](.github/prompts/spec-driven-workflow.prompt.md)

## Contributing
- Update instruction files to share new standards or best practices
- Use [Conventional Commits](.github/instructions/commit.instructions.md) for commit messages
- Encourage team members to propose improvements to instructions

## License
MIT

## Acknowledgements
- GitHub Copilot
- All contributors to Copilot instructions and best practices
