---
description: Guidelines for writing CSS that is simple, readable, and maintainable. Focus on structure, organization, selectors, reusability, performance, and responsiveness.
applyTo: "**/*.{css,sass,scss,js,jsx,ts,tsx,svelte}"
---

### CSS Guidelines for Simple, Readable, and Maintainable Code

#### Structure and Organization
1. **Ordering and Grouping Styles**  
   - Group related styles together. For example:
     ```css
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
     ```
   - Use tools like [CSS Stylelint](https://stylelint.io/) to enforce consistent rule order.

2. **Modular CSS**  
   - Split your CSS into smaller modules (e.g., `buttons.css`, `typography.css`) so you only import the styles you need.
   - If using CSS Modules, name files after the component they style (e.g., `Button.module.css`, `Header.module.css`).
   - If Vue.js or React, use scoped styles in single-file components (SFCs) or component files.
   - If Angular, use component stylesheets with the `styleUrls` property.

3. **Use a Reset or Normalize.css**  
   - Use a base reset (CSS reset) or Normalize.css to ensure consistent behavior across browsers.

4. **Comment Styles Clearly**  
   - Use clear comments to organize CSS sections:
     ```css
     /* Reusable Components */
     .button { ... }

     /* Page-Specific Styles */
     .homepage-header { ... }
     ```

---

#### Selectors and Specificity
5. **Minimize Selector Nesting**  
   - Too much nesting makes selectors unnecessarily complex:
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

6. **Limit Specificity**  
   - Avoid overly specific selectors like IDs (`#id`) or combinations. Prefer classes:
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

7. **Avoid Redundant Styles**  
   - Don't write styles that aren't needed:
     ❌ Bad:
     ```css
     p {
       font-size: 16px;
       font-size: 16px;
     }
     ```
     ✅ Better:
     ```css
     p {
       font-size: 16px;
     }
     ```

8. **Use Short Selectors for Reusable Components**  
   - Use clear, short names for component classes:
     ```css
     .btn { ... } /* Use consistent `btn` for buttons */
     .card { ... } /* Clear name for a content card */
     ```

---

#### Efficient Reuse and Avoiding Duplication
9. **Use CSS Variables (`:root`)**  
   - Define global values:
     ```css
     :root {
       --primary-color: #007bff;
       --secondary-color: #6c757d;
       --font-size-base: 16px;
     }

     body {
       color: var(--primary-color);
       font-size: var(--font-size-base);
     }
     ```

10. **Use Reusable Classes**  
   - Avoid redefining styles. Create reusable utility classes:
     ```css
     /* Utility classes */
     .text-center {
       text-align: center;
     }

     .margin-bottom-sm {
       margin-bottom: 10px;
     }
     ```

11. **Use Component-Based Styles**  
   - Avoid styles targeting global elements; place them within specific components:
     ```css
     /* Bad */
     h1 {
       font-size: 24px;
     }

     /* Better */
     .card-title {
       font-size: 24px;
     }
     ```

---

#### Performance and Maintainability
12. **Avoid Inline Styles**  
   - Write styles only in external stylesheets for scalability:
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

13. **Minimize Use of !important**  
   - Use `!important` only as a last resort. Excessive use makes maintenance difficult.

14. **Compression and Minification**  
   - Use tools like PostCSS or CSS libraries (e.g., Sass) to automatically optimize CSS for production.

15. **Limit Use of Animations**  
   - Excessive or complex CSS animations can hurt performance.

---

#### Responsiveness
16. **Use Media Queries Wisely**  
   - Styles for different screen sizes should remain scalable and clearly labeled:
     ```css
     /* Base style */
     .container {
       width: 100%;
     }

     /* Tablet breakpoint */
     @media screen and (width >= 768px) {
       .container {
         width: 95%;
       }
     }

     /* Desktop breakpoint */
     @media screen and (width >= 1024px) {
       .container {
         width: 80%;
       }
     }
     ```

17. **Use Responsive Units**  
   - Use flexible units like `%`, `em`, and `rem` instead of static `px` values:
     ```css
     body {
       font-size: 1rem; /* Scalable base */
     }

     .container {
       max-width: 80%;
     }
     ```

---

#### Cleanliness
18. **Use Consistent Indentation**  
   - Choose one indentation style (e.g., 2 or 4 spaces) and keep it consistent. Use a linting tool like Prettier or Stylelint.

19. **Remove Unused CSS**  
   - Use tools like PurgeCSS to clean up unused styles and keep your CSS file small.

20. **Avoid Too Many Unique Specific Classes**  
   - Use general and reusable styles without unnecessary unique selectors.

---

With these guidelines, your CSS will remain simple, maintainable, and scalable, with a focus on readability and reusability!
