<script setup lang="ts">
import { supabase } from '@/lib/supabaseClient'
import { h, onMounted, ref } from 'vue'
import type { Tables } from 'database/types'
import type { ColumnDef } from '@tanstack/vue-table'
import DataTable from '@/components/ui/data-table/DataTable.vue'
import { RouterLink } from 'vue-router'

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

const columns: ColumnDef<Tables<'tasks'>>[] = [
  {
    accessorKey: 'name',
    header: () => h('div', { class: 'text-left' }, 'Name'),
    cell: ({ row }) => {
      return h(
        RouterLink,
        {
          to: `/tasks/${row.original.id}`,
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
    accessorKey: 'due_date',
    header: () => h('div', { class: 'text-left' }, 'Due Date'),
    cell: ({ row }) => {
      return h(
        'div',
        { class: 'text-left font-medium' },
        row.getValue('due_date'),
      )
    },
  },
  {
    accessorKey: 'project_id',
    header: () => h('div', { class: 'text-left' }, 'Project'),
    cell: ({ row }) => {
      return h(
        'div',
        { class: 'text-left font-medium' },
        row.getValue('project_id'),
      )
    },
  },
  {
    accessorKey: 'collaborators',
    header: () => h('div', { class: 'text-left' }, 'Collaborators'),
    cell: ({ row }) => {
      return h(
        'div',
        { class: 'text-left font-medium' },
        JSON.stringify(row.getValue('collaborators')),
      )
    },
  },
]

// Fetch tasks when the component is mounted
onMounted(() => {
  getTasks()
})
</script>

<template>
  <div class="container mx-auto py-10">
    <DataTable v-if="tasks" :columns="columns" :data="tasks" />
  </div>
</template>
