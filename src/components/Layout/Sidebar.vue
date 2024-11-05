<script setup lang="ts">
import Button from '@/components/ui/button/Button.vue'
import SidebarLinks from './SidebarLinks.vue'

const links = [
  {
    title: 'Dashboard',
    to: '/',
    icon: 'lucide:house',
  },
  {
    title: 'Projects',
    to: '/projects',
    icon: 'lucide:building-2',
  },
  {
    title: 'My Tasks',
    to: '/tasks',
    icon: 'lucide:badge-check',
  },
]

const accountLinks = [
  {
    title: 'Profile',
    to: '/profile',
    icon: 'lucide:user',
  },
  {
    title: 'Settings',
    to: '/settings',
    icon: 'lucide:settings',
  },
  {
    title: 'Sign out',
    to: '/signout',
    icon: 'lucide:log-out',
  },
]
</script>

<template>
  <aside
    class="fixed flex h-screen w-16 flex-col gap-2 border-r bg-muted/40 transition-[width] lg:w-52"
  >
    <!-- Header with Menu and Add buttons for quick actions -->
    <div
      class="flex h-16 shrink-0 items-center justify-between gap-1 border-b px-2 lg:px-4"
    >
      <!-- Menu button to expand or collapse the sidebar -->
      <Button variant="outline" size="icon" class="h-8 w-8">
        <iconify-icon icon="lucide:menu"></iconify-icon>
      </Button>

      <!-- Add button for additional actions, possibly to create new items -->
      <Button variant="outline" size="icon" class="h-8 w-8">
        <iconify-icon icon="lucide:plus"></iconify-icon>
      </Button>
    </div>

    <!-- Primary Navigation Links -->
    <!-- This navigation section allows users to navigate to core pages: Dashboard, Projects, and Tasks. -->
    <nav class="relative flex h-full flex-col justify-between gap-2">
      <div>
        <SidebarLinks :links />
      </div>

      <!-- Footer Navigation Links -->
      <!-- Provides quick access to Profile, Settings, and Sign Out links for user account management. -->
      <div class="border-y bg-background py-3 text-center">
        <SidebarLinks :links="accountLinks" />
      </div>
    </nav>
  </aside>
</template>
