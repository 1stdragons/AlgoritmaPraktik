import { useState } from 'react';
import { supabase } from '@/lib/supabase';
import { useNavigate, Link } from 'react-router-dom';

export function LoginPage() {
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [loading, setLoading] = useState(false);
  const nav = useNavigate();

  const handleLogin = async (e: React.FormEvent) => {
    e.preventDefault();
    setLoading(true);
    const { error } = await supabase.auth.signInWithPassword({ email, password });
    setLoading(false);
    if (error) alert(error.message);
    else nav('/');
  };

  return (
    <div className="min-h-screen flex items-center justify-center bg-neutral-50 p-4">
      <form onSubmit={handleLogin} className="w-full max-w-sm bg-white p-8 rounded-xl shadow">
        <h1 className="text-2xl font-bold mb-6">Login AlgoritmaPraktik</h1>
        <input className="w-full border p-2 rounded mb-3" placeholder="Email" type="email" value={email} onChange={e=>setEmail(e.target.value)} required />
        <input className="w-full border p-2 rounded mb-4" placeholder="Password" type="password" value={password} onChange={e=>setPassword(e.target.value)} required />
        <button disabled={loading} className="w-full bg-black text-white p-2 rounded">{loading ? 'Loading...' : 'Login'}</button>
        <p className="mt-4 text-sm text-center">Belum punya akun? <Link to="/register" className="underline">Daftar</Link></p>
      </form>
    </div>
  );
}