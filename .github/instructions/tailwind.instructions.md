---
description: '⚠️ DEPRECATED: This instruction file has been migrated to Agent Skills. See .github/skills/tailwind-css/'
applyTo: '**/*.{css,vue,js,ts,jsx,tsx}'
deprecated: true
migrated-to: '.github/skills/tailwind-css/SKILL.md'
---

# ⚠️ DEPRECATED

This instruction file has been migrated to **Agent Skills** for better performance and dynamic loading.

**New location**: [.github/skills/tailwind-css/SKILL.md](../skills/tailwind-css/SKILL.md)

Please refer to the new skill for all Tailwind CSS standards.

---

# Original Content (For Reference)

# Tailwind CSS Instructions

## Version

- Use Tailwind CSS v4 or higher. Do not use older versions.
- Tailwind v4+ does not use `@config` or JavaScript/TypeScript config files. All configuration is handled via CSS and utility classes.

## Customizing Colors

- To use custom colors, use Tailwind's built-in color palette and utility classes (e.g., `bg-blue-600`, `text-primary`).
- For custom colors, you can:
    - Use the `style` attribute for one-off values.
    - Do not use arbitrary color values (e.g. `bg-[#0ea5e9]`). Always use colors defined in your `@theme` block for consistency and maintainability.
    - Define custom CSS variables with the `@theme` directive and use them in your utility classes.

### Example: Customizing Colors with @theme

```css
@import 'tailwindcss';
@theme {
	--color-midnight: #121063;
	--color-tahiti: #3ab7bf;
	--color-bermuda: #78dcca;
}

.btn-tahiti {
	@apply bg-[--color-tahiti] text-white font-semibold px-4 py-2 rounded;
}
```

```vue
<template>
	<button class="btn-tahiti hover:bg-[--color-bermuda]">Custom Color</button>
</template>
```

See the [Tailwind CSS Colors documentation](https://tailwindcss.com/docs/colors) for more details on using and customizing colors.

## Usage

- Use Tailwind utility classes directly in your HTML, Vue, or JSX/TSX templates.
- Prefer semantic and accessible markup; combine Tailwind with best practices from the HTML and accessibility instructions.
- To use `@apply` in a Vue component's `<style>` block, you must reference TailwindCSS at the top of the style section:

    ```vue
    <template>
    	<h1>Hello world!</h1>
    </template>
    <style>
    @reference "tailwindcss";
    h1 {
    	@apply text-2xl font-bold text-red-500;
    }
    </style>
    ```

- Use `@apply` for extracting repeated utility patterns into custom classes in your CSS modules or component styles.
- Do not override Tailwind base styles globally unless absolutely necessary.

## Best Practices

- Keep utility class lists short and readable; extract to custom classes if they become too long.
- Use responsive and state variants (e.g., `md:`, `hover:`) as needed for interactivity and layout.
- Use Tailwind's color palette and spacing scale for consistency.
- Avoid using arbitrary values. Always use colors and spacing defined in your `@theme` block or Tailwind's default palette for consistency.
- Do not use deprecated or removed features from earlier Tailwind versions.

## Example

### Custom Components with @layer

To add custom component classes (such as buttons or cards), use the `@layer components` directive:

### Custom Utilities with @utility

To define custom utility classes, use the `@utility` directive:

```css
@utility content-auto {
	content-visibility: auto;
}
```

```css
@import 'tailwindcss';
@theme {
	--color-white: #fff;
	--radius-lg: 0.5rem;
	--spacing-6: 1.5rem;
	--shadow-xl: 0 10px 15px -3px rgba(0, 0, 0, 0.1), 0 4px 6px -4px rgba(0, 0, 0, 0.1);
}

@layer components {
	.card {
		background-color: var(--color-white);
		border-radius: var(--radius-lg);
		padding: var(--spacing-6);
		box-shadow: var(--shadow-xl);
	}
	.btn-primary {
		@apply px-4 py-2 rounded bg-[--color-primary] text-white font-semibold hover:bg-[--color-primary-hover];
	}
}
```

### Variants with @variant

To define variants (such as dark mode), use the `@variant` directive:

```css
.my-element {
	background: white;
	@variant dark {
		background: black;
	}
}
```

```vue
<template>
	<div class="card">Card content</div>
	<button class="btn-primary">Click me</button>
</template>
```

## References

- [Tailwind CSS v4 Documentation](https://tailwindcss.com/docs/installation)
