---
name: tailwind-css
description: Tailwind CSS v4+ usage and configuration standards including utility classes, custom theming, and best practices. Use when working with Tailwind CSS, utility-first styling, or when the user asks about Tailwind configuration, custom colors, responsive design, or @theme/@layer directives.
metadata:
    author: devbyray
    version: '1.0'
    framework: 'tailwind-css'
    version-required: '4.0+'
---

# Tailwind CSS Standards

Apply these standards when using Tailwind CSS v4+ for styling.

## Version Requirements

- **Use Tailwind CSS v4 or higher**
- Tailwind v4+ does NOT use `@config` or JavaScript/TypeScript config files
- All configuration is handled via CSS using `@theme` directive

## Custom Colors

### Using Built-in Color Palette

```html
<div class="bg-blue-600 text-white">Content</div>
<button class="bg-emerald-500 hover:bg-emerald-600">Click</button>
```

### Defining Custom Colors

Use the `@theme` directive to define custom colors:

```css
@import 'tailwindcss';

@theme {
	--color-midnight: #121063;
	--color-tahiti: #3ab7bf;
	--color-bermuda: #78dcca;
}
```

**Using custom colors:**

```html
<button class="bg-[--color-tahiti] text-white hover:bg-[--color-bermuda]">Custom Color Button</button>
```

**Creating reusable classes:**

```css
@layer components {
	.btn-tahiti {
		@apply bg-[--color-tahiti] text-white font-semibold px-4 py-2 rounded;
	}

	.btn-tahiti:hover {
		@apply bg-[--color-bermuda];
	}
}
```

**Do NOT use arbitrary color values:**

❌ Bad:

```html
<div class="bg-[#0ea5e9]">Content</div>
```

✅ Good:

```css
@theme {
	--color-primary: #0ea5e9;
}
```

```html
<div class="bg-[--color-primary]">Content</div>
```

## Configuration with @theme

Define all customizations in your CSS file:

```css
@import 'tailwindcss';

@theme {
	/* Colors */
	--color-primary: #3b82f6;
	--color-secondary: #8b5cf6;
	--color-accent: #f59e0b;

	/* Spacing */
	--spacing-xs: 0.25rem;
	--spacing-sm: 0.5rem;
	--spacing-md: 1rem;
	--spacing-lg: 1.5rem;
	--spacing-xl: 2rem;

	/* Font Sizes */
	--font-size-xs: 0.75rem;
	--font-size-sm: 0.875rem;
	--font-size-base: 1rem;
	--font-size-lg: 1.125rem;
	--font-size-xl: 1.25rem;

	/* Border Radius */
	--radius-sm: 0.25rem;
	--radius-md: 0.375rem;
	--radius-lg: 0.5rem;
	--radius-full: 9999px;
}
```

## Usage Best Practices

### 1. Semantic and Accessible Markup

Combine Tailwind with semantic HTML:

```html
<header class="bg-white shadow-md">
	<nav class="container mx-auto px-4 py-3" aria-label="Main navigation">
		<ul class="flex gap-4">
			<li><a href="/" class="text-blue-600 hover:text-blue-800">Home</a></li>
			<li><a href="/about" class="text-blue-600 hover:text-blue-800">About</a></li>
		</ul>
	</nav>
</header>
```

### 2. Extracting Repeated Patterns

Use `@apply` for repeated utility patterns:

**Vue component with @apply:**

```vue
<template>
	<button class="btn-primary">Click me</button>
</template>

<style>
@reference "tailwindcss";

.btn-primary {
	@apply bg-blue-600 text-white font-semibold px-4 py-2 rounded-lg;
	@apply hover:bg-blue-700 focus:ring-2 focus:ring-blue-500;
	@apply transition-colors duration-200;
}
</style>
```

**Note:** In Vue components, you must use `@reference "tailwindcss";` before `@apply`.

### 3. Component Layer

Use `@layer components` for reusable component classes:

```css
@import 'tailwindcss';

@layer components {
	.card {
		@apply bg-white rounded-lg shadow-md p-6;
		@apply border border-gray-200;
	}

	.card-title {
		@apply text-2xl font-bold mb-4 text-gray-800;
	}

	.card-content {
		@apply text-gray-600 leading-relaxed;
	}

	.btn {
		@apply px-4 py-2 rounded-md font-semibold;
		@apply transition-colors duration-200;
		@apply focus:outline-none focus:ring-2;
	}

	.btn-primary {
		@apply bg-blue-600 text-white;
		@apply hover:bg-blue-700;
		@apply focus:ring-blue-500;
	}

	.btn-secondary {
		@apply bg-gray-200 text-gray-800;
		@apply hover:bg-gray-300;
		@apply focus:ring-gray-500;
	}
}
```

### 4. Custom Utilities

Define custom utility classes with `@utility`:

```css
@utility content-auto {
	content-visibility: auto;
}

@utility scroll-smooth {
	scroll-behavior: smooth;
}

@utility text-balance {
	text-wrap: balance;
}
```

**Usage:**

```html
<div class="content-auto scroll-smooth">
	<p class="text-balance">Balanced text content...</p>
</div>
```

## Responsive Design

Use responsive variants for different screen sizes:

```html
<div class="w-full md:w-1/2 lg:w-1/3 xl:w-1/4">
	<p class="text-sm md:text-base lg:text-lg">Responsive text</p>
</div>

<nav class="hidden md:flex">
	<!-- Desktop navigation -->
</nav>

<button class="block md:hidden">
	<!-- Mobile menu toggle -->
</button>
```

## State Variants

Use state variants for interactivity:

```html
<!-- Hover -->
<button class="bg-blue-600 hover:bg-blue-700">Hover me</button>

<!-- Focus -->
<input class="border border-gray-300 focus:border-blue-500 focus:ring-2 focus:ring-blue-200" />

<!-- Active -->
<button class="bg-blue-600 active:bg-blue-800">Click me</button>

<!-- Disabled -->
<button class="bg-blue-600 disabled:bg-gray-400 disabled:cursor-not-allowed" disabled>Disabled</button>

<!-- Dark mode -->
<div class="bg-white dark:bg-gray-800 text-black dark:text-white">Content</div>
```

## Complete Example

```css
/* styles.css */
@import 'tailwindcss';

@theme {
	--color-primary: #3b82f6;
	--color-secondary: #8b5cf6;
	--color-success: #10b981;
	--color-danger: #ef4444;
	--color-warning: #f59e0b;

	--radius-default: 0.375rem;
	--radius-large: 0.5rem;
}

@layer components {
	.card {
		@apply bg-white rounded-[--radius-large] shadow-lg p-6;
		@apply border border-gray-200;
		@apply transition-shadow duration-200;
	}

	.card:hover {
		@apply shadow-xl;
	}

	.btn {
		@apply px-4 py-2 rounded-[--radius-default] font-semibold;
		@apply transition-all duration-200;
		@apply focus:outline-none focus:ring-2 focus:ring-offset-2;
	}

	.btn-primary {
		@apply bg-[--color-primary] text-white;
		@apply hover:opacity-90;
		@apply focus:ring-[--color-primary];
	}
}

@utility animate-fade-in {
	animation: fadeIn 0.5s ease-in;
}

@keyframes fadeIn {
	from {
		opacity: 0;
	}
	to {
		opacity: 1;
	}
}
```

```html
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<title>Tailwind Example</title>
		<link rel="stylesheet" href="styles.css" />
	</head>
	<body class="bg-gray-50 font-sans antialiased">
		<div class="container mx-auto px-4 py-8">
			<div class="card animate-fade-in">
				<h2 class="text-2xl font-bold mb-4 text-gray-800">Card Title</h2>
				<p class="text-gray-600 mb-6">This is a card component with Tailwind CSS v4.</p>
				<div class="flex gap-4">
					<button class="btn btn-primary">Primary Action</button>
					<button class="btn bg-gray-200 hover:bg-gray-300">Secondary Action</button>
				</div>
			</div>
		</div>
	</body>
</html>
```

## Best Practices Summary

1. ✅ Use Tailwind v4+ only (no JS config files)
2. ✅ Define custom values in `@theme` block
3. ✅ Never use arbitrary values (e.g., `bg-[#hex]`)
4. ✅ Extract repeated patterns with `@apply`
5. ✅ Use `@layer components` for reusable classes
6. ✅ Keep utility class lists readable
7. ✅ Use responsive variants (`md:`, `lg:`)
8. ✅ Use state variants (`hover:`, `focus:`)
9. ✅ Combine with semantic HTML
10. ✅ Follow accessibility guidelines

## Common Patterns

### Button Variants

```css
@layer components {
	.btn {
		@apply px-4 py-2 rounded font-medium transition-colors;
	}

	.btn-sm {
		@apply px-3 py-1.5 text-sm;
	}
	.btn-lg {
		@apply px-6 py-3 text-lg;
	}

	.btn-primary {
		@apply bg-blue-600 text-white hover:bg-blue-700;
	}
	.btn-danger {
		@apply bg-red-600 text-white hover:bg-red-700;
	}
	.btn-outline {
		@apply border-2 border-blue-600 text-blue-600 hover:bg-blue-50;
	}
}
```

### Form Inputs

```css
@layer components {
	.input {
		@apply w-full px-4 py-2 border border-gray-300 rounded-md;
		@apply focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent;
		@apply transition-colors;
	}

	.input-error {
		@apply border-red-500 focus:ring-red-500;
	}
}
```

## When to Apply

Apply these standards when:

- Using Tailwind CSS in projects
- Creating component libraries
- Building responsive layouts
- Implementing design systems
- User asks about Tailwind configuration
- Setting up utility-first CSS workflows
