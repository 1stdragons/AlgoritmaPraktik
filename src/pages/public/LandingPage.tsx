import { Link } from 'react-router-dom';
export function LandingPage() {
  return (
    <div className="min-h-screen flex flex-col items-center justify-center bg-white p-8">
      <h1 className="text-4xl font-bold mb-4">AlgoritmaPraktik</h1>
      <p className="text-neutral-600 mb-8 text-center max-w-xl">Platform pembelajaran Algoritma 15 Bab untuk Mahasiswa - tracking progress, analisis konsep.</p>
      <div className="flex gap-4">
        <Link to="/login" className="bg-black text-white px-6 py-2 rounded">Login</Link>
        <Link to="/register" className="border px-6 py-2 rounded">Daftar</Link>
      </div>
    </div>
  );
}