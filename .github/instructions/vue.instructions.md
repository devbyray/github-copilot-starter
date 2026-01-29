---
description: '⚠️ DEPRECATED: This instruction file has been migrated to Agent Skills. See .github/skills/vue-development/'
applyTo: '**/*.vue'
deprecated: true
migrated-to: '.github/skills/vue-development/SKILL.md'
---

# ⚠️ DEPRECATED

This instruction file has been migrated to **Agent Skills** for better performance and dynamic loading.

**New location**: [.github/skills/vue-development/SKILL.md](../skills/vue-development/SKILL.md)

Please refer to the new skill for all Vue.js development standards.

---

# Original Content (For Reference)

# Vue.js Coding Instructions

## General Guidelines

1. Use Vue 3 with the Composition API for all new components.
2. Organize code by feature/module; keep related files together.
3. Use single-file components (`.vue`) with `<script setup>`, `<template>`, and `<style scoped>` sections (in that order).
4. Place the `<script setup>` section at the top of the file, followed by `<template>`, then `<style scoped>` at the bottom.
5. Prefer `<script setup>` syntax for simplicity and type inference.
6. Use TypeScript in Vue components when possible.
7. Use PascalCase for component names and file names (e.g., `MyComponent.vue`).
8. Use kebab-case for custom event names and props in templates.
9. Always define `props` with types and default values where appropriate.
10. Use `defineEmits` and `defineProps` for event and prop definitions.
11. Use `ref` and `reactive` for state; avoid using `this`.
12. Use `v-bind` and `v-on` shorthand (`:` and `@`) in templates.
13. Use `v-if`/`v-else` for conditional rendering and `v-for` for lists; always provide a unique `:key` for `v-for`.
14. Avoid logic in templates; keep templates declarative and move logic to the script section.
15. Use composables (`useXyz`) for reusable logic.
16. Write clear JSDoc/TSDoc comments for composables and complex logic.
17. Use CSS modules or `<style scoped>` for component styles; avoid global styles.
18. Follow accessibility and UI guidelines for all components.
19. End every statement with a semicolon and use single quotes for strings.
20. Avoid using `any` type; prefer explicit types.
21. Write unit tests for all components using Vitest.

## Example Component

```vue
<script setup lang="ts">
import { defineProps, defineEmits } from 'vue'

const props = defineProps<{
	disabled?: boolean
}>()
const emit = defineEmits<{ (e: 'click'): void }>()

const onClick = () => {
	if (!props.disabled) emit('click')
}
</script>

<template>
	<button @click="onClick" :disabled="disabled">
		<slot />
	</button>
</template>

<style scoped>
button {
	font-size: 1rem;
	padding: 0.5em 1em;
}
</style>
```

## References

- [Vue.js Style Guide](https://vuejs.org/style-guide/)
- [Vue 3 Documentation](https://vuejs.org/)
- [Vitest for Vue Testing](https://vitest.dev/)
