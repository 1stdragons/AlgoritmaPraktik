import { useState } from 'react'
import { useNavigate, Link } from 'react-router-dom'

export function LoginPage(){
  const [id,setId]=useState('')
  const [role,setRole]=useState<'student'|'lecturer'>('student')
  const nav = useNavigate()
  
  const masuk = (e:any)=>{
    e.preventDefault()
    if(!id.trim()) return alert('Isi NIM / Email dulu ya')
    const email = id.includes('@') ? id.trim() : `${id.trim()}@poltek.id`
    const nim = id.trim()
    localStorage.setItem('mock_profile', JSON.stringify({
      id: 'id-'+Date.now(), email, role, full_name: nim, nim
    }))
    // Simpan juga untuk Supabase kalau sudah 2of2 exposed
    localStorage.setItem('user_nim', nim)
    nav(role==='lecturer'? '/lecturer' : '/student')
  }
  return (
    <div className='min-h-screen flex items-center justify-center p-6 bg-gray-50'>
      <form onSubmit={masuk} className='w-full max-w-sm border-2 border-black p-6 rounded-2xl space-y-4 bg-white shadow-[4px_4px_0px_0px_rgba(0,0,0,1)]'>
        <h1 className='text-2xl font-black'>AlgoritmaPraktik</h1>
        <p className='text-xs font-bold text-green-600 bg-green-50 border border-green-200 p-2 rounded'>✅ Login Simple Aktif - Cukup NIM!</p>
        <div className='flex gap-2'>
          <button type='button' onClick={()=>setRole('student')} className={`flex-1 py-2 rounded-xl border-2 font-bold ${role==='student'?'bg-black text-white border-black':'bg-white border-gray-300'}`}>Mahasiswa</button>
          <button type='button' onClick={()=>setRole('lecturer')} className={`flex-1 py-2 rounded-xl border-2 font-bold ${role==='lecturer'?'bg-black text-white border-black':'bg-white border-gray-300'}`}>Dosen</button>
        </div>
        <input className='w-full border-2 border-black p-3 rounded-xl text-lg font-mono focus:outline-none focus:ring-2 focus:ring-black' placeholder={role==='student'?'NIM: 2023001':'Email dosen'} value={id} onChange={e=>setId(e.target.value)} autoFocus />
        <button className='w-full bg-black text-white py-3 rounded-xl font-black text-lg hover:bg-gray-900'>Masuk Langsung →</button>
        <div className='text-[11px] text-center text-gray-500 leading-tight'>
          Mahasiswa: cukup ketik NIM saja, tanpa password ribet.<br/>Anak-anak gak akan lupa lagi!
        </div>
        <Link to="/" className='text-sm text-gray-500 block text-center underline'>← Kembali ke Beranda</Link>
      </form>
    </div>
  )
}
