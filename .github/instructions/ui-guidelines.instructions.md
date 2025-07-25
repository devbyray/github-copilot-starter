---
description: UI guidelines for consistent, accessible, and maintainable user interfaces.
applyTo: "**"
---

# 🎨 UI Guidelines

## Accessibility
- See the full accessibility guidelines: [Accessibility Instructions](./accessibility.instructions.md)
- Add meaningful `alt` text to all images; use empty `alt` for decorative images.
- Ensure sufficient color contrast (≥4.5:1 for body text, ≥3:1 for large text); do not use color alone to convey information.
- Use logical DOM order and semantic landmarks (<header>, <main>, <nav>, <footer>).
- Test keyboard navigation; use correct tabindex values (avoid positive values).
- Prefer semantic HTML; use ARIA attributes only when necessary.
- Ensure site works with screen readers and on all devices/browsers.
- Label all form fields and provide accessible error messages.
- Use minimum font size of 16px and scalable units (em/rem); set line height for readability.
- Add subtitles/transcripts to media; ensure videos have controls and alternative descriptions.
- Style focus states for interactive elements (buttons, links, form fields).

## Design System & Styling
- Use CSS modules and utility classes for maintainable styles.
- Prefer reusable components and consistent spacing, colors, and typography.
- Avoid inline styles; use external stylesheets and CSS variables.

## Responsiveness
- Design for mobile-first and use media queries for breakpoints.
- Use flexible units (%, em, rem) for scalable layouts.

## Performance
- Optimize images and assets for fast loading.
- Minimize DOM complexity and avoid unnecessary re-renders.

## Maintainability
- Organize styles and components by feature/module.
- Comment sections clearly and remove unused styles.

Refer to CSS and accessibility instructions for further details.
