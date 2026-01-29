---
name: css-standards
description: Guidelines for writing CSS that is simple, readable, and maintainable. Use when working with .css, .scss, .sass files, CSS-in-JS, styled-components, or when the user asks about CSS organization, selectors, specificity, reusability, performance, or responsive design patterns.
metadata:
  author: devbyray
  version: "1.0"
  languages: "css, scss, sass"
  tools: "stylelint"
---

# CSS Standards

Apply these standards when writing or reviewing CSS, SCSS, or SASS code to ensure maintainability and performance.

## Structure and Organization

### 1. Ordering and Grouping Styles
Group related styles together in this order:

```css
.component {
  /* Layout */
  position: relative;
  display: flex;
  
  /* Box model */
  margin: 10px;
  padding: 20px;
  border: 1px solid #ccc;
  
  /* Visual */
  background-color: #f5f5f5;
  color: #333;
  
  /* Typography */
  font-size: 16px;
  line-height: 1.5;
  
  /* Misc */
  cursor: pointer;
}
```

Use [CSS Stylelint](https://stylelint.io/) to enforce consistent rule order.

### 2. Modular CSS
- Split CSS into smaller modules (`buttons.css`, `typography.css`)
- Name files after components (`Button.module.css`, `Header.module.css`)
- Use scoped styles in Vue/React/Svelte single-file components
- In Angular, use `styleUrls` property for component styles

### 3. CSS Reset
Use a base reset or Normalize.css for consistent cross-browser behavior.

### 4. Comment Styles Clearly
```css
/* Reusable Components */
.button { ... }

/* Page-Specific Styles */
.homepage-header { ... }
```

## Selectors and Specificity

### 5. Minimize Selector Nesting

❌ Bad:
```css
.header .nav ul li a {
  color: #fff;
}
```

✅ Better:
```css
.nav-link {
  color: #fff;
}
```

### 6. Limit Specificity
Avoid IDs and overly specific selectors. Prefer classes.

❌ Bad:
```css
#header p.intro-text {
  font-size: 16px;
}
```

✅ Better:
```css
.intro-text {
  font-size: 16px;
}
```

### 7. Use Short Selectors for Components
```css
.btn { ... }      /* Consistent button naming */
.card { ... }     /* Clear content card name */
.nav-link { ... } /* Descriptive navigation link */
```

## Efficient Reuse

### 8. CSS Variables
```css
:root {
  --primary-color: #007bff;
  --secondary-color: #6c757d;
  --font-size-base: 16px;
  --spacing-sm: 8px;
  --spacing-md: 16px;
  --spacing-lg: 24px;
}

body {
  color: var(--primary-color);
  font-size: var(--font-size-base);
}
```

### 9. Reusable Utility Classes
```css
.text-center {
  text-align: center;
}

.margin-bottom-sm {
  margin-bottom: var(--spacing-sm);
}

.flex-center {
  display: flex;
  align-items: center;
  justify-content: center;
}
```

### 10. Component-Based Styles
Avoid global element selectors.

❌ Bad:
```css
h1 {
  font-size: 24px;
}
```

✅ Better:
```css
.card-title {
  font-size: 24px;
}
```

## Performance and Maintainability

### 11. Avoid Inline Styles
❌ Bad:
```html
<div style="color: red; font-size: 20px;">Content</div>
```

✅ Better:
```html
<div class="error-text">Content</div>
```
```css
.error-text {
  color: red;
  font-size: 20px;
}
```

### 12. Minimize !important
Use `!important` only as a last resort. Excessive use makes maintenance difficult.

### 13. Optimize for Production
- Use PostCSS or build tools to minify CSS
- Remove unused CSS with tools like PurgeCSS
- Combine and optimize stylesheets

### 14. Limit Complex Animations
Excessive or complex CSS animations can hurt performance. Test on low-end devices.

## Responsiveness

### 15. Media Queries
```css
/* Base (mobile-first) */
.container {
  width: 100%;
  padding: var(--spacing-md);
}

/* Tablet */
@media screen and (width >= 768px) {
  .container {
    width: 95%;
    padding: var(--spacing-lg);
  }
}

/* Desktop */
@media screen and (width >= 1024px) {
  .container {
    width: 80%;
    max-width: 1200px;
  }
}
```

### 16. Responsive Units
Use flexible units instead of fixed pixels.

```css
body {
  font-size: 1rem;      /* Scalable base */
  line-height: 1.5;
}

.container {
  width: 90%;           /* Flexible width */
  max-width: 1200px;
  margin: 0 auto;
  padding: 2rem;        /* Scalable spacing */
}
```

## Code Cleanliness

### 17. Consistent Indentation
Use 2 or 4 spaces consistently. Use Prettier or Stylelint for enforcement.

### 18. Remove Unused CSS
Use PurgeCSS or similar tools to remove unused styles in production.

### 19. Avoid Redundancy
❌ Bad:
```css
p {
  font-size: 16px;
  font-size: 16px;  /* Duplicate */
}
```

✅ Better:
```css
p {
  font-size: 16px;
}
```

## Example: Well-Structured Component

```css
/* Card Component */
.card {
  /* Layout */
  display: flex;
  flex-direction: column;
  
  /* Box model */
  padding: var(--spacing-lg);
  border: 1px solid var(--border-color);
  border-radius: 8px;
  
  /* Visual */
  background-color: var(--card-bg);
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
  
  /* Misc */
  transition: transform 0.2s ease;
}

.card:hover {
  transform: translateY(-4px);
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.15);
}

.card-title {
  /* Typography */
  font-size: 1.5rem;
  font-weight: 600;
  color: var(--text-primary);
  
  /* Box model */
  margin-bottom: var(--spacing-sm);
}

.card-content {
  /* Typography */
  font-size: 1rem;
  line-height: 1.6;
  color: var(--text-secondary);
}

/* Responsive adjustments */
@media screen and (width >= 768px) {
  .card {
    flex-direction: row;
    padding: var(--spacing-xl);
  }
}
```

## When to Apply

Apply these standards when:
- Creating new stylesheets
- Writing component styles
- Refactoring existing CSS
- Reviewing CSS code
- Setting up CSS architecture
- Working with CSS preprocessors (SCSS, SASS)
- User asks about CSS best practices
