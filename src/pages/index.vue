<script setup lang="ts">
usePageStore().pageData.title = 'Home Page'
</script>

<template>
  <div>
    <h1>Home Page</h1>
    <router-link :to="{ name: '/projects/' }">Projects</router-link>
  </div>
</template>
