/*
# Seed Exercise Options and Hints (fix)

## Overview
Inserts multiple-choice options for each exercise and progressive hints (level 1-3).
Fixed: removed incorrect exercise_id reference for bab 8.
*/

DO $$
BEGIN
  -- ============ BAB 1 OPTIONS ============
  INSERT INTO exercise_options (exercise_id, label, is_correct, sort_order) VALUES
  ('a0000001-0000-0000-0000-000000000001', 'nasi, minyak, kecap', true, 1),
  ('a0000001-0000-0000-0000-000000000001', 'panaskan minyak, masukkan nasi, aduk', false, 2),
  ('a0000001-0000-0000-0000-000000000001', 'nasi goreng siap makan', false, 3),
  ('a0000001-0000-0000-0000-000000000001', 'Siti lapar', false, 4);

  INSERT INTO exercise_options (exercise_id, label, is_correct, sort_order) VALUES
  ('a0000001-0000-0000-0000-000000000002', 'nasi, minyak, kecap', false, 1),
  ('a0000001-0000-0000-0000-000000000002', 'panaskan minyak, masukkan nasi, tambah kecap, aduk', true, 2),
  ('a0000001-0000-0000-0000-000000000002', 'nasi goreng siap makan', false, 3),
  ('a0000001-0000-0000-0000-000000000002', 'Siti di dapur', false, 4);

  INSERT INTO exercise_options (exercise_id, label, is_correct, sort_order) VALUES
  ('a0000001-0000-0000-0000-000000000003', 'kopi, gula, air panas', false, 1),
  ('a0000001-0000-0000-0000-000000000003', 'seduh kopi, tambah gula, aduk', false, 2),
  ('a0000001-0000-0000-0000-000000000003', 'segelas kopi siap minum', true, 3),
  ('a0000001-0000-0000-0000-000000000003', 'Pak Teuku di dapur', false, 4);

  -- ============ BAB 2 OPTIONS ============
  INSERT INTO exercise_options (exercise_id, label, is_correct, sort_order) VALUES
  ('a0000002-0000-0000-0000-000000000001', 'Siti belum menentukan tujuan / apa yang mau dimasak', true, 1),
  ('a0000002-0000-0000-0000-000000000001', 'Siti tidak punya bahan', false, 2),
  ('a0000002-0000-0000-0000-000000000001', 'Dapur Siti terlalu panas', false, 3),
  ('a0000002-0000-0000-0000-000000000001', 'Siti tidak bisa masak', false, 4);

  INSERT INTO exercise_options (exercise_id, label, is_correct, sort_order) VALUES
  ('a0000002-0000-0000-0000-000000000002', 'Rebus air sampai mendidih', true, 1),
  ('a0000002-0000-0000-0000-000000000002', 'Langsung masukkan mie ke piring', false, 2),
  ('a0000002-0000-0000-0000-000000000002', 'Tambah kecap dulu', false, 3),
  ('a0000002-0000-0000-0000-000000000002', 'Sajikan mie mentah', false, 4);

  -- ============ BAB 3 OPTIONS ============
  INSERT INTO exercise_options (exercise_id, label, is_correct, sort_order) VALUES
  ('a0000003-0000-0000-0000-000000000001', 'Cek semua bahan / kondisi awal terlebih dahulu', true, 1),
  ('a0000003-0000-0000-0000-000000000001', 'Langsung masak tanpa cek', false, 2),
  ('a0000003-0000-0000-0000-000000000001', 'Tunggu sampai telur datang sendiri', false, 3),
  ('a0000003-0000-0000-0000-000000000001', 'Pakai telur yang habis', false, 4);

  INSERT INTO exercise_options (exercise_id, label, is_correct, sort_order) VALUES
  ('a0000003-0000-0000-0000-000000000002', 'Bawang', true, 1),
  ('a0000003-0000-0000-0000-000000000002', 'Mie', false, 2),
  ('a0000003-0000-0000-0000-000000000002', 'Minyak', false, 3),
  ('a0000003-0000-0000-0000-000000000002', 'Kecap', false, 4);

  INSERT INTO exercise_options (exercise_id, label, is_correct, sort_order) VALUES
  ('a0000003-0000-0000-0000-000000000003', 'Masak nasi goreng dengan ayam sebagai pengganti telur', true, 1),
  ('a0000003-0000-0000-0000-000000000003', 'Batal masak karena telur habis', false, 2),
  ('a0000003-0000-0000-0000-000000000003', 'Tetap pakai telur walau habis', false, 3),
  ('a0000003-0000-0000-0000-000000000003', 'Masak tanpa minyak', false, 4);

  -- ============ BAB 4 OPTIONS ============
  INSERT INTO exercise_options (exercise_id, label, is_correct, sort_order) VALUES
  ('a0000004-0000-0000-0000-000000000001', '5-2-3-4-1', true, 1),
  ('a0000004-0000-0000-0000-000000000001', '2-5-3-4-1', false, 2),
  ('a0000004-0000-0000-0000-000000000001', '5-3-2-4-1', false, 3),
  ('a0000004-0000-0000-0000-000000000001', '1-2-3-4-5', false, 4);

  INSERT INTO exercise_options (exercise_id, label, is_correct, sort_order) VALUES
  ('a0000004-0000-0000-0000-000000000002', 'CEK_NASI — jika nasi tidak ada, proses tidak bisa lanjut ke masak nasi goreng', true, 1),
  ('a0000004-0000-0000-0000-000000000002', 'MASAK — karena masak bisa pakai bahan lain', false, 2),
  ('a0000004-0000-0000-0000-000000000002', 'SAJIKAN — saji apa adanya', false, 3),
  ('a0000004-0000-0000-0000-000000000002', 'Tidak perlu dihentikan, lanjut saja', false, 4);

  -- ============ BAB 5 OPTIONS ============
  INSERT INTO exercise_options (exercise_id, label, is_correct, sort_order) VALUES
  ('a0000005-0000-0000-0000-000000000001', 'Input: nasi, telur, minyak, kecap. Output: nasi goreng telur siap saji.', true, 1),
  ('a0000005-0000-0000-0000-000000000001', 'Input: nasi goreng telur. Output: nasi, telur, minyak, kecap.', false, 2),
  ('a0000005-0000-0000-0000-000000000001', 'Input: kompor menyala. Output: nasi goreng.', false, 3),
  ('a0000005-0000-0000-0000-000000000001', 'Input: tujuan masak. Output: kondisi awal.', false, 4);

  INSERT INTO exercise_options (exercise_id, label, is_correct, sort_order) VALUES
  ('a0000005-0000-0000-0000-000000000002', 'Langkah tambah bumbu/kecap tidak ada, sehingga nasi goreng belum lengkap sebelum disajikan', true, 1),
  ('a0000005-0000-0000-0000-000000000002', 'Tidak ada yang salah, algoritma sudah benar', false, 2),
  ('a0000005-0000-0000-0000-000000000002', 'Sajikan sebelum masak selesai', false, 3),
  ('a0000005-0000-0000-0000-000000000002', 'Minyak terlalu panas', false, 4);

  -- ============ BAB 6 OPTIONS ============
  INSERT INTO exercise_options (exercise_id, label, is_correct, sort_order) VALUES
  ('a0000006-0000-0000-0000-000000000001', 'Pecah jadi 3 sub-masalah: masak nasi goreng, masak mie goreng, buat teh manis', true, 1),
  ('a0000006-0000-0000-0000-000000000001', 'Masak semua sekaligus dalam satu wajan', false, 2),
  ('a0000006-0000-0000-0000-000000000001', 'Tolak pesanan karena terlalu banyak', false, 3),
  ('a0000006-0000-0000-0000-000000000001', 'Masak teh dulu, baru nasi dan mie', false, 4);

  INSERT INTO exercise_options (exercise_id, label, is_correct, sort_order) VALUES
  ('a0000006-0000-0000-0000-000000000002', 'Memilih warna cat rumah', true, 1),
  ('a0000006-0000-0000-0000-000000000002', 'Membeli bahan', false, 2),
  ('a0000006-0000-0000-0000-000000000002', 'Memasak', false, 3),
  ('a0000006-0000-0000-0000-000000000002', 'Menyiapkan meja', false, 4);

  -- ============ BAB 7 OPTIONS ============
  INSERT INTO exercise_options (exercise_id, label, is_correct, sort_order) VALUES
  ('a0000007-0000-0000-0000-000000000001', 'Semua masakan goreng/tumis butuh minyak', true, 1),
  ('a0000007-0000-0000-0000-000000000001', 'Semua masakan butuh garam', false, 2),
  ('a0000007-0000-0000-0000-000000000001', 'Semua masakan butuh kecap', false, 3),
  ('a0000007-0000-0000-0000-000000000001', 'Tidak ada pola', false, 4);

  INSERT INTO exercise_options (exercise_id, label, is_correct, sort_order) VALUES
  ('a0000007-0000-0000-0000-000000000002', 'Minyak panas', true, 1),
  ('a0000007-0000-0000-0000-000000000002', 'Garam', false, 2),
  ('a0000007-0000-0000-0000-000000000002', 'Es batu', false, 3),
  ('a0000007-0000-0000-0000-000000000002', 'Susu', false, 4);

  -- ============ BAB 8 OPTIONS ============
  INSERT INTO exercise_options (exercise_id, label, is_correct, sort_order) VALUES
  ('a0000008-0000-0000-0000-000000000001', 'Warna piring / radio / jendela', true, 1),
  ('a0000008-0000-0000-0000-000000000001', 'Nasi', false, 2),
  ('a0000008-0000-0000-0000-000000000001', 'Minyak', false, 3),
  ('a0000008-0000-0000-0000-000000000001', 'Kecap', false, 4);

  INSERT INTO exercise_options (exercise_id, label, is_correct, sort_order) VALUES
  ('a0000008-0000-0000-0000-000000000002', 'Siapkan bahan → tumis bumbu → masukkan nasi → bumbui → sajikan', true, 1),
  ('a0000008-0000-0000-0000-000000000002', 'Ambil wajan, nyalakan komoro, tuang minyak, tunggu panas, masukkan bawang, tumis, masukkan nasi, aduk, tambah kecap, aduk lagi, cicipi, angkat, sajikan', false, 2),
  ('a0000008-0000-0000-0000-000000000002', 'Masak saja, nanti juga jadi', false, 3),
  ('a0000008-0000-0000-0000-000000000002', 'Nasi, minyak, kecap, bawang', false, 4);

  -- ============ BAB 9 OPTIONS ============
  INSERT INTO exercise_options (exercise_id, label, is_correct, sort_order) VALUES
  ('a0000009-0000-0000-0000-000000000001', 'Tidak, karena minyak tidak ada (kedua kondisi harus terpenuhi)', true, 1),
  ('a0000009-0000-0000-0000-000000000001', 'Ya, karena nasi ada', false, 2),
  ('a0000009-0000-0000-0000-000000000001', 'Ya, cukup salah satu ada', false, 3),
  ('a0000009-0000-0000-0000-000000000001', 'Tidak bisa ditentukan', false, 4);

  INSERT INTO exercise_options (exercise_id, label, is_correct, sort_order) VALUES
  ('a0000009-0000-0000-0000-000000000002', 'Ya, karena mie ada (salah satu kondisi sudah terpenuhi)', true, 1),
  ('a0000009-0000-0000-0000-000000000002', 'Tidak, karena nasi tidak ada', false, 2),
  ('a0000009-0000-0000-0000-000000000002', 'Tidak, karena harus ada keduanya', false, 3),
  ('a0000009-0000-0000-0000-000000000002', 'Tidak bisa ditentukan', false, 4);

  INSERT INTO exercise_options (exercise_id, label, is_correct, sort_order) VALUES
  ('a0000009-0000-0000-0000-000000000003', 'Gunakan telur (karena telur ada, kondisi NOT tidak terpenuhi)', true, 1),
  ('a0000009-0000-0000-0000-000000000003', 'Gunakan ayam (karena NOT ada)', false, 2),
  ('a0000009-0000-0000-0000-000000000003', 'Tidak masak', false, 3),
  ('a0000009-0000-0000-0000-000000000003', 'Gunakan keduanya', false, 4);

  -- ============ BAB 10 OPTIONS ============
  INSERT INTO exercise_options (exercise_id, label, is_correct, sort_order) VALUES
  ('a000000a-0000-0000-0000-000000000001', 'Pecah jadi 3 masakan; pola: semua butuh minyak panas, tapi hanya nasi & mie goreng yang butuh kecap', true, 1),
  ('a000000a-0000-0000-0000-000000000001', 'Tidak ada pola, semua masakan berbeda total', false, 2),
  ('a000000a-0000-0000-0000-000000000001', 'Masak semua sekaligus', false, 3),
  ('a000000a-0000-0000-0000-000000000001', 'Tidak butuh dekomposisi', false, 4);

  INSERT INTO exercise_options (exercise_id, label, is_correct, sort_order) VALUES
  ('a000000a-0000-0000-0000-000000000002', 'Masak nasi goreng (bahan utama ada), batalkan mie rebus (bahan utama habis)', true, 1),
  ('a000000a-0000-0000-0000-000000000002', 'Batalkan semua', false, 2),
  ('a000000a-0000-0000-0000-000000000002', 'Masak mie rebus tanpa mie', false, 3),
  ('a000000a-0000-0000-0000-000000000002', 'Masak keduanya tanpa bahan utama', false, 4);

  -- ============ BAB 11 OPTIONS ============
  INSERT INTO exercise_options (exercise_id, label, is_correct, sort_order) VALUES
  ('a000000b-0000-0000-0000-000000000001', 'IF telur habis THEN pakai ayam', true, 1),
  ('a000000b-0000-0000-0000-000000000001', 'IF telur ada THEN pakai ayam', false, 2),
  ('a000000b-0000-0000-0000-000000000001', 'IF telur habis THEN pakai telur', false, 3),
  ('a000000b-0000-0000-0000-000000000001', 'IF ayam ada THEN telur habis', false, 4);

  INSERT INTO exercise_options (exercise_id, label, is_correct, sort_order) VALUES
  ('a000000b-0000-0000-0000-000000000002', 'Pakai air dari tetangga (kondisi air habis terpenuhi)', true, 1),
  ('a000000b-0000-0000-0000-000000000002', 'Tidak masak', false, 2),
  ('a000000b-0000-0000-0000-000000000002', 'Pakai air sendiri walau habis', false, 3),
  ('a000000b-0000-0000-0000-000000000002', 'Ganti pesanan', false, 4);

  -- ============ BAB 12 OPTIONS ============
  INSERT INTO exercise_options (exercise_id, label, is_correct, sort_order) VALUES
  ('a000000c-0000-0000-0000-000000000001', 'IF kecap ada THEN pakai kecap ELSE pakai garam', true, 1),
  ('a000000c-0000-0000-0000-000000000001', 'IF kecap ada THEN pakai garam ELSE pakai kecap', false, 2),
  ('a000000c-0000-0000-0000-000000000001', 'IF kecap THEN pakai kecap AND garam', false, 3),
  ('a000000c-0000-0000-0000-000000000001', 'SWITCH kecap THEN garam', false, 4);

  INSERT INTO exercise_options (exercise_id, label, is_correct, sort_order) VALUES
  ('a000000c-0000-0000-0000-000000000002', 'Masak ayam goreng (kondisi segar tidak terpenuhi → ELSE)', true, 1),
  ('a000000c-0000-0000-0000-000000000002', 'Masak ayam bakar (tetap pakai IF)', false, 2),
  ('a000000c-0000-0000-0000-000000000002', 'Tidak masak ayam', false, 3),
  ('a000000c-0000-0000-0000-000000000002', 'Beli ayam baru dulu', false, 4);

  INSERT INTO exercise_options (exercise_id, label, is_correct, sort_order) VALUES
  ('a000000c-0000-0000-0000-000000000003', 'Tidak boleh ada ELSE kedua — IF-ELSE hanya punya dua cabang', true, 1),
  ('a000000c-0000-0000-0000-000000000003', 'Pseudocode sudah benar, ELSE boleh banyak', false, 2),
  ('a000000c-0000-0000-0000-000000000003', 'Salahnya di THEN, bukan di ELSE', false, 3),
  ('a000000c-0000-0000-0000-000000000003', 'Tidak ada yang salah', false, 4);

  -- ============ BAB 13 OPTIONS ============
  INSERT INTO exercise_options (exercise_id, label, is_correct, sort_order) VALUES
  ('a000000d-0000-0000-0000-000000000001', 'IF pedas THEN 5 ELSE IF sedang THEN 3 ELSE 1 → hasil: 3 cabai', true, 1),
  ('a000000d-0000-0000-0000-000000000001', 'IF pedas THEN 5 THEN 3 THEN 1', false, 2),
  ('a000000d-0000-0000-0000-000000000001', 'IF sedang THEN 5 ELSE IF pedas THEN 3', false, 3),
  ('a000000d-0000-0000-0000-000000000001', 'SWITCH pedas THEN sedang THEN tidak', false, 4);

  INSERT INTO exercise_options (exercise_id, label, is_correct, sort_order) VALUES
  ('a000000d-0000-0000-0000-000000000002', 'Sedikit pedas', true, 1),
  ('a000000d-0000-0000-0000-000000000002', 'Tidak pedas', false, 2),
  ('a000000d-0000-0000-0000-000000000002', 'Pedas', false, 3),
  ('a000000d-0000-0000-0000-000000000002', 'Sangat pedas', false, 4);

  -- ============ BAB 14 OPTIONS ============
  INSERT INTO exercise_options (exercise_id, label, is_correct, sort_order) VALUES
  ('a000000e-0000-0000-0000-000000000001', 'SWITCH(level): CASE 1: tidak pedas; CASE 2: sedikit pedas; CASE 3: pedas; CASE 4: sangat pedas; CASE 5: nagabe', true, 1),
  ('a000000e-0000-0000-0000-000000000001', 'IF level=1 OR level=2 OR level=3...', false, 2),
  ('a000000e-0000-0000-0000-000000000001', 'CASE level: 1=pedas, 2=pedas, 3=pedas', false, 3),
  ('a000000e-0000-0000-0000-000000000001', 'SWITCH: CASE 1: nagabe; CASE 5: tidak pedas', false, 4);

  INSERT INTO exercise_options (exercise_id, label, is_correct, sort_order) VALUES
  ('a000000e-0000-0000-0000-000000000002', 'Ayam bakar', true, 1),
  ('a000000e-0000-0000-0000-000000000002', 'Nasi goreng', false, 2),
  ('a000000e-0000-0000-0000-000000000002', 'Mie goreng', false, 3),
  ('a000000e-0000-0000-0000-000000000002', 'Capcay', false, 4);

  -- ============ BAB 15 OPTIONS ============
  INSERT INTO exercise_options (exercise_id, label, is_correct, sort_order) VALUES
  ('a000000f-0000-0000-0000-000000000001', 'Dekomposisi: pecah jadi 3 sub-masalah, lalu cek bahan untuk masing-masing', true, 1),
  ('a000000f-0000-0000-0000-000000000001', 'Langsung masak semua sekaligus', false, 2),
  ('a000000f-0000-0000-0000-000000000001', 'Tolak pesanan karena terlalu rumit', false, 3),
  ('a000000f-0000-0000-0000-000000000001', 'Masak yang paling mudah dulu, sisanya nanti', false, 4);

  INSERT INTO exercise_options (exercise_id, label, is_correct, sort_order) VALUES
  ('a000000f-0000-0000-0000-000000000002', 'Ayam bakar bisa tetap dibuat tapi tanpa sambal matah, atau cari bawang dari tetangga', true, 1),
  ('a000000f-0000-0000-0000-000000000002', 'Batalkan semua pesanan', false, 2),
  ('a000000f-0000-0000-0000-000000000002', 'Pakai bawang walau habis', false, 3),
  ('a000000f-0000-0000-0000-000000000002', 'Ganti sambal matah dengan kecap', false, 4);

  -- ============ HINTS ============
  -- Bab 1
  INSERT INTO hints (exercise_id, level, text) VALUES
  ('a0000001-0000-0000-0000-000000000001', 1, 'Input itu apa yang kita butuhkan SEBELUM proses dimulai. Coba lihat bahan-bahannya.'),
  ('a0000001-0000-0000-0000-000000000001', 2, 'Input adalah bahan yang sudah ada sebelum Siti mulai masak. Bukan hasil masak, bukan cara masak.'),
  ('a0000001-0000-0000-0000-000000000001', 3, 'Nasi, minyak, kecap — itu bahan yang sudah ada. Itulah input.'),
  ('a0000001-0000-0000-0000-000000000002', 1, 'Proses itu APA YANG DILAKUKAN pada input. Bukan bahan, bukan hasil.'),
  ('a0000001-0000-0000-0000-000000000002', 2, 'Proses adalah langkah-langkah: panaskan, masukkan, aduk. Itu aksi, bukan benda.'),
  ('a0000001-0000-0000-0000-000000000002', 3, 'Panaskan minyak, masukkan nasi, tambah kecap, aduk — itulah proses.'),
  ('a0000001-0000-0000-0000-000000000003', 1, 'Output itu hasil akhir dari proses. Apa yang dihasilkan?'),
  ('a0000001-0000-0000-0000-000000000003', 2, 'Output adalah produk jadi yang siap. Bukan bahan, bukan cara.'),
  ('a0000001-0000-0000-0000-000000000003', 3, 'Segelas kopi siap minum — itulah output. Hasil akhirnya.');

  -- Bab 2
  INSERT INTO hints (exercise_id, level, text) VALUES
  ('a0000002-0000-0000-0000-000000000001', 1, 'Coba baca lagi: Siti punya bahan tapi TIDAK TAHU mau masak apa. Apa masalahnya?'),
  ('a0000002-0000-0000-0000-000000000001', 2, 'Masalahnya bukan bahan, bukan alat. Masalahnya tujuan belum ditentukan.'),
  ('a0000002-0000-0000-0000-000000000001', 3, 'Siti belum menentukan tujuan — apa yang mau dimasak. Tanpa tujuan, langkah jadi bingung.'),
  ('a0000002-0000-0000-0000-000000000002', 1, 'Untuk mie rebus, bahan mentah perlu dimasak. Apa langkah pertama yang masuk akal?'),
  ('a0000002-0000-0000-0000-000000000002', 2, 'Mie rebus butuh air panas. Jadi langkah pertama adalah...'),
  ('a0000002-0000-0000-0000-000000000002', 3, 'Rebus air sampai mendidih dulu, baru masukkan mie. Jadi langkah pertama: rebus air.');

  -- Bab 3
  INSERT INTO hints (exercise_id, level, text) VALUES
  ('a0000003-0000-0000-0000-000000000001', 1, 'Sebelum mulai sesuatu, apa yang biasa kamu cek dulu?'),
  ('a0000003-0000-0000-0000-000000000001', 2, 'Siti masak tapi telur habis di tengah proses. Kalau dia cek dulu, ini tidak akan terjadi.'),
  ('a0000003-0000-0000-0000-000000000001', 3, 'Cek semua bahan / kondisi awal terlebih dahulu sebelum mulai masak.'),
  ('a0000003-0000-0000-0000-000000000002', 1, 'Coba lihat kondisi tiap bahan. Ada yang HABIS?'),
  ('a0000003-0000-0000-0000-000000000002', 2, 'Mie ADA, minyak ADA, kecap ADA, bawang... HABIS. Mana yang hilang?'),
  ('a0000003-0000-0000-0000-000000000002', 3, 'Bawang yang HABIS. Itulah yang perlu dicari.'),
  ('a0000003-0000-0000-0000-000000000003', 1, 'Telur habis tapi ayam ada. Apa yang bisa Siti lakukan?'),
  ('a0000003-0000-0000-0000-000000000003', 2, 'Tidak perlu batal. Ada pengganti: ayam. Jadi...'),
  ('a0000003-0000-0000-0000-000000000003', 3, 'Masak nasi goreng dengan ayam sebagai pengganti telur.');

  -- Bab 4
  INSERT INTO hints (exercise_id, level, text) VALUES
  ('a0000004-0000-0000-0000-000000000001', 1, 'Urutan masak punya logika. Apa yang harus dilakukan pertama?'),
  ('a0000004-0000-0000-0000-000000000001', 2, 'Ambil nasi dulu (5), lalu panaskan minyak (2), masukkan nasi (3), tambah kecap (4), sajikan (1).'),
  ('a0000004-0000-0000-0000-000000000001', 3, 'Urutan: 5-2-3-4-1. Ambil nasi, panaskan minyak, masak, bumbui, sajikan.'),
  ('a0000004-0000-0000-0000-000000000002', 1, 'Kalau bahan utama tidak ada, bisa lanjut masak bahan utama itu?'),
  ('a0000004-0000-0000-0000-000000000002', 2, 'CEK_NASI dulu. Kalau nasi tidak ada, masak nasi goreng tidak bisa lanjut.'),
  ('a0000004-0000-0000-0000-000000000002', 3, 'CEK_NASI — jika nasi tidak ada, proses tidak bisa lanjut ke masak nasi goreng.');

  -- Bab 5
  INSERT INTO hints (exercise_id, level, text) VALUES
  ('a0000005-0000-0000-0000-000000000001', 1, 'Input itu bahan, output itu hasil. Coba pisahkan.'),
  ('a0000005-0000-0000-0000-000000000001', 2, 'Input: nasi, telur, minyak, kecap (bahan). Output: nasi goreng telur siap saji (hasil).'),
  ('a0000005-0000-0000-0000-000000000001', 3, 'Kombinasi benar: Input: nasi, telur, minyak, kecap. Output: nasi goreng telur siap saji.'),
  ('a0000005-0000-0000-0000-000000000002', 1, 'Coba hitung langkahnya. Apa yang kurang antara masak dan sajikan?'),
  ('a0000005-0000-0000-0000-000000000002', 2, 'Siti langsung masuk nasi lalu sajikan. Tidak tambah bumbu/kecap. Apa kurang?'),
  ('a0000005-0000-0000-0000-000000000002', 3, 'Langkah tambah bumbu/kecap tidak ada. Nasi goreng belum lengkap sebelum disajikan.');

  -- Bab 6
  INSERT INTO hints (exercise_id, level, text) VALUES
  ('a0000006-0000-0000-0000-000000000001', 1, 'Kalau ada 3 pesanan, jangan masak sekaligus. Pecah jadi...'),
  ('a0000006-0000-0000-0000-000000000001', 2, 'Pecah jadi 3 sub-masalah: nasi goreng, mie goreng, teh manis.'),
  ('a0000006-0000-0000-0000-000000000001', 3, 'Pecah jadi 3 sub-masalah: masak nasi goreng, masak mie goreng, buat teh manis.'),
  ('a0000006-0000-0000-0000-000000000002', 1, 'Pesta makan malam butuh: beli bahan, masak, siapkan meja, sajikan. Mana yang tidak nyambung?'),
  ('a0000006-0000-0000-0000-000000000002', 2, 'Cat rumah tidak ada hubungannya dengan pesta makan malam.'),
  ('a0000006-0000-0000-0000-000000000002', 3, 'Memilih warna cat rumah — itu bukan sub-masalah dari pesta makan malam.');

  -- Bab 7
  INSERT INTO hints (exercise_id, level, text) VALUES
  ('a0000007-0000-0000-0000-000000000001', 1, 'Coba lihat semua masakan: nasi goreng, mie goreng, ayam goreng, tumis. Apa yang sama?'),
  ('a0000007-0000-0000-0000-000000000001', 2, 'Semuanya pakai minyak. Goreng/tumis butuh minyak.'),
  ('a0000007-0000-0000-0000-000000000001', 3, 'Semua masakan goreng/tumis butuh minyak. Itulah polanya.'),
  ('a0000007-0000-0000-0000-000000000002', 1, 'Tahu goreng juga gorengan. Apa yang gorengan butuh?'),
  ('a0000007-0000-0000-0000-000000000002', 2, 'Berdasarkan pola, semua gorengan butuh minyak panas.'),
  ('a0000007-0000-0000-0000-000000000002', 3, 'Minyak panas. Itu yang pasti dibutuhkan untuk tahu goreng.');

  -- Bab 8
  INSERT INTO hints (exercise_id, level, text) VALUES
  ('a0000008-0000-0000-0000-000000000001', 1, 'Fokus pada bahan masak. Mana yang tidak berhubungan dengan masak?'),
  ('a0000008-0000-0000-0000-000000000001', 2, 'Piring merah, radio, jendela — itu tidak penting untuk masak nasi goreng.'),
  ('a0000008-0000-0000-0000-000000000001', 3, 'Warna piring / radio / jendela — tidak perlu dipikirkan untuk masak.'),
  ('a0000008-0000-0000-0000-000000000002', 1, 'Inti dari masak nasi goreng: siapkan, tumis, masukkan nasi, bumbui, sajikan. Abstraksi singkat.'),
  ('a0000008-0000-0000-0000-000000000002', 2, 'Jangan tulis semua detail. Inti: siapkan bahan → tumis → masukkan nasi → bumbui → sajikan.'),
  ('a0000008-0000-0000-0000-000000000002', 3, 'Siapkan bahan → tumis bumbu → masukkan nasi → bumbui → sajikan. Itulah abstraksi inti.');

  -- Bab 9
  INSERT INTO hints (exercise_id, level, text) VALUES
  ('a0000009-0000-0000-0000-000000000001', 1, 'AND berarti KEDUA kondisi harus terpenuhi. Cek: nasi ada, minyak...?'),
  ('a0000009-0000-0000-0000-000000000001', 2, 'Nasi ada TAPI minyak TIDAK ada. AND butuh keduanya. Jadi...'),
  ('a0000009-0000-0000-0000-000000000001', 3, 'Tidak, karena minyak tidak ada. AND butuh kedua kondisi terpenuhi.'),
  ('a0000009-0000-0000-0000-000000000002', 1, 'OR berarti CUKUP SALAH SATU kondisi terpenuhi. Nasi tidak ada, mie...?'),
  ('a0000009-0000-0000-0000-000000000002', 2, 'Nasi tidak ada TAPI mie ADA. OR cukup salah satu. Jadi...'),
  ('a0000009-0000-0000-0000-000000000002', 3, 'Ya, karena mie ada. OR cukup salah satu kondisi terpenuhi.'),
  ('a0000009-0000-0000-0000-000000000003', 1, 'NOT berarti KEBALIKAN. Telur ada, lalu NOT telur ada = ?'),
  ('a0000009-0000-0000-0000-000000000003', 2, 'Kondisi: telur TIDAK ada → pakai ayam. Tapi telur ADA, jadi kondisi NOT tidak terpenuhi.'),
  ('a0000009-0000-0000-0000-000000000003', 3, 'Gunakan telur, karena telur ada (kondisi NOT tidak terpenuhi).');

  -- Bab 10
  INSERT INTO hints (exercise_id, level, text) VALUES
  ('a000000a-0000-0000-0000-000000000001', 1, 'Pecah jadi 3 masakan dulu. Lalu cari: apa yang sama antara mereka?'),
  ('a000000a-0000-0000-0000-000000000001', 2, 'Semua butuh minyak panas. Tapi kecap hanya untuk nasi & mie goreng, tidak untuk capcay.'),
  ('a000000a-0000-0000-0000-000000000001', 3, 'Pecah jadi 3; pola: semua butuh minyak panas, hanya nasi & mie goreng yang butuh kecap.'),
  ('a000000a-0000-0000-0000-000000000002', 1, 'Abstraksi: fokus bahan utama. Logika: kalau bahan utama habis, batalkan atau ganti.'),
  ('a000000a-0000-0000-0000-000000000002', 2, 'Nasi goreng: nasi ADA → masak. Mie rebus: mie HABIS → batalkan.'),
  ('a000000a-0000-0000-0000-000000000002', 3, 'Masak nasi goreng (bahan ada), batalkan mie rebus (bahan utama habis).');

  -- Bab 11
  INSERT INTO hints (exercise_id, level, text) VALUES
  ('a000000b-0000-0000-0000-000000000001', 1, 'IF itu "kalau". Kalau kondisi terpenuhi, lakukan sesuatu. Apa kondisinya?'),
  ('a000000b-0000-0000-0000-000000000001', 2, 'Kondisi: telur habis. Aksi: pakai ayam. Jadi: IF telur habis THEN pakai ayam.'),
  ('a000000b-0000-0000-0000-000000000001', 3, 'IF telur habis THEN pakai ayam. Hanya satu kondisi, satu aksi.'),
  ('a000000b-0000-0000-0000-000000000002', 1, 'Air habis. Kalau air habis, apa yang Pak Teuku lakukan?'),
  ('a000000b-0000-0000-0000-000000000002', 2, 'Kondisi air habis terpenuhi → pakai air dari tetangga.'),
  ('a000000b-0000-0000-0000-000000000002', 3, 'Pakai air dari tetangga, karena kondisi air habis terpenuhi.');

  -- Bab 12
  INSERT INTO hints (exercise_id, level, text) VALUES
  ('a000000c-0000-0000-0000-000000000001', 1, 'IF-ELSE itu dua kemungkinan. Kalau kondisi terpenuhi → A, kalau tidak → B.'),
  ('a000000c-0000-0000-0000-000000000001', 2, 'Kalau kecap ada → pakai kecap. Kalau tidak → pakai garam. IF-ELSE.'),
  ('a000000c-0000-0000-0000-000000000001', 3, 'IF kecap ada THEN pakai kecap ELSE pakai garam. Dua cabang.'),
  ('a000000c-0000-0000-0000-000000000002', 1, 'Ayam tidak segar. Jadi kondisi "segar" tidak terpenuhi. Cabang mana?'),
  ('a000000c-0000-0000-0000-000000000002', 2, 'IF segar THEN bakar ELSE goreng. Tidak segar → ELSE → goreng.'),
  ('a000000c-0000-0000-0000-000000000002', 3, 'Masak ayam goreng, karena kondisi segar tidak terpenuhi → ELSE.'),
  ('a000000c-0000-0000-0000-000000000003', 1, 'IF-ELSE itu hanya dua cabang: IF dan ELSE. Boleh ada ELSE kedua?'),
  ('a000000c-0000-0000-0000-000000000003', 2, 'Siti tulis dua ELSE. Itu salah. IF-ELSE hanya punya satu IF dan satu ELSE.'),
  ('a000000c-0000-0000-0000-000000000003', 3, 'Tidak boleh ada ELSE kedua — IF-ELSE hanya punya dua cabang.');

  -- Bab 13
  INSERT INTO hints (exercise_id, level, text) VALUES
  ('a000000d-0000-0000-0000-000000000001', 1, 'IF bertingkat: cek kondisi pertama, kalau tidak, cek kondisi kedua, dst.'),
  ('a000000d-0000-0000-0000-000000000001', 2, 'IF pedas THEN 5 ELSE IF sedang THEN 3 ELSE 1. Pelanggan minta sedang → 3 cabai.'),
  ('a000000d-0000-0000-0000-000000000001', 3, 'IF pedas THEN 5 ELSE IF sedang THEN 3 ELSE 1. Hasil untuk sedang: 3 cabai.'),
  ('a000000d-0000-0000-0000-000000000002', 1, 'Level 2 di struktur IF bertingkat. Apa hasilnya?'),
  ('a000000d-0000-0000-0000-000000000002', 2, 'Level 1 → tidak pedas. Level 2 → sedikit pedas. Level 3 → pedas.'),
  ('a000000d-0000-0000-0000-000000000002', 3, 'Sedikit pedas. Level 2 = sedikit pedas.');

  -- Bab 14
  INSERT INTO hints (exercise_id, level, text) VALUES
  ('a000000e-0000-0000-0000-000000000001', 1, 'SWITCH/CASE: setiap nilai punya CASE sendiri. Jadi 5 level = 5 CASE.'),
  ('a000000e-0000-0000-0000-000000000001', 2, 'SWITCH(level): CASE 1 sampai CASE 5, masing-masing dengan tindakan berbeda.'),
  ('a000000e-0000-0000-0000-000000000001', 3, 'SWITCH(level): CASE 1: tidak pedas; CASE 2: sedikit pedas; dst. sampai CASE 5: nagabe.'),
  ('a000000e-0000-0000-0000-000000000002', 1, 'Pelanggan pilih 3. Di SWITCH, CASE 3 adalah...'),
  ('a000000e-0000-0000-0000-000000000002', 2, 'CASE 1=nasi goreng, 2=mie goreng, 3=ayam bakar, 4=capcay. CASE 3 = ?'),
  ('a000000e-0000-0000-0000-000000000002', 3, 'Ayam bakar. CASE 3 = ayam bakar.');

  -- Bab 15
  INSERT INTO hints (exercise_id, level, text) VALUES
  ('a000000f-0000-0000-0000-000000000001', 1, 'Pesanan rumit. Jangan masak sekaligus. Apa langkah pertama?'),
  ('a000000f-0000-0000-0000-000000000001', 2, 'Pecah dulu jadi sub-masalah, lalu cek bahan masing-masing.'),
  ('a000000f-0000-0000-0000-000000000001', 3, 'Dekomposisi: pecah jadi 3 sub-masalah, lalu cek bahan untuk masing-masing.'),
  ('a000000f-0000-0000-0000-000000000002', 1, 'Bawang habis. Sambal matah butuh bawang. Apa solusinya?'),
  ('a000000f-0000-0000-0000-000000000002', 2, 'Ayam bakar tetap bisa dibuat. Sambal matah bisa tanpa bawang, atau cari bawang.'),
  ('a000000f-0000-0000-0000-000000000002', 3, 'Ayam bakar tetap dibuat tanpa sambal matah, atau cari bawang dari tetangga.');
END $$;