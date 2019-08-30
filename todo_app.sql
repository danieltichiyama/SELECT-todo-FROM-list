--1
DROP TABLE IF EXISTS tasks;

--2
CREATE TABLE tasks (
    id SERIAL PRIMARY KEY,
    title character varying (255) NOT NULL,
    description text,
    created_at timestamp NOT NULL,
    updated_at timestamp DEFAULT now(),
    completed boolean NOT NULL DEFAULT false
    );

--3
ALTER TABLE tasks 
DROP COLUMN completed;

--4x

--5
ALTER TABLE tasks
ADD COLUMN completed_at timestamp;

--6
ALTER TABLE tasks ALTER COLUMN completed_at SET DEFAULT NULL;

--7
ALTER TABLE tasks ALTER COLUMN updated_at SET NOT NULL;
ALTER TABLE tasks ALTER COLUMN updated_at SET DEFAULT now();

--8
INSERT INTO tasks
VALUES ( DEFAULT, 'Study SQL', 'Complete this exercise', now(), now(), NULL);

--9
INSERT INTO tasks
VALUES (DEFAULT, 'Study PostgreSQL', 'Read all the documentation', now(),now(),NULL);

--10
SELECT title FROM tasks
WHERE completed_at IS NULL;

--11
UPDATE tasks
SET completed_at = now()
WHERE title = 'Study SQL';

--12
SELECT title FROM tasks
WHERE completed_at IS NULL;

--13
SELECT * FROM tasks
ORDER BY created_at DESC;