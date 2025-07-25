---
description: Instructions for configuration files used in the project, including .editorconfig, prettier, and eslint.
applyTo: "**"
---

# Configuration Files Instructions

- **.editorconfig**: Defines indentation, charset, line endings. Keep in project root.
- **prettier.config.js** (frontend only): Enforce code formatting rules.
  Example:
  ```js
  module.exports = {
    singleQuote: true,
    trailingComma: 'all',
    printWidth: 100,
  };
  ```
- **.eslintrc.js**: Enforce consistent linting rules.
  Example:
  ```js
  module.exports = {
    env: {
      browser: true,
      node: true,
      es6: true,
    },
    extends: [
      '@sbb-configs/shared-eslint'
    ],
    parserOptions: {
      ecmaVersion: 2020,
      sourceType: 'module',
    },
    rules: {
      // add project-specific overrides here
    },
  };
  ```
