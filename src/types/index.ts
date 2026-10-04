export type UserRole = 'student' | 'lecturer';
export type LearningLevel = 'SMP' | 'SMA_SMK' | 'D3_S1';
export type LabType = 'simulation' | 'decision' | 'algorithm_builder' | 'flowchart_builder';
export type QuestionType = 'multiple_choice' | 'decision' | 'sequence' | 'text';
export type ErrorType =
  | 'INPUT_ERROR'
  | 'LOGIC_ERROR'
  | 'PROCESS_ERROR'
  | 'OUTPUT_ERROR'
  | 'SEQUENCE_ERROR'
  | 'CONDITION_ERROR'
  | 'VALIDATION_ERROR'
  | 'NONE';

export type ExerciseState =
  | 'NOT_STARTED'
  | 'IN_PROGRESS'
  | 'ANSWERED'
  | 'CORRECT'
  | 'INCORRECT'
  | 'ANALYZING'
  | 'HINT_AVAILABLE'
  | 'NEW_EQUIVALENT_EXERCISE'
  | 'MASTERED'
  | 'NEXT';

export interface Profile {
  id: string;
  role: UserRole;
  full_name: string;
  nim: string | null;
  semester: number | null;
  program_studi: string | null;
  jurusan: string | null;
  learning_level: LearningLevel | null;
  password_changed: boolean;
  created_at: string;
}

export interface Chapter {
  id: number;
  title: string;
  subtitle: string | null;
  story: string | null;
  lab_name: string | null;
  lab_type: LabType | null;
  concept: string | null;
  learning_focus: string | null;
  sort_order: number;
}

export interface Exercise {
  id: string;
  chapter_id: number;
  concept: string;
  skill_tag: string;
  learning_objective: string;
  learning_level: LearningLevel;
  difficulty: number;
  scenario: string;
  question_type: QuestionType;
  question: string;
  correct_answer: string;
  equivalent_group: string | null;
  error_type_hint: string | null;
  sort_order: number;
  options?: ExerciseOption[];
  hints?: Hint[];
}

export interface ExerciseOption {
  id: string;
  exercise_id: string;
  label: string;
  is_correct: boolean;
  sort_order: number;
}

export interface Hint {
  id: string;
  exercise_id: string;
  level: number;
  text: string;
}

export interface Attempt {
  id: string;
  student_id: string;
  chapter_id: number;
  exercise_id: string;
  attempt_number: number;
  answer: string | null;
  score: number;
  correct: boolean;
  hint_used: boolean;
  error_type: ErrorType | null;
  created_at: string;
}

export interface ChapterResult {
  id: string;
  student_id: string;
  chapter_id: number;
  score: number;
  mastery_level: number;
  attempts: number;
  completed: boolean;
  updated_at: string;
}

export interface StudentProgress {
  id: string;
  student_id: string;
  total_attempts: number;
  avg_score: number;
  overall_mastery: number;
  completed_chapters: number;
  updated_at: string;
}

export const MASTERY_LABELS: Record<number, string> = {
  0: 'BELUM TERLIHAT',
  1: 'MULAI MEMAHAMI',
  2: 'CUKUP PAHAM',
  3: 'PAHAM',
  4: 'MENGUASAI',
  5: 'MENGUASAI',
};

export const MASTERY_COLORS: Record<number, string> = {
  0: '#94a3b8',
  1: '#f59e0b',
  2: '#eab308',
  3: '#84cc16',
  4: '#22c55e',
  5: '#16a34a',
};

export const ERROR_LABELS: Record<string, string> = {
  INPUT_ERROR: 'Input Error',
  LOGIC_ERROR: 'Logic Error',
  PROCESS_ERROR: 'Process Error',
  OUTPUT_ERROR: 'Output Error',
  SEQUENCE_ERROR: 'Sequence Error',
  CONDITION_ERROR: 'Condition Error',
  VALIDATION_ERROR: 'Validation Error',
  NONE: 'Tidak Ada Error',
};

export const ERROR_FEEDBACK: Record<string, string> = {
  INPUT_ERROR: 'Sebelum memilih langkah berikutnya, coba periksa kembali apa bahan/kondisi awal yang tersedia.',
  LOGIC_ERROR: 'Yuk cek lagi logikanya. Apakah keputusanmu sesuai dengan kondisi yang ada?',
  PROCESS_ERROR: 'Coba lihat prosesnya. Apakah langkah yang kamu pilih sudah tepat?',
  OUTPUT_ERROR: 'Apakah hasil yang kamu pilih benar-benar output dari proses tersebut?',
  SEQUENCE_ERROR: 'Urutannya belum tepat. Coba pikirkan: apa yang harus dilakukan lebih dulu?',
  CONDITION_ERROR: 'Kondisi belum terpenuhi. Coba cek lagi: apakah kondisinya benar?',
  VALIDATION_ERROR: 'Ada yang tidak valid. Coba periksa kembali jawabanmu.',
  NONE: 'Tidak ada error.',
};
