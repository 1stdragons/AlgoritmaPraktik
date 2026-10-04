import { HashRouter, Routes, Route, Link } from 'react-router-dom';
import { StudentDashboard } from './pages/student/StudentDashboard';
import { ChapterPage } from './pages/student/ChapterPage';

function LandingPage(){
  return (
    <div className="min-h-screen flex flex-col items-center justify-center p-6">
      <h1 className="text-5xl font-bold">AlgoritmaPraktik</h1>
      <p className="text-center text-gray-600 mt-4 max-w-xl">Platform pembelajaran Algoritma 15 Bab - tracking progress, analisis konsep.</p>
      <div className="flex gap-3 mt-6">
        <Link to="/student" className="bg-black text-white px-6 py-2 rounded-lg">Masuk sebagai Mahasiswa</Link>
        <Link to="/lecturer" className="border px-6 py-2 rounded-lg">Dosen</Link>
      </div>
    </div>
  )
}
function LecturerPage(){ 
  const progress = JSON.parse(localStorage.getItem('progress')||'{}');
  return <div className="max-w-4xl mx-auto p-6"><h1 className="text-2xl font-bold">Dashboard Dosen</h1><p className="mt-2">{Object.keys(progress).length}/15 bab rata-rata selesai</p></div> 
}

export default function App(){
  return (
    <HashRouter>
      <div className="min-h-screen bg-white">
        <nav className="border-b p-3 flex justify-between max-w-6xl mx-auto"><Link to="/" className="font-bold">AlgoritmaPraktik</Link><div className="flex gap-4 text-sm"><Link to="/student">Mahasiswa</Link><Link to="/lecturer">Dosen</Link></div></nav>
        <div className="p-6"><Routes><Route path="/" element={<LandingPage/>} /><Route path="/student" element={<StudentDashboard/>} /><Route path="/student/chapter/:id" element={<ChapterPage/>} /><Route path="/lecturer" element={<LecturerPage/>} /></Routes></div>
      </div>
    </HashRouter>
  )
}
