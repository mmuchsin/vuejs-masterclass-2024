<script setup lang="ts">
import { projectsQuery, type Projects } from '@/utils/supabaseQueries'
import { columns } from '@/utils/tableColumns/projectColumns'

usePageStore().pageData.title = 'Projects'

const projects = ref<Projects | null>(null)
const getProjects = async () => {
  const { data, error } = await projectsQuery

  if (error) console.log(error)

  projects.value = data
}

await getProjects()
</script>

<template>
  <DataTable v-if="projects" :columns="columns" :data="projects" />
</template>
