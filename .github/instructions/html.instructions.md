---
description: Guidelines for writing HTML that is accessible, semantic, maintainable, and secure.
applyTo: '**/*.{html,vue,twig,php,cshtml,svelte}'
---

## HTML Coding Standards & Best Practices

### Structure & Semantics

1. **Use semantic HTML elements**  
    - Prefer `<header>`, `<nav>`, `<main>`, `<section>`, `<article>`, `<aside>`, `<footer>` over generic `<div>` and `<span>` where appropriate.
    - Use headings (`<h2>`, `<h3>`, etc.) in a logical, hierarchical order. Do not use `<h1>` (reserved for page title generation).

2. **Document structure**  
    - Always start with `<!DOCTYPE html>`.
    - Use `<html lang="en">` for English content (change `lang` as needed).
    - Include `<meta charset="UTF-8">` in the `<head>`.

3. **Organize code for readability**  
    - Indent nested elements consistently (2 spaces recommended).
    - Use blank lines to separate logical sections.

---

### Accessibility

4. **Accessible markup**  
    - Use ARIA attributes only when native HTML elements are insufficient.
    - Ensure all images have descriptive `alt` attributes.
    - Use labels for form controls (`<label for="inputId">`).
    - Ensure sufficient color contrast and font size (minimum 16px).

5. **Keyboard navigation**  
    - Ensure interactive elements are reachable and usable via keyboard (`tabindex`, `<button>`, `<a href>`).

---

### Maintainability

6. **Avoid inline styles and scripts**  
    - Use external CSS and JS files.
    - Use classes for styling, not IDs.

7. **Consistent naming**  
    - Use lowercase, hyphen-separated class and id names (e.g., `main-header`, `nav-link`).

8. **Comment sections clearly**  
    - Use HTML comments (`<!-- Section: Navigation -->`) to organize code.

---

### Security

9. **Escape user-generated content**  
    - Never inject raw user data into the DOM. Use server-side or client-side sanitization libraries if needed.

10. **Set security-related meta tags**  
     - Example:
        ```html
        <meta http-equiv="Content-Security-Policy" content="default-src 'self';">
        <meta http-equiv="X-Content-Type-Options" content="nosniff">
        <meta http-equiv="Strict-Transport-Security" content="max-age=31536000; includeSubDomains">
        ```

---

### Performance

11. **Optimize images**  
     - Use appropriate formats and sizes.
     - Use `loading="lazy"` for non-critical images.

12. **Minimize HTTP requests**  
     - Combine CSS/JS files where possible.
     - Use modern `<link rel="preload">` and `<link rel="prefetch">` for critical resources.

---

### Validation

13. **Validate HTML**  
     - Use tools like [W3C Validator](https://validator.w3.org/) to check for errors and accessibility issues.

---

With these guidelines, your HTML will be accessible, semantic, secure, and maintainable.