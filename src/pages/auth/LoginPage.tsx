import { useState } from 'react'
import { supabase, isSupabaseConfigured } from '@/lib/supabase'
import { useNavigate, Link } from 'react-router-dom'

export function LoginPage(){
  const [email,setEmail]=useState('')
  const [pass,setPass]=useState('')
  const [role,setRole]=useState('student')
  const nav = useNavigate()
  const handle = async (e:any)=>{
    e.preventDefault()
    if(!isSupabaseConfigured){
      const mock = { id: 'mock-'+Date.now(), email, role, full_name: email.split('@')[0], nim: '2023004' }
      localStorage.setItem('mock_profile', JSON.stringify(mock))
      nav(role==='lecturer'? '/lecturer' : '/student')
      return
    }
    const { data, error } = await supabase!.auth.signInWithPassword({email, password: pass})
    if(error){ alert(error.message); return }
    const { data: prof } = await supabase!.from('profiles').select('*').eq('id', data.user.id).single()
    nav(prof?.role==='lecturer'? '/lecturer' : '/student')
  }
  const handleRegister = async ()=>{
    if(!isSupabaseConfigured){ handle({preventDefault:()=>{}} as any); return }
    const { data, error } = await supabase!.auth.signUp({email, password: pass})
    if(error){ alert(error.message); return }
    await supabase!.from('profiles').insert({ id: data.user!.id, email, role, full_name: email.split('@')[0], nim: '2023'+Math.floor(Math.random()*1000) })
    alert('Daftar berhasil, cek email & login!')
  }
  return (
    <div className='min-h-screen flex items-center justify-center p-6'>
      <form onSubmit={handle} className='w-full max-w-sm border-2 p-6 rounded-2xl space-y-4'>
        <h1 className='text-2xl font-bold'>Login AlgoritmaPraktik</h1>
        <select value={role} onChange={e=>setRole(e.target.value)} className='w-full border p-2 rounded'><option value="student">Mahasiswa</option><option value="lecturer">Dosen</option></select>
        <input className='w-full border p-2 rounded' placeholder='email' value={email} onChange={e=>setEmail(e.target.value)} />
        <input className='w-full border p-2 rounded' type="password" placeholder='password' value={pass} onChange={e=>setPass(e.target.value)} />
        <button className='w-full bg-black text-white py-2 rounded-xl'>Masuk</button>
        <button type="button" onClick={handleRegister} className='w-full border py-2 rounded-xl'>Daftar sebagai {role}</button>
        <Link to="/" className='text-sm text-gray-500 block text-center'>Kembali</Link>
        {!isSupabaseConfigured && <p className='text-xs bg-yellow-50 p-2 rounded'>Mode Mock: env belum set di Vercel</p>}
      </form>
    </div>
  )
}
