<script setup lang="ts">
import { supabase } from '@/lib/supabaseClient'
import { onMounted, ref } from 'vue'
import type { Tables } from 'database/types'

// Define the tasks array with the correct type
const tasks = ref<Tables<'tasks'>[] | null>(null)

// Function to fetch tasks from Supabase
const getTasks = async () => {
  const { data, error } = await supabase.from('tasks').select().order('id')

  // Check for errors before updating the tasks array
  if (error) {
    console.error('Error fetching tasks:', error)
    return
  }

  // Update tasks value if data is not null
  tasks.value = data
}

// Fetch tasks when the component is mounted
onMounted(() => {
  getTasks()
})
</script>

<template>
  <div>
    <h1>Tasks Page</h1>
    <router-link to="/">Home</router-link>
    <ul v-for="task in tasks" :key="task.id">
      <li>
        <router-link to="/tasks">{{ task.name }}</router-link>
      </li>
    </ul>
  </div>
</template>
