import { BrowserRouter, Routes, Route, Navigate } from 'react-router-dom';
import { AuthProvider, useAuth } from '@/context/AuthContext';
import { LandingPage } from '@/pages/public/LandingPage';
import { AboutPage } from '@/pages/public/AboutPage';
import { LoginPage } from '@/pages/public/LoginPage';
import { RegisterPage } from '@/pages/public/RegisterPage';
import { StudentLayout } from '@/layouts/StudentLayout';
import { LecturerLayout } from '@/layouts/LecturerLayout';
import { StudentDashboard } from '@/pages/student/StudentDashboard';
import { StudentProfile } from '@/pages/student/StudentProfile';
import { ChapterPage } from '@/pages/student/ChapterPage';
import { LecturerDashboard } from '@/pages/lecturer/LecturerDashboard';
import { LecturerStudents } from '@/pages/lecturer/LecturerStudents';
import { LecturerStudentDetail } from '@/pages/lecturer/LecturerStudentDetail';
import { ClassProgress } from '@/pages/lecturer/ClassProgress';
import { ChapterAnalysis } from '@/pages/lecturer/ChapterAnalysis';
import { ConceptAnalysis } from '@/pages/lecturer/ConceptAnalysis';
import { LecturerReports } from '@/pages/lecturer/LecturerReports';
import type { JSX } from 'react';



function ProtectedRoute({ children, role }: { children: JSX.Element; role: 'student' | 'lecturer' }) {
  const { session, profile, loading } = useAuth();

  if (loading) {
    return (
      <div className="min-h-screen flex items-center justify-center bg-neutral-50">
        <div className="text-center">
          <div className="w-12 h-12 border-4 border-primary-200 border-t-primary-600 rounded-full animate-spin mx-auto mb-4" />
          <p className="text-neutral-500 text-sm">Memuat...</p>
        </div>
      </div>
    );
  }

  if (!session || !profile) {
    return <Navigate to="/login" replace />;
  }

  if (profile.role !== role) {
    return <Navigate to={profile.role === 'lecturer' ? '/lecturer' : '/student'} replace />;
  }

  return children;
}

function PublicRoute({ children }: { children: JSX.Element }) {
  const { session, profile, loading } = useAuth();

  if (loading) {
    return (
      <div className="min-h-screen flex items-center justify-center bg-neutral-50">
        <div className="w-12 h-12 border-4 border-primary-200 border-t-primary-600 rounded-full animate-spin mx-auto" />
      </div>
    );
  }

  if (session && profile) {
    return <Navigate to={profile.role === 'lecturer' ? '/lecturer' : '/student'} replace />;
  }

  return children;
}

function AppRoutes() {
  return (
    <Routes>
      <Route path="/" element={<LandingPage />} />
      <Route path="/about" element={<AboutPage />} />
      <Route path="/login" element={<PublicRoute><LoginPage /></PublicRoute>} />
      <Route path="/register" element={<PublicRoute><RegisterPage /></PublicRoute>} />

      <Route path="/student" element={<ProtectedRoute role="student"><StudentLayout /></ProtectedRoute>}>
        <Route index element={<StudentDashboard />} />
        <Route path="profile" element={<StudentProfile />} />
        <Route path="chapter/:chapterId" element={<ChapterPage />} />
      </Route>

      <Route path="/lecturer" element={<ProtectedRoute role="lecturer"><LecturerLayout /></ProtectedRoute>}>
        <Route index element={<LecturerDashboard />} />
        <Route path="students" element={<LecturerStudents />} />
        <Route path="students/:id" element={<LecturerStudentDetail />} />
        <Route path="class-progress" element={<ClassProgress />} />
        <Route path="chapter-analysis" element={<ChapterAnalysis />} />
        <Route path="concept-analysis" element={<ConceptAnalysis />} />
        <Route path="reports" element={<LecturerReports />} />
      </Route>

      <Route path="*" element={<Navigate to="/" replace />} />
    </Routes>
  );
}

export default function App() {
  return (
    <AuthProvider>
      <BrowserRouter>
        <AppRoutes />
      </BrowserRouter>
    </AuthProvider>
  );
}
