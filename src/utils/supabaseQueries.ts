import { supabase } from '@/lib/supabaseClient'
import type { QueryData } from '@supabase/supabase-js'

export const projectsQuery = supabase.from('projects').select()
export type Projects = QueryData<typeof projectsQuery>

export const taskWihtProjectsQuery = supabase
  .from('tasks')
  .select('*, projects(id, name, slug)')
export type TaskWithProjects = QueryData<typeof taskWihtProjectsQuery>

export const projectBySlugQuery = (slug: string) =>
  supabase
    .from('projects')
    .select('*, tasks(id, name, status, due_date)')
    .eq('slug', slug)
    .single()
export type ProjectsBySlug = QueryData<ReturnType<typeof projectBySlugQuery>>

export const taskByIdQuery = (id: string) =>
  supabase
    .from('tasks')
    .select('*, projects(id, name, description, status, collaborators)')
    .eq('id', id)
    .single()
export type TaskById = QueryData<ReturnType<typeof taskByIdQuery>>
