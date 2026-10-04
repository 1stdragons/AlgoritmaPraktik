/*
# Seed Exercises, Options, and Hints for Chapters 1-15

## Overview
Inserts exercises with options and hints for all 15 chapters. Each chapter gets 2-3 exercises
covering different learning levels. Equivalent groups link questions that test the same concept
with different scenarios.

## Data Structure
- exercises: question text, scenario, correct answer, concept, error type hint
- exercise_options: multiple choice options with correct flag
- hints: progressive hints (level 1 = gentle nudge, level 2 = more specific, level 3 = almost answer)
*/

-- Helper: we'll insert exercises and then use a DO block to insert options/hints with references

-- ============ BAB 1: INPUT_PROCESS_OUTPUT ============
INSERT INTO exercises (id, chapter_id, concept, skill_tag, learning_objective, learning_level, difficulty, scenario, question_type, question, correct_answer, equivalent_group, error_type_hint, sort_order)
VALUES
('a0000001-0000-0000-0000-000000000001', 1, 'INPUT_PROCESS_OUTPUT', 'identify_input', 'Siswa dapat mengidentifikasi input dari sebuah proses', 'SMP', 1,
 'Siti lapar. Dia mau masak nasi goreng. Bahan yang ada: nasi, minyak, kecap. Proses: panaskan minyak, masukkan nasi, tambah kecap, aduk. Hasil: nasi goreng siap makan.',
 'multiple_choice',
 'Dalam cerita di atas, mana yang merupakan INPUT?',
 'nasi, minyak, kecap',
 'IPO_BAHAN', 'INPUT_ERROR', 1),

('a0000001-0000-0000-0000-000000000002', 1, 'INPUT_PROCESS_OUTPUT', 'identify_process', 'Siswa dapat mengidentifikasi proses dari sebuah masalah', 'SMP', 1,
 'Siti lapar. Dia mau masak nasi goreng. Bahan: nasi, minyak, kecap. Proses: panaskan minyak, masukkan nasi, tambah kecap, aduk. Hasil: nasi goreng.',
 'multiple_choice',
 'Dalam cerita di atas, mana yang merupakan PROSES?',
 'panaskan minyak, masukkan nasi, tambah kecap, aduk',
 'IPO_PROSES', 'PROCESS_ERROR', 2),

('a0000001-0000-0000-0000-000000000003', 1, 'INPUT_PROCESS_OUTPUT', 'identify_output', 'Siswa dapat mengidentifikasi output dari sebuah proses', 'D3_S1', 2,
 'Pak Teuku mau membuat kopi. Bahan: kopi, gula, air panas. Cara: seduh kopi dengan air panas, tambah gula, aduk. Hasilnya segelas kopi siap minum.',
 'multiple_choice',
 'Dalam cerita Pak Teuku, mana yang merupakan OUTPUT?',
 'segelas kopi siap minum',
 'IPO_OUTPUT', 'OUTPUT_ERROR', 3)
ON CONFLICT (id) DO NOTHING;

-- ============ BAB 2: GOAL_OUTPUT ============
INSERT INTO exercises (id, chapter_id, concept, skill_tag, learning_objective, learning_level, difficulty, scenario, question_type, question, correct_answer, equivalent_group, error_type_hint, sort_order)
VALUES
('a0000002-0000-0000-0000-000000000001', 2, 'GOAL_OUTPUT', 'identify_goal', 'Siswa dapat menentukan tujuan dari sebuah masalah', 'SMP', 1,
 'Siti ada di dapur dengan nasi dan minyak. Dia bisa masak nasi goreng atau nasi uduk. Tapi dia tidak tahu mau masak apa. Akibatnya dia bingung dan tidak mulai masak.',
 'multiple_choice',
 'Apa masalah utama Siti dalam cerita di atas?',
 'Siti belum menentukan tujuan / apa yang mau dimasak',
 'GOAL_UNCLEAR', 'LOGIC_ERROR', 1),

('a0000002-0000-0000-0000-000000000002', 2, 'GOAL_OUTPUT', 'match_goal_steps', 'Siswa dapat mencocokkan tujuan dengan langkah yang tepat', 'SMA_SMK', 2,
 'Pak Teuku punya bahan: mie, air, kecap. Tujuannya: membuat mie rebus. Tapi dia ragu, harus mulai dari mana.',
 'multiple_choice',
 'Untuk mencapai tujuan "mie rebus", langkah pertama yang benar adalah:',
 'Rebus air sampai mendidih',
 'GOAL_STEPS', 'SEQUENCE_ERROR', 2)
ON CONFLICT (id) DO NOTHING;

-- ============ BAB 3: INITIAL_CONDITION ============
INSERT INTO exercises (id, chapter_id, concept, skill_tag, learning_objective, learning_level, difficulty, scenario, question_type, question, correct_answer, equivalent_group, error_type_hint, sort_order)
VALUES
('a0000003-0000-0000-0000-000000000001', 3, 'INITIAL_CONDITION', 'check_condition', 'Siswa dapat mengecek kondisi awal sebelum memulai proses', 'SMP', 1,
 'Siti mau masak nasi goreng. Dia buka kulkas: nasi ADA, telur HABIS, minyak ADA, kecap ADA. Tanpa cek, dia langsung masak dan baru sadar telur habis di tengah masak.',
 'multiple_choice',
 'Apa yang seharusnya Siti lakukan SEBELUM mulai masak?',
 'Cek semua bahan / kondisi awal terlebih dahulu',
 'INIT_CHECK', 'PROCESS_ERROR', 1),

('a0000003-0000-0000-0000-000000000002', 3, 'INITIAL_CONDITION', 'identify_missing', 'Siswa dapat mengidentifikasi bahan yang hilang dari kondisi awal', 'SMA_SMK', 2,
 'Pak Teuku cek dapur untuk masak mie goreng. Mie ADA, minyak ADA, kecap ADA, bawang HABIS. Dia butuh bawang untuk mie goreng yang enak.',
 'multiple_choice',
 'Berdasarkan kondisi awal, bahan apa yang HABIS dan perlu dicari?',
 'Bawang',
 'INIT_MISSING', 'INPUT_ERROR', 2),

('a0000003-0000-0000-0000-000000000003', 3, 'INITIAL_CONDITION', 'decide_based_on_condition', 'Siswa dapat mengambil keputusan berdasarkan kondisi awal', 'D3_S1', 2,
 'Siti cek dapur untuk masak nasi goreng: nasi ADA, telur HABIS, ayam ADA, minyak ADA. Dia punya ayam sebagai pengganti telur.',
 'multiple_choice',
 'Berdasarkan kondisi awal, keputusan terbaik Siti adalah:',
 'Masak nasi goreng dengan ayam sebagai pengganti telur',
 'INIT_DECIDE', 'LOGIC_ERROR', 3)
ON CONFLICT (id) DO NOTHING;

-- ============ BAB 4: ALGORITHM_PSEUDOCODE_FLOWCHART ============
INSERT INTO exercises (id, chapter_id, concept, skill_tag, learning_objective, learning_level, difficulty, scenario, question_type, question, correct_answer, equivalent_group, error_type_hint, sort_order)
VALUES
('a0000004-0000-0000-0000-000000000001', 4, 'ALGORITHM_PSEUDOCODE_FLOWCHART', 'order_steps', 'Siswa dapat menyusun langkah algoritma dengan urutan yang benar', 'SMP', 1,
 'Siti mau masak nasi goreng. Langkah-langkahnya: (1) Sajikan di piring, (2) Panaskan minyak, (3) Masukkan nasi dan aduk, (4) Tambah kecap dan bumbu, (5) Ambil nasi dari kulkas.',
 'multiple_choice',
 'Urutan langkah yang benar untuk masak nasi goreng adalah:',
 '5-2-3-4-1',
 'ALGO_ORDER', 'SEQUENCE_ERROR', 1),

('a0000004-0000-0000-0000-000000000002', 4, 'ALGORITHM_PSEUDOCODE_FLOWCHART', 'pseudocode_to_step', 'Siswa dapat mengubah pseudocode menjadi langkah nyata', 'D3_S1', 2,
 'Pseudocode: MULAI → CEK_NASI → CEK_MINYAK → MASAK → SAJIKAN → SELESAI',
 'multiple_choice',
 'Jika nasi tidak ada, langkah mana yang harus dihentikan atau diubah?',
 'CEK_NASI — jika nasi tidak ada, proses tidak bisa lanjut ke masak nasi goreng',
 'ALGO_PSEUDO', 'LOGIC_ERROR', 2)
ON CONFLICT (id) DO NOTHING;

-- ============ BAB 5: INTEGRATION_1_4 ============
INSERT INTO exercises (id, chapter_id, concept, skill_tag, learning_objective, learning_level, difficulty, scenario, question_type, question, correct_answer, equivalent_group, error_type_hint, sort_order)
VALUES
('a0000005-0000-0000-0000-000000000001', 5, 'INTEGRATION_1_4', 'full_analysis', 'Siswa dapat menganalisis input, output, tujuan, dan kondisi awal dari satu masalah', 'SMA_SMK', 3,
 'Masalah: Siti mau masak nasi goreng telur. Kondisi: nasi ada, telur ada, minyak ada, kecap ada, kompor menyala. Tujuan: nasi goreng telur siap saji.',
 'multiple_choice',
 'Dari masalah di atas, mana yang merupakan KOMBINASI BENAR dari input dan output?',
 'Input: nasi, telur, minyak, kecap. Output: nasi goreng telur siap saji.',
 'INTEG_ANALYSIS', 'LOGIC_ERROR', 1),

('a0000005-0000-0000-0000-000000000002', 5, 'INTEGRATION_1_4', 'identify_incomplete_algo', 'Siswa dapat mengidentifikasi algoritma yang tidak lengkap', 'D3_S1', 3,
 'Algoritma Siti: (1) Ambil nasi, (2) Panaskan minyak, (3) Masukkan nasi, (4) Sajikan. Tidak ada langkah tambah bumbu atau kecap.',
 'multiple_choice',
 'Apa yang salah dengan algoritma Siti di atas?',
 'Langkah tambah bumbu/kecap tidak ada, sehingga nasi goreng belum lengkap sebelum disajikan',
 'INTEG_INCOMPLETE', 'PROCESS_ERROR', 2)
ON CONFLICT (id) DO NOTHING;

-- ============ BAB 6: DECOMPOSITION ============
INSERT INTO exercises (id, chapter_id, concept, skill_tag, learning_objective, learning_level, difficulty, scenario, question_type, question, correct_answer, equivalent_group, error_type_hint, sort_order)
VALUES
('a0000006-0000-0000-0000-000000000001', 6, 'DECOMPOSITION', 'break_down', 'Siswa dapat memecah masalah besar menjadi bagian kecil', 'SMP', 1,
 'Warung Pak Teuku dapat pesanan: 1 nasi goreng, 1 mie goreng, 1 teh manis. Pak Teuku harus masak semua sendirian.',
 'multiple_choice',
 'Bagaimana cara terbaik memecah masalah Pak Teuku?',
 'Pecah jadi 3 sub-masalah: masak nasi goreng, masak mie goreng, buat teh manis',
 'DECOMP_BREAK', 'LOGIC_ERROR', 1),

('a0000006-0000-0000-0000-000000000002', 6, 'DECOMPOSITION', 'identify_subproblem', 'Siswa dapat mengidentifikasi sub-masalah dari masalah besar', 'SMA_SMK', 2,
 'Siti mau mengadakan pesta makan malam untuk 10 orang. Dia harus: beli bahan, masak, siapkan meja, sajikan.',
 'multiple_choice',
 'Mana yang BUKAN sub-masalah dari "mengadakan pesta makan malam"?',
 'Memilih warna cat rumah',
 'DECOMP_SUB', 'INPUT_ERROR', 2)
ON CONFLICT (id) DO NOTHING;

-- ============ BAB 7: PATTERN_RECOGNITION ============
INSERT INTO exercises (id, chapter_id, concept, skill_tag, learning_objective, learning_level, difficulty, scenario, question_type, question, correct_answer, equivalent_group, error_type_hint, sort_order)
VALUES
('a0000007-0000-0000-0000-000000000001', 7, 'PATTERN_RECOGNITION', 'find_pattern', 'Siswa dapat menemukan pola berulang dari beberapa kasus', 'SMP', 1,
 'Siti perhatikan: nasi goreng butuh minyak. Mie goreng butuh minyak. Ayam goreng butuh minyak. Tumis kangkung butuh minyak.',
 'multiple_choice',
 'Pola apa yang Siti temukan dari semua kasus di atas?',
 'Semua masakan goreng/tumis butuh minyak',
 'PATTERN_FIND', 'LOGIC_ERROR', 1),

('a0000007-0000-0000-0000-000000000002', 7, 'PATTERN_RECOGNITION', 'apply_pattern', 'Siswa dapat menerapkan pola pada kasus baru', 'SMA_SMK', 2,
 'Pola: setiap masakan gorengan butuh minyak panas. Siti mau masak tahu goreng.',
 'multiple_choice',
 'Berdasarkan pola, apa yang pasti Siti butuhkan untuk tahu goreng?',
 'Minyak panas',
 'PATTERN_APPLY', 'CONDITION_ERROR', 2)
ON CONFLICT (id) DO NOTHING;

-- ============ BAB 8: ABSTRACTION ============
INSERT INTO exercises (id, chapter_id, concept, skill_tag, learning_objective, learning_level, difficulty, scenario, question_type, question, correct_answer, equivalent_group, error_type_hint, sort_order)
VALUES
('a0000008-0000-0000-0000-000000000001', 8, 'ABSTRACTION', 'identify_relevant', 'Siswa dapat memisahkan detail penting dari yang tidak penting', 'SMP', 1,
 'Siti mau masak nasi goreng. Di dapur ada: nasi, minyak, kecap, kompor, piring merah, radio, kulkas, jendela, bawang.',
 'multiple_choice',
 'Mana yang TIDAK PERLU dipikirkan untuk masak nasi goreng?',
 'Warna piring / radio / jendela',
 'ABSTRACT_RELEVANT', 'INPUT_ERROR', 1),

('a0000008-0000-0000-0000-000000000002', 8, 'ABSTRACTION', 'abstract_essential', 'Siswa dapat mengabstraksi inti dari sebuah proses', 'D3_S1', 2,
 'Proses masak nasi goreng: ambil wajan, nyalakan kompor, tuang minyak, tunggu panas, masukkan bawang, tumis, masukkan nasi, aduk, tambah kecap, aduk lagi, cicipi, angkat, sajikan.',
 'multiple_choice',
 'Abstraksi inti dari proses di atas adalah:',
 'Siapkan bahan → tumis bumbu → masukkan nasi → bumbui → sajikan',
 'ABSTRACT_ESSENCE', 'PROCESS_ERROR', 2)
ON CONFLICT (id) DO NOTHING;

-- ============ BAB 9: AND_OR_NOT ============
INSERT INTO exercises (id, chapter_id, concept, skill_tag, learning_objective, learning_level, difficulty, scenario, question_type, question, correct_answer, equivalent_group, error_type_hint, sort_order)
VALUES
('a0000009-0000-0000-0000-000000000001', 9, 'AND_OR_NOT', 'and_logic', 'Siswa dapat menerapkan logika AND', 'SMP', 1,
 'Siti bisa masak nasi goreng HANYA JIKA nasi ada DAN minyak ada. Kondisi: nasi ada, minyak tidak ada.',
 'multiple_choice',
 'Berdasarkan logika AND, apakah Siti bisa masak nasi goreng?',
 'Tidak, karena minyak tidak ada (kedua kondisi harus terpenuhi)',
 'AND_LOGIC', 'CONDITION_ERROR', 1),

('a0000009-0000-0000-0000-000000000002', 9, 'AND_OR_NOT', 'or_logic', 'Siswa dapat menerapkan logika OR', 'SMP', 1,
 'Siti bisa masak nasi goreng atau mie goreng (cukup salah satu). Kondisi: nasi tidak ada, mie ada.',
 'multiple_choice',
 'Berdasarkan logika OR, apakah Siti bisa masak salah satu?',
 'Ya, karena mie ada (salah satu kondisi sudah terpenuhi)',
 'OR_LOGIC', 'CONDITION_ERROR', 2),

('a0000009-0000-0000-0000-000000000003', 9, 'AND_OR_NOT', 'not_logic', 'Siswa dapat menerapkan logika NOT', 'SMA_SMK', 2,
 'Siti akan masak. Aturan: jika telur TIDAK ada, gunakan ayam. Kondisi: telur ada.',
 'multiple_choice',
 'Berdasarkan logika NOT, apa yang Siti lakukan?',
 'Gunakan telur (karena telur ada, kondisi NOT tidak terpenuhi)',
 'NOT_LOGIC', 'CONDITION_ERROR', 3)
ON CONFLICT (id) DO NOTHING;

-- ============ BAB 10: CT_INTEGRATED ============
INSERT INTO exercises (id, chapter_id, concept, skill_tag, learning_objective, learning_level, difficulty, scenario, question_type, question, correct_answer, equivalent_group, error_type_hint, sort_order)
VALUES
('a000000a-0000-0000-0000-000000000001', 10, 'CT_INTEGRATED', 'ct_decompose_pattern', 'Siswa dapat menggabungkan dekomposisi dan pattern recognition', 'SMA_SMK', 3,
 'Pesanan warung: nasi goreng, mie goreng, dan capcay. Siti pecah jadi 3 masakan. Dia perhatikan: nasi goreng dan mie goreng sama-sama butuh minyak panas dan kecap. Capcay butuh minyak panas tapi tidak kecap.',
 'multiple_choice',
 'Apa hasil gabungan dekomposisi dan pattern recognition dari masalah di atas?',
 'Pecah jadi 3 masakan; pola: semua butuh minyak panas, tapi hanya nasi & mie goreng yang butuh kecap',
 'CT_DP', 'LOGIC_ERROR', 1),

('a000000a-0000-0000-0000-000000000002', 10, 'CT_INTEGRATED', 'ct_abstract_logic', 'Siswa dapat menggabungkan abstraksi dan logika', 'D3_S1', 4,
 'Siti masak untuk pelanggan. Abstraksi: fokus pada bahan utama saja. Logika: kalau bahan utama tidak ada, ganti atau batalkan. Pesanan: nasi goreng (bahan utama: nasi), mie rebus (bahan utama: mie). Kondisi: nasi ada, mie HABIS.',
 'multiple_choice',
 'Keputusan terbaik berdasarkan abstraksi + logika:',
 'Masak nasi goreng (bahan utama ada), batalkan mie rebus (bahan utama habis)',
 'CT_AL', 'LOGIC_ERROR', 2)
ON CONFLICT (id) DO NOTHING;

-- ============ BAB 11: IF_CONDITION ============
INSERT INTO exercises (id, chapter_id, concept, skill_tag, learning_objective, learning_level, difficulty, scenario, question_type, question, correct_answer, equivalent_group, error_type_hint, sort_order)
VALUES
('a000000b-0000-0000-0000-000000000001', 11, 'IF_CONDITION', 'single_if', 'Siswa dapat menerapkan struktur IF tunggal', 'SMP', 1,
 'Siti masak nasi goreng. Dia cek telur. Kalau telur HABIS, dia pakai ayam. Kalau telur ADA, dia tetap pakai telur.',
 'multiple_choice',
 'Struktur IF yang benar untuk kasus di atas:',
 'IF telur habis THEN pakai ayam',
 'IF_SINGLE', 'CONDITION_ERROR', 1),

('a000000b-0000-0000-0000-000000000002', 11, 'IF_CONDITION', 'if_apply', 'Siswa dapat menerapkan IF pada kasus baru', 'SMA_SMK', 2,
 'Pak Teuku masak mie. Kalau air HABIS, dia pakai air dari tetangga. Kondisi: air habis.',
 'multiple_choice',
 'Berdasarkan struktur IF, apa yang Pak Teuku lakukan?',
 'Pakai air dari tetangga (kondisi air habis terpenuhi)',
 'IF_APPLY', 'CONDITION_ERROR', 2)
ON CONFLICT (id) DO NOTHING;

-- ============ BAB 12: IF_ELSE ============
INSERT INTO exercises (id, chapter_id, concept, skill_tag, learning_objective, learning_level, difficulty, scenario, question_type, question, correct_answer, equivalent_group, error_type_hint, sort_order)
VALUES
('a000000c-0000-0000-0000-000000000001', 12, 'IF_ELSE', 'if_else_structure', 'Siswa dapat menerapkan struktur IF-ELSE', 'SMP', 1,
 'Siti masak. Kalau kecap ADA, pakai kecap. Kalau TIDAK ADA, pakai garam sebagai pengganti.',
 'multiple_choice',
 'Struktur IF-ELSE yang benar untuk kasus di atas:',
 'IF kecap ada THEN pakai kecap ELSE pakai garam',
 'IF_ELSE_STR', 'CONDITION_ERROR', 1),

('a000000c-0000-0000-0000-000000000002', 12, 'IF_ELSE', 'if_else_apply', 'Siswa dapat menerapkan IF-ELSE pada kasus baru', 'SMA_SMK', 2,
 'Pak Teuku masak ayam. Kalau ayam SEGAR, masak bakar. Kalau TIDAK, masak goreng. Kondisi: ayam tidak segar.',
 'multiple_choice',
 'Berdasarkan IF-ELSE, apa yang Pak Teuku lakukan?',
 'Masak ayam goreng (kondisi segar tidak terpenuhi → ELSE)',
 'IF_ELSE_APP', 'CONDITION_ERROR', 2),

('a000000c-0000-0000-0000-000000000003', 12, 'IF_ELSE', 'if_else_misuse', 'Siswa dapat mengidentifikasi kesalahan dalam struktur IF-ELSE', 'D3_S1', 3,
 'Siti tulis: IF kecap ada THEN pakai kecap ELSE pakai garam ELSE pakai gula. Tapi kondisi IF-ELSE hanya boleh punya dua kemungkinan.',
 'multiple_choice',
 'Apa salah dari pseudocode Siti di atas?',
 'Tidak boleh ada ELSE kedua — IF-ELSE hanya punya dua cabang',
 'IF_ELSE_ERR', 'LOGIC_ERROR', 3)
ON CONFLICT (id) DO NOTHING;

-- ============ BAB 13: NESTED_IF ============
INSERT INTO exercises (id, chapter_id, concept, skill_tag, learning_objective, learning_level, difficulty, scenario, question_type, question, correct_answer, equivalent_group, error_type_hint, sort_order)
VALUES
('a000000d-0000-0000-0000-000000000001', 13, 'NESTED_IF', 'nested_structure', 'Siswa dapat menyusun IF bertingkat', 'SMP', 2,
 'Siti masak sambal. Kalau minta PEDAS → 5 cabai. Kalau SEDANG → 3 cabai. Kalau TIDAK PEDAS → 1 cabai. Pelanggan minta sedang.',
 'multiple_choice',
 'Struktur IF bertingkat yang benar dan hasilnya untuk pelanggan ini:',
 'IF pedas THEN 5 ELSE IF sedang THEN 3 ELSE 1 → hasil: 3 cabai',
 'NESTED_STR', 'CONDITION_ERROR', 1),

('a000000d-0000-0000-0000-000000000002', 13, 'NESTED_IF', 'nested_apply', 'Siswa dapat menerapkan IF bertingkat pada kasus baru', 'SMA_SMK', 3,
 'Warung level kepedasan: kalau level 1 → tidak pedas, level 2 → sedikit pedas, level 3 → pedas. Pelanggan pesan level 2.',
 'multiple_choice',
 'Berdasarkan IF bertingkat, apa hasil untuk pelanggan level 2?',
 'Sedikit pedas',
 'NESTED_APP', 'CONDITION_ERROR', 2)
ON CONFLICT (id) DO NOTHING;

-- ============ BAB 14: SWITCH_CASE ============
INSERT INTO exercises (id, chapter_id, concept, skill_tag, learning_objective, learning_level, difficulty, scenario, question_type, question, correct_answer, equivalent_group, error_type_hint, sort_order)
VALUES
('a000000e-0000-0000-0000-000000000001', 14, 'SWITCH_CASE', 'switch_structure', 'Siswa dapat menyusun struktur SWITCH/CASE', 'SMP', 2,
 'Pelanggan pilih level kepedasan 1-5. Level 1: tidak pedas. Level 2: sedikit pedas. Level 3: pedas. Level 4: sangat pedas. Level 5: nagabe.',
 'multiple_choice',
 'Struktur SWITCH/CASE yang benar untuk kasus di atas:',
 'SWITCH(level): CASE 1: tidak pedas; CASE 2: sedikit pedas; CASE 3: pedas; CASE 4: sangat pedas; CASE 5: nagabe',
 'SWITCH_STR', 'LOGIC_ERROR', 1),

('a000000e-0000-0000-0000-000000000002', 14, 'SWITCH_CASE', 'switch_apply', 'Siswa dapat menerapkan SWITCH/CASE pada kasus baru', 'SMA_SMK', 2,
 'Menu pilihan: 1=nasi goreng, 2=mie goreng, 3=ayam bakar, 4=capcay. Pelanggan pilih 3.',
 'multiple_choice',
 'Berdasarkan SWITCH/CASE, apa yang pelanggan dapat?',
 'Ayam bakar',
 'SWITCH_APP', 'CONDITION_ERROR', 2)
ON CONFLICT (id) DO NOTHING;

-- ============ BAB 15: FULL_INTEGRATION ============
INSERT INTO exercises (id, chapter_id, concept, skill_tag, learning_objective, learning_level, difficulty, scenario, question_type, question, correct_answer, equivalent_group, error_type_hint, sort_order)
VALUES
('a000000f-0000-0000-0000-000000000001', 15, 'FULL_INTEGRATION', 'full_problem', 'Siswa dapat menyelesaikan masalah kompleks dengan semua konsep', 'D3_S1', 4,
 'Pesanan: nasi goreng pedas level 3, mie goreng tanpa telur, ayam bakar dengan sambal matah. Kondisi dapur: nasi ada, mie ada, ayam ada, telur ada, cabai ada, bawang habis. Siti harus dekomposisi, cari pola, abstraksi, dan ambil keputusan.',
 'multiple_choice',
 'Berdasarkan masalah di atas, apa langkah pertama terbaik untuk Siti?',
 'Dekomposisi: pecah jadi 3 sub-masalah, lalu cek bahan untuk masing-masing',
 'FULL_PROB', 'LOGIC_ERROR', 1),

('a000000f-0000-0000-0000-000000000002', 15, 'FULL_INTEGRATION', 'full_decision', 'Siswa dapat mengambil keputusan terintegrasi', 'SMA_SMK', 4,
 'Dari pesanan di atas: nasi goreng pedas level 3 butuh cabai. Mie goreng tanpa telur (telur tidak dipakai). Ayam bakar butuh bawang untuk sambal matah. Bawang HABIS.',
 'multiple_choice',
 'Keputusan terbaik untuk masalah bawang habis:',
 'Ayam bakar bisa tetap dibuat tapi tanpa sambal matah, atau cari bawang dari tetangga',
 'FULL_DEC', 'LOGIC_ERROR', 2)
ON CONFLICT (id) DO NOTHING;