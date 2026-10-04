/*
# Algoritma Santuy — Core Schema

## Overview
Creates the full database schema for the "Algoritma Santuy Ala Anak Tapaktuan — Interactive Lab"
educational platform. This includes profiles, chapters, exercises, hints, attempts, chapter
results, and student progress tracking.

## New Tables

### profiles
Extends auth.users with app-specific data: role (student/lecturer), full name, NIM, semester,
program of study, department, learning level, and password change tracking.

### chapters
15 chapters covering algorithm fundamentals. Each has title, story, lab type, concept, and
ordering.

### exercises
Exercises belonging to chapters. Each has concept, skill tag, learning objective, learning level,
difficulty, scenario, question type, question text, and equivalent_group for linking equivalent
questions.

### exercise_options
Multiple-choice options for exercises that use them.

### hints
Hints for exercises, ordered by reveal level.

### attempts
Every attempt a student makes on an exercise. Stores answer, score, correctness, hint usage,
error type, and timestamp. Never overwritten — full history preserved.

### chapter_results
Aggregated result per student per chapter: score, mastery level, attempt count, completion status.

### student_progress
Overall progress per student: total attempts, average score, overall mastery, completed chapters.

## Security
- RLS enabled on all tables.
- Profiles: users can read/update their own; lecturers can read all profiles.
- Content tables (chapters, exercises, options, hints): readable by all authenticated users.
- Attempt/result/progress tables: students see their own; lecturers see all (via role check).
*/

-- ============ PROFILES ============
CREATE TABLE IF NOT EXISTS profiles (
  id uuid PRIMARY KEY REFERENCES auth.users(id) ON DELETE CASCADE,
  role text NOT NULL DEFAULT 'student' CHECK (role IN ('student', 'lecturer')),
  full_name text NOT NULL,
  nim text UNIQUE,
  semester int,
  program_studi text,
  jurusan text,
  learning_level text CHECK (learning_level IN ('SMP', 'SMA_SMK', 'D3_S1')),
  password_changed boolean NOT NULL DEFAULT false,
  created_at timestamptz DEFAULT now()
);

ALTER TABLE profiles ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "select_own_profile" ON profiles;
CREATE POLICY "select_own_profile" ON profiles FOR SELECT
TO authenticated USING (auth.uid() = id);

DROP POLICY IF EXISTS "update_own_profile" ON profiles;
CREATE POLICY "update_own_profile" ON profiles FOR UPDATE
TO authenticated USING (auth.uid() = id) WITH CHECK (auth.uid() = id);

-- Lecturers can read all profiles
DROP POLICY IF EXISTS "lecturer_read_all_profiles" ON profiles;
CREATE POLICY "lecturer_read_all_profiles" ON profiles FOR SELECT
TO authenticated USING (
  EXISTS (SELECT 1 FROM profiles p WHERE p.id = auth.uid() AND p.role = 'lecturer')
);

-- ============ CHAPTERS ============
CREATE TABLE IF NOT EXISTS chapters (
  id int PRIMARY KEY,
  title text NOT NULL,
  subtitle text,
  story text,
  lab_name text,
  lab_type text CHECK (lab_type IN ('simulation', 'decision', 'algorithm_builder', 'flowchart_builder')),
  concept text,
  learning_focus text,
  sort_order int NOT NULL DEFAULT 0,
  created_at timestamptz DEFAULT now()
);

ALTER TABLE chapters ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "read_chapters" ON chapters;
CREATE POLICY "read_chapters" ON chapters FOR SELECT
TO authenticated USING (true);

-- ============ EXERCISES ============
CREATE TABLE IF NOT EXISTS exercises (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  chapter_id int NOT NULL REFERENCES chapters(id) ON DELETE CASCADE,
  concept text NOT NULL,
  skill_tag text NOT NULL,
  learning_objective text NOT NULL,
  learning_level text NOT NULL CHECK (learning_level IN ('SMP', 'SMA_SMK', 'D3_S1')),
  difficulty int NOT NULL DEFAULT 1 CHECK (difficulty BETWEEN 1 AND 5),
  scenario text NOT NULL,
  question_type text NOT NULL CHECK (question_type IN ('multiple_choice', 'decision', 'sequence', 'text')),
  question text NOT NULL,
  correct_answer text NOT NULL,
  equivalent_group text,
  error_type_hint text,
  sort_order int NOT NULL DEFAULT 0,
  created_at timestamptz DEFAULT now()
);

ALTER TABLE exercises ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "read_exercises" ON exercises;
CREATE POLICY "read_exercises" ON exercises FOR SELECT
TO authenticated USING (true);

-- ============ EXERCISE OPTIONS ============
CREATE TABLE IF NOT EXISTS exercise_options (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  exercise_id uuid NOT NULL REFERENCES exercises(id) ON DELETE CASCADE,
  label text NOT NULL,
  is_correct boolean NOT NULL DEFAULT false,
  sort_order int NOT NULL DEFAULT 0
);

ALTER TABLE exercise_options ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "read_exercise_options" ON exercise_options;
CREATE POLICY "read_exercise_options" ON exercise_options FOR SELECT
TO authenticated USING (true);

-- ============ HINTS ============
CREATE TABLE IF NOT EXISTS hints (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  exercise_id uuid NOT NULL REFERENCES exercises(id) ON DELETE CASCADE,
  level int NOT NULL DEFAULT 1,
  text text NOT NULL
);

ALTER TABLE hints ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "read_hints" ON hints;
CREATE POLICY "read_hints" ON hints FOR SELECT
TO authenticated USING (true);

-- ============ ATTEMPTS ============
CREATE TABLE IF NOT EXISTS attempts (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  student_id uuid NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
  chapter_id int NOT NULL REFERENCES chapters(id) ON DELETE CASCADE,
  exercise_id uuid NOT NULL REFERENCES exercises(id) ON DELETE CASCADE,
  attempt_number int NOT NULL DEFAULT 1,
  answer text,
  score numeric NOT NULL DEFAULT 0,
  correct boolean NOT NULL DEFAULT false,
  hint_used boolean NOT NULL DEFAULT false,
  error_type text CHECK (error_type IN ('INPUT_ERROR', 'LOGIC_ERROR', 'PROCESS_ERROR', 'OUTPUT_ERROR', 'SEQUENCE_ERROR', 'CONDITION_ERROR', 'VALIDATION_ERROR', 'NONE')),
  created_at timestamptz DEFAULT now()
);

ALTER TABLE attempts ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "select_own_attempts" ON attempts;
CREATE POLICY "select_own_attempts" ON attempts FOR SELECT
TO authenticated USING (auth.uid() = student_id);

DROP POLICY IF EXISTS "insert_own_attempts" ON attempts;
CREATE POLICY "insert_own_attempts" ON attempts FOR INSERT
TO authenticated WITH CHECK (auth.uid() = student_id);

DROP POLICY IF EXISTS "lecturer_read_attempts" ON attempts;
CREATE POLICY "lecturer_read_attempts" ON attempts FOR SELECT
TO authenticated USING (
  EXISTS (SELECT 1 FROM profiles p WHERE p.id = auth.uid() AND p.role = 'lecturer')
);

CREATE INDEX IF NOT EXISTS idx_attempts_student ON attempts(student_id);
CREATE INDEX IF NOT EXISTS idx_attempts_chapter ON attempts(chapter_id);
CREATE INDEX IF NOT EXISTS idx_attempts_exercise ON attempts(exercise_id);

-- ============ CHAPTER RESULTS ============
CREATE TABLE IF NOT EXISTS chapter_results (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  student_id uuid NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
  chapter_id int NOT NULL REFERENCES chapters(id) ON DELETE CASCADE,
  score numeric NOT NULL DEFAULT 0,
  mastery_level int NOT NULL DEFAULT 0 CHECK (mastery_level BETWEEN 0 AND 5),
  attempts int NOT NULL DEFAULT 0,
  completed boolean NOT NULL DEFAULT false,
  updated_at timestamptz DEFAULT now(),
  UNIQUE(student_id, chapter_id)
);

ALTER TABLE chapter_results ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "select_own_chapter_results" ON chapter_results;
CREATE POLICY "select_own_chapter_results" ON chapter_results FOR SELECT
TO authenticated USING (auth.uid() = student_id);

DROP POLICY IF EXISTS "insert_own_chapter_results" ON chapter_results;
CREATE POLICY "insert_own_chapter_results" ON chapter_results FOR INSERT
TO authenticated WITH CHECK (auth.uid() = student_id);

DROP POLICY IF EXISTS "update_own_chapter_results" ON chapter_results;
CREATE POLICY "update_own_chapter_results" ON chapter_results FOR UPDATE
TO authenticated USING (auth.uid() = student_id) WITH CHECK (auth.uid() = student_id);

DROP POLICY IF EXISTS "lecturer_read_chapter_results" ON chapter_results;
CREATE POLICY "lecturer_read_chapter_results" ON chapter_results FOR SELECT
TO authenticated USING (
  EXISTS (SELECT 1 FROM profiles p WHERE p.id = auth.uid() AND p.role = 'lecturer')
);

CREATE INDEX IF NOT EXISTS idx_chapter_results_student ON chapter_results(student_id);
CREATE INDEX IF NOT EXISTS idx_chapter_results_chapter ON chapter_results(chapter_id);

-- ============ STUDENT PROGRESS ============
CREATE TABLE IF NOT EXISTS student_progress (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  student_id uuid NOT NULL UNIQUE REFERENCES auth.users(id) ON DELETE CASCADE,
  total_attempts int NOT NULL DEFAULT 0,
  avg_score numeric NOT NULL DEFAULT 0,
  overall_mastery int NOT NULL DEFAULT 0,
  completed_chapters int NOT NULL DEFAULT 0,
  updated_at timestamptz DEFAULT now()
);

ALTER TABLE student_progress ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "select_own_progress" ON student_progress;
CREATE POLICY "select_own_progress" ON student_progress FOR SELECT
TO authenticated USING (auth.uid() = student_id);

DROP POLICY IF EXISTS "insert_own_progress" ON student_progress;
CREATE POLICY "insert_own_progress" ON student_progress FOR INSERT
TO authenticated WITH CHECK (auth.uid() = student_id);

DROP POLICY IF EXISTS "update_own_progress" ON student_progress;
CREATE POLICY "update_own_progress" ON student_progress FOR UPDATE
TO authenticated USING (auth.uid() = student_id) WITH CHECK (auth.uid() = student_id);

DROP POLICY IF EXISTS "lecturer_read_progress" ON student_progress;
CREATE POLICY "lecturer_read_progress" ON student_progress FOR SELECT
TO authenticated USING (
  EXISTS (SELECT 1 FROM profiles p WHERE p.id = auth.uid() AND p.role = 'lecturer')
);

-- ============ PASSWORD HISTORY ============
CREATE TABLE IF NOT EXISTS password_history (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id uuid NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
  changed_at timestamptz DEFAULT now()
);

ALTER TABLE password_history ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "select_own_password_history" ON password_history;
CREATE POLICY "select_own_password_history" ON password_history FOR SELECT
TO authenticated USING (auth.uid() = user_id);

DROP POLICY IF EXISTS "insert_own_password_history" ON password_history;
CREATE POLICY "insert_own_password_history" ON password_history FOR INSERT
TO authenticated WITH CHECK (auth.uid() = user_id);

-- ============ TRIGGER: auto-create profile on signup ============
CREATE OR REPLACE FUNCTION handle_new_user()
RETURNS trigger
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
BEGIN
  INSERT INTO profiles (id, role, full_name, nim, semester, program_studi, jurusan, learning_level, password_changed)
  VALUES (
    NEW.id,
    COALESCE(NEW.raw_user_meta_data->>'role', 'student'),
    COALESCE(NEW.raw_user_meta_data->>'full_name', 'Pengguna Baru'),
    NEW.raw_user_meta_data->>'nim',
    NULLIF(NEW.raw_user_meta_data->>'semester', '')::int,
    NEW.raw_user_meta_data->>'program_studi',
    NEW.raw_user_meta_data->>'jurusan',
    NEW.raw_user_meta_data->>'learning_level',
    false
  );
  RETURN NEW;
END;
$$;

DROP TRIGGER IF EXISTS on_auth_user_created ON auth.users;
CREATE TRIGGER on_auth_user_created
  AFTER INSERT ON auth.users
  FOR EACH ROW EXECUTE FUNCTION handle_new_user();

-- ============ GRANT SELECT on auth.users for lecturer profile lookups ============
-- Lecturers need to see student emails. We already grant via profiles table which is sufficient.