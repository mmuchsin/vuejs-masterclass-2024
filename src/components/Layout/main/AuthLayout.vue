<script setup lang="ts">
import TopNavbar from '@/components/Layout/TopNavbar.vue'
import Sidebar from '@/components/Layout/Sidebar.vue'
</script>

<template>
  <!-- Sidebar Navigation Menu -->
  <!-- This section serves as the fixed sidebar, providing quick navigation links to key areas of the application. -->
  <Sidebar />

  <!-- Main Content Wrapper -->
  <!-- This main content wrapper pushes content to the right of the sidebar. -->
  <div class="ml-16 flex flex-col transition-[margin] lg:ml-52">
    <!-- Top Navigation Bar -->
    <!-- Contains a search bar for global search and user profile menu for account settings. -->
    <TopNavbar />

    <!-- Main Router View -->
    <!-- Displays the main content according to the selected route. -->
    <main class="flex flex-1 flex-col gap-4 p-4 lg:gap-6 lg:p-6">
      <div class="flex items-center">
        <h1 class="text-lg font-semibold md:text-2xl">Page Title</h1>
      </div>
      <slot />
    </main>
  </div>
</template>
