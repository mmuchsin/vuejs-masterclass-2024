<script setup lang="ts">
import { taskByIdQuery, type TaskById } from '@/utils/supabaseQueries'

const route = useRoute('/tasks/[id]')
const task = ref<TaskById | null>(null)

watch(
  () => task.value?.name,
  () => (usePageStore().pageData.title = `My Task: ${task.value?.name}`),
)

const getTask = async () => {
  const { data, error, status } = await taskByIdQuery(route.params.id)

  if (error) useErrorStore().setError({ error, customCode: status })

  task.value = data
}

await getTask()
</script>

<template>
  <Table>
    <TableRow>
      <TableHead> Name </TableHead>
      <TableCell> {{ task?.name }} </TableCell>
    </TableRow>
    <TableRow>
      <TableHead> Description </TableHead>
      <TableCell>
        {{ task?.description }}
      </TableCell>
    </TableRow>
    <TableRow>
      <TableHead> Assignee </TableHead>
      <TableCell>Lorem ipsum</TableCell>
    </TableRow>
    <TableRow>
      <TableHead> Project </TableHead>
      <TableCell> {{ task?.projects?.name }} </TableCell>
    </TableRow>
    <TableRow>
      <TableHead> Status </TableHead>
      <TableCell>{{ task?.status }}</TableCell>
    </TableRow>
    <TableRow>
      <TableHead> Collaborators </TableHead>
      <TableCell>
        <div class="flex">
          <Avatar
            class="-mr-4 border border-primary transition-transform hover:scale-110"
            v-for="n in task?.projects?.collaborators"
            :key="n"
          >
            <RouterLink
              class="flex h-full w-full items-center justify-center"
              to=""
            >
              <AvatarImage src="" alt="" />
              <AvatarFallback> </AvatarFallback>
            </RouterLink>
          </Avatar>
        </div>
      </TableCell>
    </TableRow>
    <TableRow class="hover:bg-transparent">
      <TableHead class="pt-4 align-top"> Comments </TableHead>

      <TableCell>
        Comments cards goes in here..

        <div class="my-2 flex flex-col justify-between rounded-md bg-muted p-3">
          <textarea
            placeholder="Add your comment.."
            class="prose-sm prose dark:prose-invert w-full max-w-full overflow-y-auto rounded border border-muted bg-background p-3 hover:border-muted"
          >
          </textarea>
          <div class="mt-3 flex justify-between">
            <Button> Comment </Button>
            <div class="flex gap-4">
              <button variant="ghost" @click.prevent>
                <iconify-icon icon="lucide:paperclip"></iconify-icon>
                <span class="sr-only">Attach file</span>
              </button>
              <button variant="ghost" @click.prevent>
                <iconify-icon icon="lucide:image-up"></iconify-icon>

                <span class="sr-only">Upload image</span>
              </button>
            </div>
          </div>
        </div>
      </TableCell>
    </TableRow>
  </Table>
</template>
