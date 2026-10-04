import { HashRouter, Routes, Route, Link } from 'react-router-dom';
import { StudentDashboard } from './pages/student/StudentDashboard';
import { ChapterPage } from './pages/student/ChapterPage';
import { LecturerDashboard } from './pages/lecturer/LecturerDashboard';

function LandingPage(){
  return (
    <div className="min-h-screen flex flex-col items-center justify-center p-6">
      <h1 className="text-5xl font-bold">AlgoritmaPraktik</h1>
      <p className="text-center text-gray-600 mt-4 max-w-xl">Platform pembelajaran Algoritma 15 Bab - tracking progress, analisis konsep untuk dosen.</p>
      <div className="flex gap-3 mt-6">
        <Link to="/student" className="bg-black text-white px-6 py-3 rounded-xl">Masuk Mahasiswa</Link>
        <Link to="/lecturer" className="bg-yellow-400 text-black px-6 py-3 rounded-xl font-bold">Masuk Dosen</Link>
      </div>
    </div>
  )
}

export default function App(){
  return (
    <HashRouter>
      <div className="min-h-screen bg-white">
        <nav className="border-b p-3 flex justify-between max-w-6xl mx-auto"><Link to="/" className="font-bold">AlgoritmaPraktik</Link><div className="flex gap-4 text-sm font-medium"><Link to="/student">Mahasiswa</Link><Link to="/lecturer" className="bg-black text-white px-3 py-1 rounded">Dosen</Link></div></nav>
        <div className="p-6"><Routes><Route path="/" element={<LandingPage/>} /><Route path="/student" element={<StudentDashboard/>} /><Route path="/student/chapter/:id" element={<ChapterPage/>} /><Route path="/lecturer" element={<LecturerDashboard/>} /></Routes></div>
      </div>
    </HashRouter>
  )
}
