import { useState, useEffect, useRef } from 'react'
import { Link, useNavigate } from 'react-router-dom'
import { chaptersData } from '@/data/chapters'

export function StudentDashboard(){
  const [activeId, setActiveId] = useState(1)
  const [completed, setCompleted] = useState<number[]>(()=>{
    try{ return JSON.parse(localStorage.getItem('completed_bab')||'[]')}catch{return []}
  })
  const [code, setCode] = useState('')
  const [output, setOutput] = useState('Output akan muncul di sini...\nKlik ▶ Jalankan untuk run!')
  const [running, setRunning] = useState(false)
  const [pyodideReady, setPyodideReady] = useState(false)
  const pyodideRef = useRef<any>(null)
  const nav = useNavigate()
  const profile = (()=>{try{return JSON.parse(localStorage.getItem('mock_profile')||'null')}catch{return null}})()
  
  const active = chaptersData.find(c=>c.id===activeId) || chaptersData[0]
  
  useEffect(()=>{ setCode(active.python) },[activeId])
  useEffect(()=>{ localStorage.setItem('completed_bab', JSON.stringify(completed)) },[completed])

  // Load Pyodide once
  useEffect(()=>{
    if((window as any).loadPyodide) {
      setPyodideReady(true)
      return
    }
    const script = document.createElement('script')
    script.src = 'https://cdn.jsdelivr.net/pyodide/v0.24.1/full/pyodide.js'
    script.onload = ()=> setPyodideReady(true)
    document.body.appendChild(script)
  },[])

  const runPython = async ()=>{
    setRunning(true)
    setOutput('⏳ Menjalankan Python...')
    try{
      // Try Pyodide if available
      if((window as any).loadPyodide){
        if(!pyodideRef.current){
          pyodideRef.current = await (window as any).loadPyodide()
        }
        const py = pyodideRef.current
        // capture stdout
        let out = ''
        py.setStdout({ batched: (t:string)=>{ out += t + '\n' }})
        py.setStderr({ batched: (t:string)=>{ out += '❌ ' + t + '\n' }})
        
        // Handle input() - mock with prompt
        const codeWithInput = code.replace(/input\((.*?)\)/g, (m:any, p:any)=>{
          const q = p.replace(/["']/g,'')
          return `__import__("js").prompt(${JSON.stringify(q)}) or ""`
        })
        
        // Simple run for basic code (without input for now, use mock)
        // For input, we replace with fixed values for demo
        let safeCode = code
          .replace(/input\(.*?\)/g, '"3"') // mock input = 3 for demo
        
        // If original has input, ask user
        if(code.includes('input(')){
          const userVal = prompt('Program minta input - masukkan nilai (contoh: 3, y, pedas):', '3')
          safeCode = code.replace(/input\(.*?\)/g, `"${userVal||''}"`)
        }
        
        try{
          await py.runPythonAsync(safeCode)
          if(!out) out = '✅ Program selesai tanpa output (pakai print() ya)'
          setOutput(out)
        }catch(e:any){
          setOutput('❌ Error:\n' + (e.message||e))
        }
      }else{
        // Fallback: simple JS emulation for basic prints
        let out = ''
        const lines = code.split('\n')
        for(const line of lines){
          const m = line.match(/print\((.*)\)/)
          if(m){
            try{
              let val = m[1].trim()
              // simple eval
              if(val.startsWith('f"') || val.startsWith("f'")){
                // f-string crude
                out += val.slice(2,-1).replace(/\{.*?\}/g, '[var]') + '\n'
              }else if((val.startsWith('"') && val.endsWith('"')) || (val.startsWith("'") && val.endsWith("'"))){
                out += val.slice(1,-1) + '\n'
              }else{
                out += val + '\n'
              }
            }catch{}
          }
        }
        if(!out) out = 'Klik Jalankan lagi - Pyodide sedang loading...\n' + code.slice(0,200)
        setOutput(out || '✅ Kode dijalankan (emulasi sederhana)')
      }
    }catch(e:any){
      setOutput('❌ Gagal run: ' + e.message)
    }
    setRunning(false)
  }
  
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
          <div className='text-sm text-gray-500'>← {active.bab}</div>
          <div className='bg-white rounded-2xl border p-6'>
            <h1 className='text-2xl font-black'>{active.bab}: {active.judul}</h1>
            <p className='text-sm text-gray-600 mt-1 bg-gray-50 border px-3 py-2 rounded-xl inline-block'>{active.konsep}</p>
            
            <div className='mt-6 grid lg:grid-cols-2 gap-6'>
              <div>
                <h3 className='font-bold mb-2'>Materi & Cerita (dari buku)</h3>
                <div className='bg-[#f8f9fa] rounded-xl p-4 text-[13px] leading-relaxed whitespace-pre-wrap max-h-[340px] overflow-auto border'>
                  {active.cerita.slice(0,2000)}
                </div>
                <div className='mt-4'>
                  <div className='font-bold text-sm mb-2'>Pseudocode:</div>
                  <pre className='bg-black text-green-400 p-4 rounded-xl text-xs overflow-auto'>{active.pseudo}</pre>
                </div>
              </div>
              
              <div className='space-y-3'>
                <div className='flex justify-between items-center'>
                  <div className='font-bold'>Praktik Kode - Python</div>
                  <div className='text-[10px] px-2 py-1 rounded bg-green-100 text-green-700'>{pyodideReady?'🟢 Python Ready':'🟡 Loading Python...'}</div>
                </div>
                <div className='relative'>
                  <textarea value={code} onChange={e=>setCode(e.target.value)} className='w-full h-[280px] bg-black text-green-400 p-4 rounded-xl font-mono text-[13px] focus:outline-none border-2 border-black' spellCheck={false}/>
                  <button onClick={runPython} disabled={running} className='absolute top-2 right-2 bg-white text-black px-4 py-1.5 rounded-full text-xs font-black shadow hover:bg-gray-100 disabled:opacity-50'>
                    {running?'⏳':'▶ Jalankan'}
                  </button>
                </div>
                
                <div className='bg-[#111] border border-gray-800 rounded-xl p-3'>
                  <div className='text-[11px] text-gray-400 font-bold mb-1 flex justify-between'>
                    <span>OUTPUT</span>
                    <button onClick={()=>setOutput('')} className='text-gray-500 hover:text-white'>Clear</button>
                  </div>
                  <pre className='text-green-300 font-mono text-xs whitespace-pre-wrap min-h-[100px] max-h-[160px] overflow-auto'>{output}</pre>
                </div>

                <button onClick={toggleComplete} className='w-full bg-black text-white py-3 rounded-xl font-bold hover:bg-gray-900'>
                  {completed.includes(activeId)?'✓ Selesai - Lanjut BAB Berikutnya':'Tandai Selesai & Lanjut'}
                </button>
                <div className='text-xs text-gray-500 text-center'>NIM: {profile.nim} • Progress auto-simpan • {pyodideReady?'Python aktif di browser':'Python akan aktif 5 detik lagi'}</div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  )
}
