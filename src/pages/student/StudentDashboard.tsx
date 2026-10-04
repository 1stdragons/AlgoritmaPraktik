import { useState, useEffect } from 'react'
import { Link, useNavigate } from 'react-router-dom'
import { chaptersData } from '@/data/chapters'

export function StudentDashboard(){
  const [activeId, setActiveId] = useState(1)
  const [completed, setCompleted] = useState<number[]>(()=>{
    try{ return JSON.parse(localStorage.getItem('completed_bab')||'[]')}catch{return []}
  })
  const [code, setCode] = useState('')
  const nav = useNavigate()
  const profile = (()=>{try{return JSON.parse(localStorage.getItem('mock_profile')||'null')}catch{return null}})()
  
  const active = chaptersData.find(c=>c.id===activeId) || chaptersData[0]
  
  useEffect(()=>{ setCode(active.python) },[activeId])
  useEffect(()=>{ localStorage.setItem('completed_bab', JSON.stringify(completed)) },[completed])
  
  if(!profile){
    return <div className='min-h-screen flex items-center justify-center'><div className='text-center space-y-4'><p>Belum login</p><Link to='/login' className='bg-black text-white px-6 py-2 rounded-xl'>Login NIM</Link></div></div>
  }

  const toggleComplete = ()=>{
    if(!completed.includes(activeId)) setCompleted([...completed, activeId])
    if(activeId<15) setActiveId(activeId+1)
  }

  return (
    <div className='min-h-screen bg-[#fafafa]'>
      <header className='sticky top-0 z-10 bg-white border-b'>
        <div className='max-w-7xl mx-auto px-4 py-3 flex justify-between items-center'>
          <Link to='/' className='font-black text-lg'>AlgoritmaPraktik</Link>
          <div className='flex items-center gap-3'>
            <span className='text-sm bg-gray-100 px-3 py-1 rounded-full'>NIM: {profile.nim}</span>
            <button onClick={()=>{localStorage.removeItem('mock_profile'); nav('/login')}} className='text-sm border px-3 py-1 rounded-full'>Keluar</button>
          </div>
        </div>
      </header>
      
      <div className='max-w-7xl mx-auto p-4 grid md:grid-cols-[320px_1fr] gap-4'>
        {/* Left list */}
        <div className='bg-white rounded-2xl border p-3 h-fit md:sticky md:top-[60px]'>
          <div className='font-bold mb-2'>15 BAB - {completed.length}/15 selesai</div>
          <div className='w-full bg-gray-200 h-2 rounded-full mb-3'><div className='bg-black h-2 rounded-full' style={{width: `${(completed.length/15)*100}%`}}></div></div>
          <div className='space-y-1 max-h-[70vh] overflow-auto'>
            {chaptersData.map(ch=>(
              <button key={ch.id} onClick={()=>setActiveId(ch.id)} className={`w-full text-left p-3 rounded-xl border text-sm ${activeId===ch.id?'bg-black text-white border-black':'bg-white hover:bg-gray-50'} ${completed.includes(ch.id)?'ring-1 ring-green-500':''}`}>
                <div className='font-bold'>{ch.bab}: {ch.judul.slice(0,35)}{ch.judul.length>35?'...':''}</div>
                <div className={`text-[11px] mt-1 ${activeId===ch.id?'text-gray-300':'text-gray-500'}`}>{ch.konsep}</div>
              </button>
            ))}
          </div>
        </div>

        {/* Right content */}
        <div className='space-y-4'>
          <Link to='/student' onClick={(e)=>{e.preventDefault(); window.scrollTo(0,0)}} className='text-sm text-gray-500'>← {active.bab}</Link>
          <div className='bg-white rounded-2xl border p-6'>
            <h1 className='text-2xl font-black'>{active.bab}: {active.judul}</h1>
            <p className='text-sm text-gray-600 mt-1 bg-gray-50 border px-3 py-2 rounded-xl inline-block'>{active.konsep}</p>
            
            <div className='mt-6 grid md:grid-cols-2 gap-6'>
              <div>
                <h3 className='font-bold mb-2'>Materi & Cerita (dari buku)</h3>
                <div className='bg-[#f8f9fa] rounded-xl p-4 text-[13px] leading-relaxed whitespace-pre-wrap max-h-[420px] overflow-auto border'>
                  {active.cerita.slice(0,2000)}
                </div>
                <div className='mt-4'>
                  <div className='font-bold text-sm mb-2'>Pseudocode:</div>
                  <pre className='bg-black text-green-400 p-4 rounded-xl text-xs overflow-auto'>{active.pseudo}</pre>
                </div>
              </div>
              
              <div className='space-y-3'>
                <div className='font-bold'>Praktik Kode</div>
                <textarea value={code} onChange={e=>setCode(e.target.value)} className='w-full h-[360px] bg-black text-green-400 p-4 rounded-xl font-mono text-sm focus:outline-none' spellCheck={false}/>
                <button onClick={toggleComplete} className='w-full bg-black text-white py-3 rounded-xl font-bold'>
                  {completed.includes(activeId)?'✓ Selesai - Lanjut BAB Berikutnya':'Tandai Selesai & Lanjut'}
                </button>
                <div className='text-xs text-gray-500 text-center'>Progress auto-simpan. Login NIM: {profile.nim}</div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  )
}
