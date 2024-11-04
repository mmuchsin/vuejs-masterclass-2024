<script setup lang="ts">
import { supabase } from '@/lib/supabaseClient'
import { onMounted, ref } from 'vue'
import type { Tables } from 'database/types'

// Define the projects array with the correct type
const projects = ref<Tables<'projects'>[] | null>(null)

// Function to fetch projects from Supabase
const getProjects = async () => {
  const { data, error } = await supabase.from('projects').select().order('id')

  // Check for errors before updating the projects array
  if (error) {
    console.error('Error fetching projects:', error)
    return
  }

  // Update projects value if data is not null
  projects.value = data
}

// Fetch projects when the component is mounted
onMounted(() => {
  getProjects()
})
</script>

<template>
  <div>
    <h1>Projects Page</h1>
    <router-link to="/">Home</router-link>
    <ul v-for="project in projects" :key="project.id">
      <li>
        <router-link
          :to="{ name: '/projects/[id]', params: { id: project.id } }"
          >{{ project.name }}</router-link
        >
      </li>
    </ul>
  </div>
</template>
