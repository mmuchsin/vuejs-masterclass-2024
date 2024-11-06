DROP TABLE IF EXISTS projects;

-- First, create an ENUM type for the status column
DROP TYPE IF EXISTS current_status;

CREATE TYPE current_status AS ENUM ('in-progress', 'completed');

-- Now, create the table with the columns and data types specified
CREATE TABLE
  projects (
    id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY NOT NULL, -- use BIGINT for large integer values
    created_at TIMESTAMPTZ DEFAULT NOW() NOT NULL, -- timestamp with timezone, defaults to current timestamp
    name TEXT NOT NULL, -- text data type for the name
    slug TEXT UNIQUE NOT NULL, -- text data type for the slug,
    description TEXT,
    status current_status DEFAULT 'in-progress' NOT NULL, -- using the ENUM type created above
    collaborators TEXT ARRAY DEFAULT ARRAY[]::TEXT[] NOT NULL -- text data type for collaborators
  );
  