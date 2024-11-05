<script setup lang="ts">
import { supabase } from '@/lib/supabaseClient'
import { h, onMounted, ref } from 'vue'
import type { Tables } from 'database/types'
import type { ColumnDef } from '@tanstack/vue-table'
import DataTable from '@/components/ui/data-table/DataTable.vue'
import { RouterLink } from 'vue-router'

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

const columns: ColumnDef<Tables<'projects'>>[] = [
  {
    accessorKey: 'name',
    header: () => h('div', { class: 'text-left' }, 'Name'),
    cell: ({ row }) => {
      return h(
        RouterLink,
        {
          to: `/projects/${row.original.slug}`,
          class: 'text-left font-medium hover:bg-muted block w-full',
        },
        () => row.getValue('name'),
      )
    },
  },
  {
    accessorKey: 'status',
    header: () => h('div', { class: 'text-left' }, 'Status'),
    cell: ({ row }) => {
      return h(
        'div',
        { class: 'text-left font-medium' },
        row.getValue('status'),
      )
    },
  },
  {
    accessorKey: 'collaborators',
    header: () => h('div', { class: 'text-left' }, 'Collaborators'),
    cell: ({ row }) => {
      const collaborators = row.getValue('collaborators') as string[]
      return h(
        'div',
        { class: 'text-left font-medium' },
        collaborators.join(', '),
      )
    },
  },
]

// Fetch projects when the component is mounted
onMounted(() => {
  getProjects()
})
</script>

<template>
  <div class="container mx-auto py-10">
    <DataTable v-if="projects" :columns="columns" :data="projects" />
  </div>
</template>
