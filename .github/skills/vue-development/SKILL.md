---
name: vue-development
description: Coding standards and conventions for Vue.js 3 development with Composition API. Use when working with .vue files, Vue components, composables, or when the user asks about Vue.js patterns, single-file components, script setup syntax, or Vue-specific best practices.
metadata:
  author: devbyray
  version: "1.0"
  framework: "vue3"
  api: "composition-api"
---

# Vue.js Development Standards

Apply these standards when developing Vue.js 3 applications with the Composition API.

## General Guidelines

1. **Use Vue 3 with the Composition API** for all new components
2. **Organize code by feature/module**; keep related files together
3. **Use single-file components** (`.vue`) with `<script setup>`, `<template>`, and `<style scoped>` sections in that order
4. **Place sections in order**: `<script setup>` → `<template>` → `<style scoped>`
5. **Prefer `<script setup>` syntax** for simplicity and type inference
6. **Use TypeScript** in Vue components when possible

## Naming Conventions

- **PascalCase** for component names and file names (e.g., `MyComponent.vue`)
- **kebab-case** for custom event names and props in templates
- **Composables** should follow the `useXyz` pattern

## Component Structure

### Props and Emits
- Always define `props` with types and default values where appropriate
- Use `defineEmits` and `defineProps` for event and prop definitions

### State Management
- Use `ref` and `reactive` for state; avoid using `this`
- Use composables (`useXyz`) for reusable logic

### Templates
- Use `v-bind` and `v-on` shorthand (`:` and `@`)
- Use `v-if`/`v-else` for conditional rendering
- Use `v-for` for lists; **always provide a unique `:key`**
- **Avoid logic in templates**; keep templates declarative and move logic to the script section

### Styling
- Use CSS modules or `<style scoped>` for component styles
- Avoid global styles

## Code Quality

- End every statement with a semicolon
- Use single quotes for strings
- Avoid using `any` type; prefer explicit types
- Write clear JSDoc/TSDoc comments for composables and complex logic
- Follow accessibility and UI guidelines for all components
- Write unit tests for all components using Vitest

## Example Component

```vue
<script setup lang='ts'>
import { ref, computed } from 'vue';
import { defineProps, defineEmits } from 'vue';

interface Props {
  title: string;
  disabled?: boolean;
}

const props = defineProps<Props>();
const emit = defineEmits<{
  (e: 'click'): void;
  (e: 'update', value: string): void;
}>();

const counter = ref(0);
const displayTitle = computed(() => `${props.title} (${counter.value})`);

const onClick = () => {
  if (!props.disabled) {
    counter.value++;
    emit('click');
  }
};
</script>

<template>
  <div class="card">
    <h2>{{ displayTitle }}</h2>
    <button 
      @click="onClick" 
      :disabled="disabled"
      class="btn"
    >
      Click me
    </button>
  </div>
</template>

<style scoped>
.card {
  padding: 1rem;
  border: 1px solid #ccc;
  border-radius: 8px;
}

.btn {
  padding: 0.5rem 1rem;
  background-color: #42b983;
  color: white;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

.btn:disabled {
  opacity: 0.5;
  cursor: not-allowed;
}
</style>
```

## Example Composable

```typescript
// composables/useCounter.ts
import { ref, computed } from 'vue';

export const useCounter = (initialValue = 0) => {
  const count = ref(initialValue);
  const doubleCount = computed(() => count.value * 2);

  const increment = () => {
    count.value++;
  };

  const decrement = () => {
    count.value--;
  };

  const reset = () => {
    count.value = initialValue;
  };

  return {
    count,
    doubleCount,
    increment,
    decrement,
    reset,
  };
};
```

## When to Apply

Apply these standards when:
- Creating new Vue components
- Writing composables
- Reviewing or refactoring Vue code
- User asks about Vue.js best practices
- Working with Vue 3 Composition API
