---
name: nuxt-development
description: Standards for Nuxt.js 3 development with auto-imports, file-based routing, and SSR/SSG capabilities. Use when working with Nuxt projects, pages/, layouts/, composables/ directories, or when the user asks about Nuxt-specific patterns, server-side rendering, or Nuxt configuration.
metadata:
    author: devbyray
    version: '1.0'
    framework: 'nuxt3'
    depends-on: 'vue-development'
---

# Nuxt.js Development Standards

Apply these standards when developing Nuxt.js 3 applications. For general Vue coding standards, also refer to the vue-development skill.

## Prerequisites

This skill extends Vue.js development standards. Follow all Vue 3 Composition API guidelines unless specifically overridden here.

## Nuxt-Specific Guidelines

### Pages (File-Based Routing)

- Place all route pages in the `pages/` directory
- File and folder names automatically define the route structure
- Use `<script setup>` at the top, followed by `<template>`, then `<style scoped>`
- Use TypeScript for all pages when possible

**Example structure:**

```
pages/
├── index.vue           # Route: /
├── about.vue           # Route: /about
├── users/
│   ├── index.vue      # Route: /users
│   └── [id].vue       # Route: /users/:id
└── [...slug].vue       # Catch-all route
```

### Layouts

- Place shared layouts in the `layouts/` directory
- Use `default.vue` for the main app shell
- Use `<NuxtLayout />` component to switch layouts dynamically
- Use `definePageMeta` composable for page-specific metadata

**Example layout:**

```vue
<script setup lang="ts">
// layouts/default.vue
</script>

<template>
	<div class="layout">
		<header>
			<nav><!-- Navigation --></nav>
		</header>
		<main>
			<slot />
		</main>
		<footer><!-- Footer --></footer>
	</div>
</template>
```

**Using layouts:**

```vue
<script setup lang="ts">
definePageMeta({
	layout: 'custom'
})
</script>
```

### Auto-Import Components

- Place reusable components in the `components/` directory
- Nuxt auto-imports components - no manual imports needed
- Use PascalCase for component file names
- Organize with subdirectories for namespacing

**Example:**

```
components/
├── AppHeader.vue        # <AppHeader />
├── TheFooter.vue        # <TheFooter />
└── user/
    └── UserCard.vue     # <UserCard /> or <UserUserCard />
```

### Composables

- Place composable functions in the `composables/` directory
- Nuxt auto-imports composables starting with `use`
- Use Nuxt-specific composables:
    - `useRoute()` - Current route information
    - `useRouter()` - Router instance
    - `useAsyncData()` - Fetch data with SSR support
    - `useFetch()` - Simplified data fetching
    - `useState()` - Shared state across components
    - `useCookie()` - Cookie management
    - `useHead()` - Meta tags and SEO

**Example composable:**

```typescript
// composables/useAuth.ts
export const useAuth = () => {
	const user = useState('user', () => null)
	const isAuthenticated = computed(() => !!user.value)

	const login = async credentials => {
		const data = await $fetch('/api/auth/login', {
			method: 'POST',
			body: credentials
		})
		user.value = data.user
	}

	const logout = () => {
		user.value = null
	}

	return {
		user,
		isAuthenticated,
		login,
		logout
	}
}
```

### Data Fetching

Use `useFetch` or `useAsyncData` for SSR-compatible data fetching:

```vue
<script setup lang="ts">
// Automatic key generation
const { data: users } = await useFetch('/api/users')

// Manual key for more control
const { data: user, refresh } = await useAsyncData('user', () => $fetch(`/api/users/${route.params.id}`))

// With options
const { data, pending, error } = await useFetch('/api/data', {
	method: 'POST',
	body: { query: 'search' },
	lazy: true, // Don't block navigation
	server: true, // SSR
	watch: [searchQuery] // Re-fetch on change
})
</script>
```

### Server Routes (API)

- Place API routes in the `server/api/` directory
- Use event handlers with `defineEventHandler`

**Example:**

```typescript
// server/api/users/[id].get.ts
export default defineEventHandler(async event => {
	const id = getRouterParam(event, 'id')

	// Fetch user from database
	const user = await prisma.user.findUnique({
		where: { id: parseInt(id) }
	})

	if (!user) {
		throw createError({
			statusCode: 404,
			message: 'User not found'
		})
	}

	return user
})
```

### Middleware

- Place middleware in the `middleware/` directory
- Auto-imported and available globally or per-page

**Example:**

```typescript
// middleware/auth.ts
export default defineNuxtRouteMiddleware((to, from) => {
	const auth = useAuth()

	if (!auth.isAuthenticated.value) {
		return navigateTo('/login')
	}
})
```

**Apply to page:**

```vue
<script setup lang="ts">
definePageMeta({
	middleware: ['auth']
})
</script>
```

### Directory Structure

Follow Nuxt's conventions:

```
project/
├── .nuxt/              # Build output (auto-generated)
├── assets/             # Uncompiled assets (CSS, images)
├── components/         # Auto-imported components
├── composables/        # Auto-imported composables
├── layouts/            # App layouts
├── middleware/         # Route middleware
├── pages/              # File-based routing
├── plugins/            # App plugins
├── public/             # Static assets
├── server/             # Server-side code
│   ├── api/           # API endpoints
│   ├── middleware/    # Server middleware
│   └── routes/        # Server routes
├── stores/             # Pinia stores (if using state management)
├── nuxt.config.ts      # Nuxt configuration
└── app.vue             # Root component (optional)
```

### Configuration

**nuxt.config.ts:**

```typescript
export default defineNuxtConfig({
	devtools: { enabled: true },

	modules: ['@nuxtjs/tailwindcss', '@pinia/nuxt'],

	runtimeConfig: {
		// Private (server-only)
		apiSecret: process.env.API_SECRET,

		// Public (client + server)
		public: {
			apiBase: process.env.API_BASE_URL || '/api'
		}
	},

	app: {
		head: {
			title: 'My Nuxt App',
			meta: [{ charset: 'utf-8' }, { name: 'viewport', content: 'width=device-width, initial-scale=1' }]
		}
	}
})
```

## Example Page Component

```vue
<script setup lang="ts">
import { ref } from 'vue'

// Auto-imported composables
const route = useRoute()
const router = useRouter()

// Page metadata
definePageMeta({
	layout: 'default',
	middleware: ['auth']
})

// SEO
useHead({
	title: 'User Profile',
	meta: [{ name: 'description', content: 'User profile page' }]
})

// Data fetching with SSR
const { data: user, pending } = await useFetch(`/api/users/${route.params.id}`)

// Local state
const isEditing = ref(false)

const saveProfile = async () => {
	await $fetch(`/api/users/${route.params.id}`, {
		method: 'PUT',
		body: user.value
	})
	isEditing.value = false
}
</script>

<template>
	<div class="profile">
		<h1 v-if="pending">Loading...</h1>
		<div v-else-if="user">
			<h1>{{ user.name }}</h1>
			<p>{{ user.email }}</p>

			<button @click="isEditing = !isEditing">
				{{ isEditing ? 'Cancel' : 'Edit' }}
			</button>

			<button v-if="isEditing" @click="saveProfile">Save</button>
		</div>
	</div>
</template>

<style scoped>
.profile {
	padding: 2rem;
}
</style>
```

## Best Practices

1. **Use auto-imports** - No need to manually import Vue, Nuxt composables, or components
2. **SSR-first** - Always consider server-side rendering in data fetching
3. **Use `useFetch`** - Prefer over manual `fetch` for automatic SSR handling
4. **Type safety** - Enable TypeScript for better DX
5. **Middleware** - Use for authentication, redirects, and data validation
6. **State management** - Use `useState` for simple shared state, Pinia for complex state
7. **Error handling** - Use `throw createError()` for consistent error pages

## When to Apply

Apply these standards when:

- Creating Nuxt.js projects
- Building pages and layouts
- Writing composables
- Creating API endpoints
- Implementing SSR/SSG
- User asks about Nuxt.js patterns
