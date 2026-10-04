/*
# Seed Demo Accounts: Lecturer + Sample Students

## Overview
Creates demo accounts using Supabase auth (signUp creates auth.users entry, trigger auto-creates
profile). We use execute_sql to directly insert into auth.users with hashed passwords because
the Supabase admin can create users with known credentials.

## Demo Accounts
1. Lecturer: NIM D001, password D001
2. Student 1: NIM 2024001, password 2024001
3. Student 2: NIM 2024002, password 2024002
4. Student 3: NIM 2024003, password 2024003

## Note
Passwords are hashed using crypt() with pgcrypto extension. Email format: <NIM>@tapaktuan.edu
*/

CREATE EXTENSION IF NOT EXISTS pgcrypto;

-- Helper function to create auth user
DO $$
DECLARE
  lect_id uuid;
  s1_id uuid;
  s2_id uuid;
  s3_id uuid;
BEGIN
  -- Create lecturer
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'D001@tapaktuan.edu') THEN
    lect_id := gen_random_uuid();
    INSERT INTO auth.users (
      id, instance_id, aud, role, email, encrypted_password, email_confirmed_at,
      raw_app_meta_data, raw_user_meta_data, created_at, updated_at, confirmation_token
    ) VALUES (
      lect_id, '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated',
      'D001@tapaktuan.edu', crypt('D001', gen_salt('bf')), now(),
      jsonb_build_object('role', 'lecturer'),
      jsonb_build_object('role', 'lecturer', 'full_name', 'Pak Teuku Dosen', 'nim', 'D001'),
      now(), now(), ''
    );
    -- Profile is auto-created by trigger, but let's ensure it's correct
    INSERT INTO profiles (id, role, full_name, nim, semester, program_studi, jurusan, learning_level, password_changed)
    VALUES (lect_id, 'lecturer', 'Pak Teuku Dosen', 'D001', NULL, 'Dosen', 'Teknik Informatika', 'D3_S1', true)
    ON CONFLICT (id) DO UPDATE SET
      role = 'lecturer', full_name = 'Pak Teuku Dosen', nim = 'D001',
      program_studi = 'Dosen', jurusan = 'Teknik Informatika', password_changed = true;
  END IF;

  -- Create student 1
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = '2024001@tapaktuan.edu') THEN
    s1_id := gen_random_uuid();
    INSERT INTO auth.users (
      id, instance_id, aud, role, email, encrypted_password, email_confirmed_at,
      raw_app_meta_data, raw_user_meta_data, created_at, updated_at, confirmation_token
    ) VALUES (
      s1_id, '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated',
      '2024001@tapaktuan.edu', crypt('2024001', gen_salt('bf')), now(),
      jsonb_build_object('role', 'student'),
      jsonb_build_object('role', 'student', 'full_name', 'Siti Nurhaliza', 'nim', '2024001',
        'semester', '3', 'program_studi', 'D3 Teknik Informatika', 'jurusan', 'Teknik Elektro',
        'learning_level', 'D3_S1'),
      now(), now(), ''
    );
    INSERT INTO profiles (id, role, full_name, nim, semester, program_studi, jurusan, learning_level, password_changed)
    VALUES (s1_id, 'student', 'Siti Nurhaliza', '2024001', 3, 'D3 Teknik Informatika', 'Teknik Elektro', 'D3_S1', false)
    ON CONFLICT (id) DO UPDATE SET
      full_name = 'Siti Nurhaliza', nim = '2024001', semester = 3,
      program_studi = 'D3 Teknik Informatika', jurusan = 'Teknik Elektro',
      learning_level = 'D3_S1', password_changed = false;
  END IF;

  -- Create student 2
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = '2024002@tapaktuan.edu') THEN
    s2_id := gen_random_uuid();
    INSERT INTO auth.users (
      id, instance_id, aud, role, email, encrypted_password, email_confirmed_at,
      raw_app_meta_data, raw_user_meta_data, created_at, updated_at, confirmation_token
    ) VALUES (
      s2_id, '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated',
      '2024002@tapaktuan.edu', crypt('2024002', gen_salt('bf')), now(),
      jsonb_build_object('role', 'student'),
      jsonb_build_object('role', 'student', 'full_name', 'Teuku Ibrahim', 'nim', '2024002',
        'semester', '3', 'program_studi', 'D3 Teknik Informatika', 'jurusan', 'Teknik Mesin',
        'learning_level', 'SMA_SMK'),
      now(), now(), ''
    );
    INSERT INTO profiles (id, role, full_name, nim, semester, program_studi, jurusan, learning_level, password_changed)
    VALUES (s2_id, 'student', 'Teuku Ibrahim', '2024002', 3, 'D3 Teknik Informatika', 'Teknik Mesin', 'SMA_SMK', false)
    ON CONFLICT (id) DO UPDATE SET
      full_name = 'Teuku Ibrahim', nim = '2024002', semester = 3,
      program_studi = 'D3 Teknik Informatika', jurusan = 'Teknik Mesin',
      learning_level = 'SMA_SMK', password_changed = false;
  END IF;

  -- Create student 3
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = '2024003@tapaktuan.edu') THEN
    s3_id := gen_random_uuid();
    INSERT INTO auth.users (
      id, instance_id, aud, role, email, encrypted_password, email_confirmed_at,
      raw_app_meta_data, raw_user_meta_data, created_at, updated_at, confirmation_token
    ) VALUES (
      s3_id, '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated',
      '2024003@tapaktuan.edu', crypt('2024003', gen_salt('bf')), now(),
      jsonb_build_object('role', 'student'),
      jsonb_build_object('role', 'student', 'full_name', 'Cut Meylani', 'nim', '2024003',
        'semester', '1', 'program_studi', 'D3 Teknik Informatika', 'jurusan', 'Teknik Sipil',
        'learning_level', 'SMP'),
      now(), now(), ''
    );
    INSERT INTO profiles (id, role, full_name, nim, semester, program_studi, jurusan, learning_level, password_changed)
    VALUES (s3_id, 'student', 'Cut Meylani', '2024003', 1, 'D3 Teknik Informatika', 'Teknik Sipil', 'SMP', false)
    ON CONFLICT (id) DO UPDATE SET
      full_name = 'Cut Meylani', nim = '2024003', semester = 1,
      program_studi = 'D3 Teknik Informatika', jurusan = 'Teknik Sipil',
      learning_level = 'SMP', password_changed = false;
  END IF;
END $$;