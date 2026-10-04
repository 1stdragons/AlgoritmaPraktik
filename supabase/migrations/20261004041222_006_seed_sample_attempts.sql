/*
# Seed Sample Attempts and Progress for Demo Students

## Overview
Creates sample attempt records and chapter results for the 3 demo students so the lecturer
dashboard and analytics have data to display on first run.

## Data
- Attempts: several per student across different chapters, including some incorrect answers
  with error types and hint usage
- Chapter results: aggregated score, mastery level, completion
- Student progress: overall summary
*/

DO $$
DECLARE
  s1 uuid; s2 uuid; s3 uuid;
BEGIN
  SELECT id INTO s1 FROM auth.users WHERE email = '2024001@tapaktuan.edu';
  SELECT id INTO s2 FROM auth.users WHERE email = '2024002@tapaktuan.edu';
  SELECT id INTO s3 FROM auth.users WHERE email = '2024003@tapaktuan.edu';

  -- ============ STUDENT 1 (Siti) — good progress ============
  -- Bab 1: 2 attempts, 1 wrong then 1 right
  INSERT INTO attempts (student_id, chapter_id, exercise_id, attempt_number, answer, score, correct, hint_used, error_type) VALUES
  (s1, 1, 'a0000001-0000-0000-0000-000000000001', 1, 'panaskan minyak, masukkan nasi, aduk', 0, false, false, 'INPUT_ERROR'),
  (s1, 1, 'a0000001-0000-0000-0000-000000000001', 2, 'nasi, minyak, kecap', 100, true, true, 'NONE'),
  (s1, 1, 'a0000001-0000-0000-0000-000000000002', 1, 'panaskan minyak, masukkan nasi, tambah kecap, aduk', 100, true, false, 'NONE'),
  (s1, 1, 'a0000001-0000-0000-0000-000000000003', 1, 'segelas kopi siap minum', 100, true, false, 'NONE')
  ON CONFLICT DO NOTHING;

  -- Bab 2
  INSERT INTO attempts (student_id, chapter_id, exercise_id, attempt_number, answer, score, correct, hint_used, error_type) VALUES
  (s1, 2, 'a0000002-0000-0000-0000-000000000001', 1, 'Siti belum menentukan tujuan / apa yang mau dimasak', 100, true, false, 'NONE'),
  (s1, 2, 'a0000002-0000-0000-0000-000000000002', 1, 'Langsung masukkan mie ke piring', 0, false, false, 'SEQUENCE_ERROR'),
  (s1, 2, 'a0000002-0000-0000-0000-000000000002', 2, 'Rebus air sampai mendidih', 100, true, true, 'NONE')
  ON CONFLICT DO NOTHING;

  -- Bab 3
  INSERT INTO attempts (student_id, chapter_id, exercise_id, attempt_number, answer, score, correct, hint_used, error_type) VALUES
  (s1, 3, 'a0000003-0000-0000-0000-000000000001', 1, 'Cek semua bahan / kondisi awal terlebih dahulu', 100, true, false, 'NONE'),
  (s1, 3, 'a0000003-0000-0000-0000-000000000002', 1, 'Bawang', 100, true, false, 'NONE'),
  (s1, 3, 'a0000003-0000-0000-0000-000000000003', 1, 'Batal masak karena telur habis', 0, false, false, 'LOGIC_ERROR'),
  (s1, 3, 'a0000003-0000-0000-0000-000000000003', 2, 'Masak nasi goreng dengan ayam sebagai pengganti telur', 100, true, true, 'NONE')
  ON CONFLICT DO NOTHING;

  -- Bab 4
  INSERT INTO attempts (student_id, chapter_id, exercise_id, attempt_number, answer, score, correct, hint_used, error_type) VALUES
  (s1, 4, 'a0000004-0000-0000-0000-000000000001', 1, '5-2-3-4-1', 100, true, false, 'NONE'),
  (s1, 4, 'a0000004-0000-0000-0000-000000000002', 1, 'CEK_NASI — jika nasi tidak ada, proses tidak bisa lanjut ke masak nasi goreng', 100, true, false, 'NONE')
  ON CONFLICT DO NOTHING;

  -- Chapter results for Siti
  INSERT INTO chapter_results (student_id, chapter_id, score, mastery_level, attempts, completed) VALUES
  (s1, 1, 100, 4, 4, true),
  (s1, 2, 100, 4, 3, true),
  (s1, 3, 100, 4, 4, true),
  (s1, 4, 100, 5, 2, true)
  ON CONFLICT (student_id, chapter_id) DO UPDATE SET
    score = EXCLUDED.score, mastery_level = EXCLUDED.mastery_level,
    attempts = EXCLUDED.attempts, completed = EXCLUDED.completed, updated_at = now();

  -- Student progress for Siti
  INSERT INTO student_progress (student_id, total_attempts, avg_score, overall_mastery, completed_chapters) VALUES
  (s1, 13, 100, 4, 4)
  ON CONFLICT (student_id) DO UPDATE SET
    total_attempts = 13, avg_score = 100, overall_mastery = 4, completed_chapters = 4, updated_at = now();

  -- ============ STUDENT 2 (Ibrahim) — medium progress ============
  INSERT INTO attempts (student_id, chapter_id, exercise_id, attempt_number, answer, score, correct, hint_used, error_type) VALUES
  (s2, 1, 'a0000001-0000-0000-0000-000000000001', 1, 'nasi, minyak, kecap', 100, true, false, 'NONE'),
  (s2, 1, 'a0000001-0000-0000-0000-000000000002', 1, 'nasi goreng siap makan', 0, false, false, 'OUTPUT_ERROR'),
  (s2, 1, 'a0000001-0000-0000-0000-000000000002', 2, 'panaskan minyak, masukkan nasi, tambah kecap, aduk', 100, true, true, 'NONE'),
  (s2, 2, 'a0000002-0000-0000-0000-000000000001', 1, 'Siti tidak punya bahan', 0, false, false, 'LOGIC_ERROR'),
  (s2, 2, 'a0000002-0000-0000-0000-000000000001', 2, 'Siti belum menentukan tujuan / apa yang mau dimasak', 100, true, true, 'NONE'),
  (s2, 3, 'a0000003-0000-0000-0000-000000000001', 1, 'Cek semua bahan / kondisi awal terlebih dahulu', 100, true, false, 'NONE'),
  (s2, 6, 'a0000006-0000-0000-0000-000000000001', 1, 'Masak semua sekaligus dalam satu wajan', 0, false, false, 'PROCESS_ERROR'),
  (s2, 6, 'a0000006-0000-0000-0000-000000000001', 2, 'Pecah jadi 3 sub-masalah: masak nasi goreng, masak mie goreng, buat teh manis', 100, true, true, 'NONE')
  ON CONFLICT DO NOTHING;

  INSERT INTO chapter_results (student_id, chapter_id, score, mastery_level, attempts, completed) VALUES
  (s2, 1, 100, 3, 3, true),
  (s2, 2, 100, 3, 2, true),
  (s2, 3, 100, 3, 1, true),
  (s2, 6, 100, 2, 2, true)
  ON CONFLICT (student_id, chapter_id) DO UPDATE SET
    score = EXCLUDED.score, mastery_level = EXCLUDED.mastery_level,
    attempts = EXCLUDED.attempts, completed = EXCLUDED.completed, updated_at = now();

  INSERT INTO student_progress (student_id, total_attempts, avg_score, overall_mastery, completed_chapters) VALUES
  (s2, 8, 75, 3, 4)
  ON CONFLICT (student_id) DO UPDATE SET
    total_attempts = 8, avg_score = 75, overall_mastery = 3, completed_chapters = 4, updated_at = now();

  -- ============ STUDENT 3 (Meylani) — low progress ============
  INSERT INTO attempts (student_id, chapter_id, exercise_id, attempt_number, answer, score, correct, hint_used, error_type) VALUES
  (s3, 1, 'a0000001-0000-0000-0000-000000000001', 1, 'Siti lapar', 0, false, false, 'INPUT_ERROR'),
  (s3, 1, 'a0000001-0000-0000-0000-000000000001', 2, 'nasi, minyak, kecap', 100, true, true, 'NONE'),
  (s3, 2, 'a0000002-0000-0000-0000-000000000001', 1, 'Siti tidak bisa masak', 0, false, false, 'LOGIC_ERROR'),
  (s3, 2, 'a0000002-0000-0000-0000-000000000001', 2, 'Dapur Siti terlalu panas', 0, false, true, 'LOGIC_ERROR')
  ON CONFLICT DO NOTHING;

  INSERT INTO chapter_results (student_id, chapter_id, score, mastery_level, attempts, completed) VALUES
  (s3, 1, 100, 2, 2, true),
  (s3, 2, 0, 1, 2, false)
  ON CONFLICT (student_id, chapter_id) DO UPDATE SET
    score = EXCLUDED.score, mastery_level = EXCLUDED.mastery_level,
    attempts = EXCLUDED.attempts, completed = EXCLUDED.completed, updated_at = now();

  INSERT INTO student_progress (student_id, total_attempts, avg_score, overall_mastery, completed_chapters) VALUES
  (s3, 4, 25, 1, 1)
  ON CONFLICT (student_id) DO UPDATE SET
    total_attempts = 4, avg_score = 25, overall_mastery = 1, completed_chapters = 1, updated_at = now();
END $$;