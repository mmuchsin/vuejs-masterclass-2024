DROP TABLE IF EXISTS tasks;
CREATE TABLE tasks (
    id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY NOT NULL,
    created_at TIMESTAMPTZ DEFAULT NOW() NOT NULL,
    name TEXT NOT NULL,
    status current_status DEFAULT 'in-progress' NOT NULL,
    description TEXT NOT NULL,
    due_date DATE DEFAULT NULL,
    project_id BIGINT REFERENCES projects (id) DEFAULT NULL,
    collaborators TEXT[] DEFAULT ARRAY[]::VARCHAR[] NOT NULL
);
