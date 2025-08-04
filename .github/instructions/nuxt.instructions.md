---
description: Coding standards and conventions for Nuxt.js projects in this repository.
applyTo: "**/*.vue"
---


# Nuxt.js Coding Instructions

For all general Vue coding standards, see [vue.instructions.md](./vue.instructions.md). Follow those rules for all Nuxt components and pages unless overridden below.

## Nuxt-Specific Guidelines

### Pages
- Place all route pages in the `pages/` directory. File and folder names define the route structure automatically.
- Use `<script setup>` at the top of each page file, followed by `<template>`, then `<style scoped>`.
- Use TypeScript for all pages when possible.

### Layouts
- Place shared layouts in the `layouts/` directory. Use the `default.vue` layout for the main app shell.
- Use the `<NuxtLayout />` component to switch layouts dynamically.
- Use the `definePageMeta` composable to set page-specific metadata.

### Auto-Import Components
- Place reusable components in the `components/` directory. Nuxt auto-imports components, so you do not need to manually import them in your templates.
- Use PascalCase for component file names and references in templates.

### Composables
- Place composable functions in the `composables/` directory. Nuxt auto-imports composables that start with `use` (e.g., `useAuth`).
- Use Nuxt composables such as `useRoute`, `useRouter`, `useAsyncData`, and `useFetch` for routing and data fetching.

### Directory Structure
- Organize your app using Nuxt's conventions: `pages/`, `layouts/`, `components/`, `composables/`, `stores/`, and `middleware/`.

### Example Page Component

```vue
<script setup lang='ts'>
import { ref } from 'vue';
import { useRoute } from 'route';

const route = useRoute();
const count = ref(0);

const increment = () => {
  count.value++;
};
</script>

<template>
  <section>
    <h2>Welcome to Nuxt!</h2>
    <p>Current route: {{ route.path }}</p>
    <button @click="increment">Clicked {{ count }} times</button>
  </section>
</template>

<style scoped>
section {
  padding: 2rem;
}
button {
  font-size: 1rem;
  margin-top: 1rem;
}
</style>
```

## References
- [Nuxt 3 Documentation](https://nuxt.com/docs)
- [Nuxt 3 Directory Structure](https://nuxt.com/docs/guide/directory-structure/nuxt)
- [Vue.js Style Guide](https://vuejs.org/style-guide/)
- [Vitest for Vue/Nuxt Testing](https://vitest.dev/)
