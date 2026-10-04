import { useState } from 'react'
import { useNavigate, Link } from 'react-router-dom'

export function LoginPage(){
  const [id,setId]=useState('')
  const [role,setRole]=useState<'student'|'lecturer'>('student')
  const nav = useNavigate()
  
  const masuk = (e:any)=>{
    e.preventDefault()
    if(!id) return alert('Isi NIM dulu')
    const email = id.includes('@') ? id : `${id}@poltek.id`
    localStorage.setItem('mock_profile', JSON.stringify({
      id: 'id-'+id, email, role, full_name: id, nim: id
    }))
    nav(role==='lecturer'? '/lecturer' : '/student')
  }
  return (
    <div className='min-h-screen flex items-center justify-center p-6 bg-gray-50'>
      <form onSubmit={masuk} className='w-full max-w-sm border-2 p-6 rounded-2xl space-y-4 bg-white'>
        <h1 className='text-2xl font-bold'>Login AlgoritmaPraktik</h1>
        <p className='text-xs text-green-600'>✅ Database Ready! Login Simple Aktif</p>
        <select value={role} onChange={e=>setRole(e.target.value as any)} className='w-full border p-2 rounded'>
          <option value="student">Mahasiswa - NIM saja</option>
          <option value="lecturer">Dosen</option>
        </select>
        <input className='w-full border-2 border-black p-3 rounded-xl text-lg' placeholder='Ketik NIM: 2023001' value={id} onChange={e=>setId(e.target.value)} autoFocus />
        <button className='w-full bg-black text-white py-3 rounded-xl font-bold text-lg'>Masuk Langsung →</button>
        <p className='text-xs text-center text-gray-500'>Mahasiswa: cukup NIM. Dosen: email. Tanpa password!</p>
        <Link to="/" className='text-sm text-gray-500 block text-center'>Kembali</Link>
      </form>
    </div>
  )
}