---
description: Guidelines for improving the accessibility of a website to ensure it is usable for everyone, including people with disabilities.
applyTo: "**/*.{html,css,js,jsx,ts,tsx,svelte,cshtml,php,vue,twig}"
---

## Accessibility

Improving the accessibility of a website is essential to ensure it is usable for everyone, including people with disabilities. Here are additional guidelines to make your website more accessible:

### 1. Alt Text
- Add meaningful `alt` text to all images. Make sure:
  - It is short and descriptive (≤125 characters).
  - Decorative images have an empty `alt` attribute (`alt=""`) so screen readers skip them.

  **Example:**
  ```html
  <img src="cat.jpg" alt="A black cat lying on a wooden chair." />
  <img src="decorative-line.png" alt="" />
  ```

### 2. Color and Contrast
- Ensure text has enough contrast against the background (≥4.5:1 for body text and ≥3:1 for large text).
- Use tools like Contrast Checker to test this.
- Avoid using color as the only way to convey information. Use text or symbols alongside colors.

Example (for visually impaired users):
❌ Bad: "Click the green button to confirm."
✅ Better: "Click the green button with the checkmark to confirm."

### 3. Logical DOM Order
- Make sure content in the DOM is logically ordered so screen readers and keyboard navigation interpret it correctly.
- Use landmarks like <header>, <main>, <nav>, and <footer> to help screen readers navigate.

Example:
```html
<header>...</header>
<nav>...</nav>
<main>...</main>
<footer>...</footer>
```

### 4. Focus Management and Keyboard Navigation
- Test keyboard navigation in the browser:
    - Check if a user can navigate the entire page using the Tab key.
- Correct use of tabindex:
    - Avoid positive tabindex values, as this creates an illogical tab order.
    - Use tabindex="0" to make an element focusable that is not focusable by default.
    - Use tabindex="-1" to make an element accessible via JavaScript without putting it in the tab order.

Example:
```html
<button tabindex="0">Confirm</button>
<a href="#section" tabindex="0">Go to section</a>
```

### 5. ARIA Attributes
- Use ARIA (Accessible Rich Internet Applications) only when semantic HTML is not enough.
- Avoid excessive use of ARIA; use HTML5 tags with built-in accessibility whenever possible.

ARIA Examples:
- Use aria-label for buttons or links without text: `<button aria-label="Close">x</button>`
- Use aria-expanded to indicate the state of a dropdown menu: `<button aria-expanded="false">Menu</button>`

### 6. Responsiveness and Assistive Technologies
- Make sure the site works correctly on both desktop and mobile devices.
- Check that the site works well with screen readers like NVDA, JAWS (Windows), and VoiceOver (macOS/iOS).
- Test with different browsers: Chrome, Firefox, Safari.

### 7. Forms
- Labels:
    - Add clear label elements to form fields:
    ```html
    <label for="email">Email address</label>
    <input type="email" id="email" />
    ```

- Accessible error messages:
    - Use clear error messages when a form is filled out incorrectly. Combine visual indicators (like red highlighted fields) with text.
    ```html
    <span role="alert">Email address is required.</span>
    ```

### 8. Text and Fonts
- Use a minimum font size of 16px for base text.
- Set line height to improve readability, for example 1.5.
- Ensure text is scalable:
    - Avoid fixed px values and prefer em or rem units.

    Example:
    ```css
    body {
        font-size: 1rem; /* 16px base */
        line-height: 1.5;
    }
    ```

### 9. Videos and Audio
- Add subtitles to videos and text transcripts for audio.
- Make sure videos have controls.
- Use the aria-describedby attribute to provide alternative descriptions for complex media.

    Example:
    ```html
    <video controls aria-describedby="videodesc">
    <source src="sample-video.mp4" type="video/mp4" />
    </video>

    <p id="videodesc">This video explains accessibility.</p>
    ```

### 10. Keyboard Accessibility
- Make sure interactive elements like buttons, links, and form fields have focus state styles:

    ```css
    button:focus, a:focus {
        outline: 2px solid #007bff;
        outline-offset: 2px;
    }
    ```