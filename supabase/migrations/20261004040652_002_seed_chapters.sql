/*
# Seed Chapters 1-15 with Stories and Lab Info

## Overview
Inserts all 15 chapters with their titles, stories, lab names, lab types, concepts, and
learning focus. This provides the structural backbone of the curriculum.

## New Data
- 15 chapter rows in the chapters table
- Each chapter has a contextual story, lab name, lab type, concept, and focus
*/

INSERT INTO chapters (id, title, subtitle, story, lab_name, lab_type, concept, learning_focus, sort_order) VALUES
(1, 'Masalah, Algoritma & Input-Output',
 'Setiap masalah punya masuk, proses, dan keluar.',
 'Pagi hari di Tapaktuan. Perut keroncongan. "Saya lapar," pikir Siti. Untuk tidak lapar lagi, dia harus makan. Tapi makan tidak datang dari langit — ada bahan, ada cara, ada hasil. Itulah masalah: dari keadaan awal (lapar) ke keadaan akhir (kenyang). Setiap masalah punya input (apa yang ada), proses (apa yang dilakukan), dan output (apa yang dihasilkan).',
 'Saya Lapar Simulator', 'simulation', 'INPUT_PROCESS_OUTPUT', 'Memahami input, process, dan output dari masalah sehari-hari', 1),

(2, 'Tujuan & Output',
 'Sebelum masak, harus tahu mau masak apa.',
 'Siti mau masak. Tapi masak apa? Kalau tidak tahu mau masak apa, bahan yang diambil bisa salah. Tujuan menentukan langkah. Kalau tujuannya nasi goreng, ambil nasi. Kalau tujuannya mie rebus, ambil mie. Tanpa tujuan yang jelas, algoritma jadi kacau.',
 'Kenapa Masak? Simulator', 'simulation', 'GOAL_OUTPUT', 'Memahami pentingnya tujuan/output sebelum menyusun langkah', 2),

(3, 'Inisialisasi & Kondisi Awal',
 'Sebelum mulai, cek dulu apa yang ada.',
 'Siti buka kulkas. Dia melihat: nasi ada, telur ada, bawang ada, minyak ada. Tapi kalau telur habis? Kalau minyak tinggal sedikit? Kondisi awal menentukan apa yang bisa dilakukan. Sebelum memulai sesuatu, kita harus tahu kondisi awalnya.',
 'Buka Kulkas Lab', 'simulation', 'INITIAL_CONDITION', 'Memahami pentingnya mengecek kondisi awal sebelum memulai proses', 3),

(4, 'Algoritma, Pseudocode & Flowchart',
 'Tulis cara kamu berpikir, supaya orang lain bisa ikuti.',
 'Siti tahu mau masak nasi goreng. Dia tahu bahannya. Tapi kalau dia hanya "tahu" di kepala, temannya tidak bisa membantu. Siti harus menulis langkah-langkahnya: pertama apa, kedua apa, ketiga apa. Itulah algoritma — langkah yang jelas dan berurutan. Dari algoritma, bisa dibuat pseudocode dan flowchart.',
 'Tulis Cara Saya Lab', 'algorithm_builder', 'ALGORITHM_PSEUDOCODE_FLOWCHART', 'Menyusun algoritma, pseudocode, dan flowchart dari masalah nyata', 4),

(5, 'Integrasi: Masalah → Algoritma',
 'Gabungkan semuanya: input, output, kondisi, algoritma.',
 'Siti sudah belajar tentang input-output, tujuan, kondisi awal, dan algoritma. Sekarang saatnya menggabungkan. Dari satu masalah "masak nasi goreng", dia harus bisa menjelaskan: inputnya apa, tujuannya apa, kondisi awalnya, dan algoritmanya. Mini challenge untuk menguji pemahaman.',
 'Mini Challenge', 'algorithm_builder', 'INTEGRATION_1_4', 'Mengintegrasikan input, output, kondisi awal, dan algoritma dalam satu masalah', 5),

(6, 'Dekomposisi',
 'Masalah besar lebih mudah dipecah jadi bagian kecil.',
 'Warung Pak Teuku punya pesanan: nasi goreng, mie goreng, dan ayam bakar. Kalau Pak Teuku mikir "masak semua sekaligus", dia bisa kebablasen. Tapi kalau dia pecah jadi: (1) masak nasi goreng, (2) masak mie goreng, (3) masak ayam bakar — jadi lebih terkelola. Itulah dekomposisi: memecah masalah besar jadi bagian-bagian kecil.',
 'Pecah Pesanan', 'simulation', 'DECOMPOSITION', 'Memecah masalah besar menjadi sub-masalah yang lebih kecil', 6),

(7, 'Pattern Recognition',
 'Cari apa yang sama dari beberapa kasus.',
 'Siti perhatikan: nasi goreng pakai minyak, mie goreng pakai minyak. Nasi goreng pakai kecap, mie goreng pakai kecap. Nasi goreng butuh pengaduk, mie goreng butuh pengaduk. Pola! Setiap masak goreng-gorengan selalu butuh minyak, kecap, dan pengaduk. Itulah pattern recognition: menemukan pola berulang.',
 'Mana yang Sama?', 'simulation', 'PATTERN_RECOGNITION', 'Mengenali pola berulang dari beberapa kasus', 7),

(8, 'Abstraksi',
 'Fokus yang penting, abaikan yang tidak perlu.',
 'Siti mau masak nasi goreng. Apa yang penting? Nasi, minyak, bumbu. Apa yang tidak penting? Warna piring, musik di dapur, cuaca di luar. Abstraksi adalah fokus pada detail penting dan abaikan yang tidak. Tidak semua detail perlu dipikirkan.',
 'Bumbu Aja', 'simulation', 'ABSTRACTION', 'Mengabaikan detail tidak penting dan fokus pada yang relevan', 8),

(9, 'AND / OR / NOT',
 'Logika dasar untuk mengambil keputusan.',
 'Siti bisa masak nasi goreng kalau nasi ADA DAN minyak ADA. Keduanya harus ada. Tapi kalau dia bisa masak nasi goreng ATAU mie goreng (cukup salah satu), itu logika OR. Dan kalau telur TIDAK ada, dia tidak pakai telur. AND, OR, NOT — tiga operasi logika dasar untuk berpikir.',
 'Isi Kulkas Logic Lab', 'decision', 'AND_OR_NOT', 'Memahami operasi logika AND, OR, dan NOT dalam pengambilan keputusan', 9),

(10, 'Computational Thinking Terpadu',
 'Gabungkan dekomposisi, pola, abstraksi, dan logika.',
 'Siti dapat pesanan kompleks. Dia harus pecah masalahnya (dekomposisi), cari pola antar masakan (pattern), fokus pada bahan penting (abstraksi), dan tentukan langkah berdasarkan kondisi (logika). Inilah computational thinking — empat keterampilan yang bekerja bersama.',
 'Debug Cara Berpikir', 'decision', 'CT_INTEGRATED', 'Menggabungkan dekomposisi, pattern recognition, abstraksi, dan logika', 10),

(11, 'IF — Pengambilan Keputusan',
 'Kalau sesuatu terjadi, lakukan ini.',
 'Siti masak nasi goreng. Dia cek telur. Kalau telur HABIS, dia ganti dengan ayam. Hanya satu kondisi: IF telur habis THEN pakai ayam. Tidak pilihan lain. Itulah IF — keputusan berdasarkan satu kondisi.',
 'Telur Habis', 'decision', 'IF_CONDITION', 'Memahami struktur IF untuk pengambilan keputusan tunggal', 11),

(12, 'IF–ELSE — Dua Kemungkinan',
 'Kalau begini, lakukan A. Kalau tidak, lakukan B.',
 'Siti masak. Kalau kecap ADA, pakai kecap. Kalau TIDAK ADA, pakai garam. Dua kemungkinan: IF kecap ada THEN pakai kecap ELSE pakai garam. Tidak ada opsi ketiga. Itulah IF-ELSE.',
 'Pakai Kecap?', 'decision', 'IF_ELSE', 'Memahami struktur IF-ELSE untuk dua kemungkinan', 12),

(13, 'IF Bertingkat — Banyak Kondisi',
 'Cek kondisi pertama, kalau tidak, cek kondisi berikutnya.',
 'Siti masak sambal. Kalau pelanggan minta PEDAS, pakai 5 cabai. Kalau SEDANG, pakai 3 cabai. Kalau TIDAK PEDAS, pakai 1 cabai. Banyak kondisi berjenjang: IF pedas THEN 5 ELSE IF sedang THEN 3 ELSE 1. Itulah IF bertingkat / nested IF.',
 'Pedas / Sedang / Tidak', 'decision', 'NESTED_IF', 'Memahami IF bertingkat untuk multiple kondisi berurutan', 13),

(14, 'SWITCH / CASE — Pilih Berdasarkan Kategori',
 'Setiap kategori punya tindakan sendiri.',
 'Pelanggan pesan level kepedasan 1 sampai 5. Level 1: tidak pedas. Level 2: sedikit pedas. Level 3: pedas. Level 4: sangat pedas. Level 5: nagabe! Setiap level punya tindakan berbeda. Itulah SWITCH/CASE — pilih tindakan berdasarkan nilai kategori.',
 'Level 1-5', 'decision', 'SWITCH_CASE', 'Memahami struktur SWITCH/CASE untuk kategori diskrit', 14),

(15, 'Review & Integrasi Total',
 'Gabungkan semua konsep dalam satu masalah nyata.',
 'Warung Pak Teuku dapat pesanan rumit. Ada nasi goreng pedas level 3, mie goreng tanpa telur, ayam bakar dengan sambal matah. Siti harus dekomposisi, kenali pola, abstraksi yang penting, dan ambil keputusan dengan IF/ELSE/SWITCH. Semua konsep menyatu dalam satu masalah.',
 'Salah Pesan Challenge', 'flowchart_builder', 'FULL_INTEGRATION', 'Mengintegrasikan semua konsep dalam satu masalah kompleks', 15)
ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  subtitle = EXCLUDED.subtitle,
  story = EXCLUDED.story,
  lab_name = EXCLUDED.lab_name,
  lab_type = EXCLUDED.lab_type,
  concept = EXCLUDED.concept,
  learning_focus = EXCLUDED.learning_focus,
  sort_order = EXCLUDED.sort_order;