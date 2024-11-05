<script setup lang="ts">
interface linkProp {
  title: string
  to: string
  icon: string
}

defineProps<{
  links: linkProp[]
}>()
</script>

<template>
  <RouterLink
    v-for="link in links"
    :key="link.title"
    :to="link.to"
    class="mx-2 flex items-center justify-center gap-3 rounded-lg px-4 py-2 text-muted-foreground transition-colors hover:text-primary lg:justify-normal"
    exact-active-class="bg-muted text-primary"
  >
    <iconify-icon :icon="link.icon"></iconify-icon>
    <span class="hidden text-nowrap lg:block">{{ link.title }}</span>
  </RouterLink>
</template>
