import { supabase } from '@/lib/supabaseClient'
import type { QueryData } from '@supabase/supabase-js'

export const projectsQuery = supabase.from('projects').select()

export const taskWihtProjectsQuery = supabase
  .from('tasks')
  .select('*, projects(id, name, slug)')

export type Projects = QueryData<typeof projectsQuery>
export type TaskWithProjects = QueryData<typeof taskWihtProjectsQuery>
