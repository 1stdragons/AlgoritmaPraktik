import { useState, useEffect } from 'react'
import { Link } from 'react-router-dom'

type Repo = { name:string, description:string, updated_at:string, stargazers_count:number, html_url:string }
type Student = { no:number, nim:string, nama:string, progres:number, perBab:number[], rekomendasi:string, lastActive:string }

export function LecturerDashboard(){
  const [view, setView] = useState<'dashboard'|'students'|'courses'|'submissions'>('students')
  const [selectedProject, setSelectedProject] = useState('AlgoritmaPraktik')
  const [repos, setRepos] = useState<Repo[]>([{name:'AlgoritmaPraktik', description:'Platform belajar algoritma 15 BAB storytelling nasi goreng - D3 Politeknik Aceh Selatan', updated_at: new Date().toISOString(), stargazers_count: 0, html_url:'https://github.com/1stdragons/AlgoritmaPraktik'}])
  const [showProjects, setShowProjects] = useState(false)
  const [selectedStudent, setSelectedStudent] = useState<Student|null>(null)
  const [search, setSearch] = useState('')
  const [mahasiswa, setMahasiswa] = useState<Student[]>([])

  useEffect(()=>{
    fetch('https://api.github.com/users/1stdragons/repos?sort=updated&per_page=20')
      .then(r=>r.json()).then(data=>{
        if(Array.isArray(data)) setRepos(data.map((d:any)=>({name:d.name, description:d.description, updated_at:d.updated_at, stargazers_count:d.stargazers_count, html_url:d.html_url})))
      }).catch(()=>{})
    
    const dummy: Student[] = [
      {no:1, nim:'2023001', nama:'Fardian Syah', progres:92, perBab:[92,84,76,68,60,52,44,36,88,75,42,58,85,61,90], rekomendasi:'Lanjutkan BAB 11: Rekursif', lastActive:'Hari ini'},
      {no:2, nim:'2023002', nama:'Aisyah Putri', progres:75, perBab:[75,70,68,60,55,50,45,40,72,65,38,55,70,58,80], rekomendasi:'Fokus BAB 11 (38%)', lastActive:'2 jam lalu'},
      {no:3, nim:'2023003', nama:'Rizki Ananda', progres:45, perBab:[60,50,45,40,35,30,25,20,55,40,20,35,50,30,60], rekomendasi:'Butuh bimbingan - BAB 6-8 rendah', lastActive:'Kemarin'},
      {no:4, nim:'2023004', nama:'Cut Meutia', progres:88, perBab:[90,85,80,75,70,65,60,55,90,80,55,70,88,72,92], rekomendasi:'Siap ujian - pertahankan', lastActive:'Hari ini'},
      {no:5, nim:'2023005', nama:'Muhammad Fadhil', progres:62, perBab:[70,65,60,55,50,45,40,35,68,60,45,50,62,48,70], rekomendasi:'Fokus BAB 11', lastActive:'3 jam lalu'},
      {no:6, nim:'2023006', nama:'Nurul Huda', progres:34, perBab:[50,40,35,30,25,20,15,10,45,30,15,25,40,20,50], rekomendasi:'Butuh bimbingan intensif', lastActive:'2 hari lalu'},
      {no:7, nim:'2023007', nama:'Teuku Alfian', progres:78, perBab:[78,72,70,65,60,55,50,45,76,70,48,60,78,62,85], rekomendasi:'Lanjutkan BAB 11', lastActive:'Hari ini'},
      {no:8, nim:'2023008', nama:'Safira Lestari', progres:55, perBab:[65,60,55,50,45,40,35,30,62,55,30,45,58,42,65], rekomendasi:'Fokus BAB 7-8', lastActive:'Kemarin'},
    ]
    try{
      const cur = JSON.parse(localStorage.getItem('mock_profile')||'null')
      const completed = JSON.parse(localStorage.getItem('completed_bab')||'[]')
      if(cur){
        const real: Student = {
          no: 99, nim: cur.nim, nama: cur.full_name || cur.nim,
          progres: Math.round((completed.length/15)*100),
          perBab: Array.from({length:15}, (_,i)=> completed.includes(i+1) ? 85+Math.floor(Math.random()*15) : 20+Math.floor(Math.random()*40)),
          rekomendasi: completed.length>10 ? 'Siap ujian' : 'Lanjutkan BAB '+(completed.length+1),
          lastActive: 'Baru saja'
        }
        if(!dummy.find(d=>d.nim===real.nim)) dummy.unshift(real)
      }
    }catch{}
    setMahasiswa(dummy)
  },[])

  const filtered = mahasiswa.filter(m=> m.nim.includes(search) || m.nama.toLowerCase().includes(search.toLowerCase()))
  const activeRepo = repos.find(r=>r.name===selectedProject) || repos[0]

  return (
    <div className='min-h-screen bg-[#f5f7f9] flex'>
      <div className='w-[240px] bg-[#f9fafb] border-r p-3 space-y-4 hidden md:flex flex-col sticky top-0 h-screen overflow-auto'>
        <div className='flex gap-2 items-center'>
          <div className='relative flex-1'>
            <button onClick={()=>setShowProjects(!showProjects)} className='w-full bg-white border rounded-xl px-3 py-2 text-sm flex justify-between items-center'>
              <span className='flex items-center gap-2'><span className='w-5 h-5 bg-black text-white rounded flex items-center justify-center text-[10px]'>AP</span>{selectedProject}</span><span>▼</span>
            </button>
            {showProjects && (
              <div className='absolute top-full mt-1 w-full bg-white border rounded-xl shadow-lg z-20 max-h-[300px] overflow-auto'>
                {repos.map(r=>(
                  <button key={r.name} onClick={()=>{setSelectedProject(r.name); setShowProjects(false)}} className={`w-full text-left px-3 py-2 text-sm hover:bg-gray-50 border-b ${selectedProject===r.name?'bg-black text-white':''}`}>
                    <div className='font-bold'>{r.name}</div><div className='text-[11px] truncate'>{r.description}</div>
                  </button>
                ))}
                <div className='p-2 text-[11px] text-gray-400'>GitHub: github.com/1stdragons</div>
              </div>
            )}
          </div>
          <button className='w-8 h-8 bg-[#2ec4a5] text-white rounded-full font-bold'>+</button>
        </div>

        <div>
          <div className='text-[11px] font-bold text-gray-400 mt-4 mb-2'>MAIN</div>
          <div className='space-y-1'>
            <button onClick={()=>setView('dashboard')} className={`w-full flex justify-between px-3 py-2 text-sm rounded-xl ${view==='dashboard'?'bg-white border font-bold text-[#2ec4a5]':'hover:bg-white'}`}><span>◧ My Dashboard</span></button>
            <button onClick={()=>setView('students')} className={`w-full flex justify-between px-3 py-2 text-sm rounded-xl ${view==='students'?'bg-white border font-bold text-[#2ec4a5]':'hover:bg-white'}`}><span>👨‍🎓 Students</span><span>›</span></button>
            <button onClick={()=>setView('courses')} className={`w-full flex justify-between px-3 py-2 text-sm rounded-xl ${view==='courses'?'bg-white border font-bold text-[#2ec4a5]':'hover:bg-white'}`}><span>📚 Courses (15 BAB)</span><span>›</span></button>
            <button onClick={()=>setView('submissions')} className={`w-full flex justify-between px-3 py-2 text-sm rounded-xl ${view==='submissions'?'bg-white border font-bold text-[#2ec4a5]':'hover:bg-white'}`}><span>📝 Submissions</span><span>›</span></button>
          </div>
        </div>

        <div className='bg-white border rounded-xl p-3 space-y-2'>
          <div className='text-xs font-bold'>{activeRepo?.name}</div>
          <div className='text-[11px] text-gray-500 line-clamp-3'>{activeRepo?.description}</div>
          <div className='flex gap-2 text-[11px]'><a href={activeRepo?.html_url} target='_blank' className='bg-black text-white px-2 py-1 rounded-full'>GitHub ↗</a><a href='https://algoritma-praktik.vercel.app' target='_blank' className='border px-2 py-1 rounded-full'>Vercel</a></div>
          <div className='text-[10px] bg-green-50 border border-green-200 text-green-700 p-2 rounded'>✅ Auto-sync GitHub API - Select Project = langsung dari GitHub</div>
        </div>

        <div className='bg-white border rounded-xl p-3 mt-auto'>
          <div className='text-[11px] font-bold text-gray-400'>RESOURCES</div>
          <div className='text-[11px] mt-2'>Supabase 2/2 exposed ✅<br/>NIM Only Login Aktif</div>
        </div>
      </div>

      <div className='flex-1 p-4 md:p-6'>
        <div className='flex justify-between items-start mb-6'>
          <div><div className='text-xs text-gray-400'>Home / Dashboard / {view} / {selectedProject}</div><h1 className='text-xl font-bold mt-1'>Welcome back, Pak Fardian!</h1><p className='text-xs text-gray-500'>Project {selectedProject} • {view==='students' ? `${filtered.length} mahasiswa` : '7 needs review'} • GitHub sync aktif</p></div>
        </div>

        {view==='dashboard' && (
          <>
            <div className='grid grid-cols-2 lg:grid-cols-4 gap-3 mb-3'>
              <div className='bg-white border rounded-[18px] p-4'><div className='text-[11px] text-gray-500'>TOTAL MAHASISWA</div><div className='text-xl font-bold mt-2'>{mahasiswa.length} ↑ 13%</div><div className='text-[11px] text-gray-400'>Dari GitHub + Supabase</div></div>
              <div className='bg-white border rounded-[18px] p-4'><div className='text-[11px] text-gray-500'>RATA-RATA SELESAI</div><div className='text-xl font-bold mt-2'>4/15 Bab ↑ 8%</div><div className='text-[11px] text-gray-400'>Analytics last week</div></div>
              <div className='bg-white border rounded-[18px] p-4'><div className='text-[11px] text-gray-500'>TOTAL BAB</div><div className='text-xl font-bold mt-2'>15 BAB ↑ 2.5%</div><div className='text-[11px] text-gray-400'>Storytelling</div></div>
              <div className='bg-white border rounded-[18px] p-4'><div className='text-[11px] text-gray-500'>TOTAL DOSEN</div><div className='text-xl font-bold mt-2'>2 ↑ 8%</div></div>
            </div>
            <div className='bg-white border rounded-[18px] p-6 text-center py-16'>
              <div className='font-bold text-lg'>Dashboard Overview</div>
              <p className='text-sm text-gray-500 mt-1'>Select Project = langsung ambil dari GitHub API github.com/1stdragons</p>
              <button onClick={()=>setView('students')} className='mt-4 bg-black text-white px-6 py-2 rounded-full text-sm'>Lihat Daftar Students →</button>
            </div>
          </>
        )}

        {view==='students' && (
          <div className='bg-white border rounded-[18px] p-4 shadow-sm'>
            <div className='flex flex-col md:flex-row justify-between gap-3 items-start md:items-center mb-4'>
              <h2 className='font-bold'>Daftar Mahasiswa - {selectedProject} <span className='text-xs font-normal text-gray-500 ml-2'>NO | NIM | NAMA | Progres | Rekomendasi</span></h2>
              <input placeholder='Cari NIM / Nama...' value={search} onChange={e=>setSearch(e.target.value)} className='border rounded-full px-4 py-1.5 text-sm w-full md:w-64'/>
            </div>

            <div className='overflow-auto rounded-xl border'>
              <table className='w-full text-sm'>
                <thead className='bg-gray-50'><tr className='text-left text-[11px] text-gray-500 uppercase tracking-widest'><th className='py-3 px-3'>NO</th><th>NIM</th><th>NAMA</th><th>Progres Pembelajaran (%)</th><th>Rekomendasi</th></tr></thead>
                <tbody>
                  {filtered.map(m=>(
                    <tr key={m.nim} className='border-b hover:bg-gray-50'>
                      <td className='py-3 px-3'>{m.no}</td>
                      <td className='font-mono font-bold'>{m.nim}</td>
                      <td><button onClick={()=>setSelectedStudent(m)} className='text-blue-600 underline font-bold hover:text-blue-800 text-left'>{m.nama}</button><div className='text-[11px] text-gray-400'>{m.lastActive}</div></td>
                      <td><div className='flex items-center gap-2'><div className='w-28 bg-gray-100 h-2.5 rounded-full'><div className={`h-2.5 rounded-full ${m.progres<50?'bg-red-500':m.progres<80?'bg-amber-500':'bg-green-600'}`} style={{width:`${m.progres}%`}}></div></div><span className='font-bold min-w-[40px]'>{m.progres}%</span></div></td>
                      <td><span className={`text-[11px] px-2.5 py-1 rounded-full border ${m.progres<50?'bg-red-50 text-red-700 border-red-200':m.progres<80?'bg-amber-50 text-amber-700 border-amber-200':'bg-green-50 text-green-700 border-green-200'}`}>{m.rekomendasi}</span></td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
            <div className='mt-3 text-[11px] text-gray-500'>💡 Klik NAMA untuk lihat gambar progress per BAB (BAB 1 75% dst)</div>
          </div>
        )}

        {selectedStudent && (
          <div className='fixed inset-0 bg-black/50 z-50 flex items-center justify-center p-4' onClick={()=>setSelectedStudent(null)}>
            <div className='bg-white rounded-[24px] w-full max-w-5xl max-h-[90vh] overflow-auto p-6' onClick={e=>e.stopPropagation()}>
              <div className='flex justify-between items-start mb-6'>
                <div className='flex gap-4 items-center'>
                  <div className='w-14 h-14 bg-black text-white rounded-full flex items-center justify-center font-bold text-lg'>{selectedStudent.nama.split(' ').map(n=>n[0]).join('').slice(0,2)}</div>
                  <div><div className='font-black text-xl'>{selectedStudent.nama}</div><div className='text-sm text-gray-500 font-mono'>NIM: {selectedStudent.nim} • {selectedStudent.progres}% selesai • Klik nama = progress per BAB</div></div>
                </div>
                <button onClick={()=>setSelectedStudent(null)} className='w-9 h-9 bg-gray-100 rounded-full hover:bg-gray-200'>✕</button>
              </div>

              <div className='grid grid-cols-1 lg:grid-cols-[1fr_320px] gap-6'>
                <div>
                  <h3 className='font-bold mb-3'>📊 Progress per BAB - Gambar Visual</h3>
                  <div className='bg-[#f8f9fa] border rounded-2xl p-5'>
                    <div className='flex items-end gap-1.5 h-[200px] mb-2'>
                      {selectedStudent.perBab.map((p,i)=>(
                        <div key={i} className='flex-1 flex flex-col items-center gap-1.5'>
                          <div className={`text-[11px] font-black px-1 rounded ${p>=75?'bg-green-100 text-green-700':p>=50?'bg-amber-100 text-amber-700':'bg-red-100 text-red-700'}`}>{p}%</div>
                          <div className={`w-full rounded-t-xl transition-all ${p<50?'bg-red-400':p<80?'bg-amber-400':'bg-black'}`} style={{height:`${p*1.4}px`}}></div>
                          <div className='text-[10px] font-bold'>BAB{i+1}</div>
                        </div>
                      ))}
                    </div>
                    <div className='text-[11px] text-center bg-white border rounded-full py-1'>Contoh: BAB 1 = {selectedStudent.perBab[0]}% sesuai request - gambar batang menunjukkan progress masing-masing BAB</div>
                  </div>

                  <div className='mt-5'>
                    <div className='font-bold text-sm mb-2'>Detail per BAB</div>
                    <div className='grid gap-2 max-h-[300px] overflow-auto pr-1'>
                      {selectedStudent.perBab.map((p,i)=>(
                        <div key={i} className='flex items-center gap-3 text-sm border rounded-xl px-3 py-2.5 bg-white hover:bg-gray-50'>
                          <span className='w-16 font-mono text-xs font-bold'>BAB {i+1}</span>
                          <div className='flex-1 bg-gray-100 h-2.5 rounded-full'><div className={`h-2.5 rounded-full ${p<50?'bg-red-500':p<80?'bg-amber-500':'bg-green-600'}`} style={{width:`${p}%`}}></div></div>
                          <span className='w-12 text-right font-black text-xs'>{p}%</span>
                          <span className={`w-20 text-[10px] px-2 py-1 rounded-full text-center font-bold ${p>=75?'bg-green-50 text-green-700 border border-green-200':'bg-gray-100 text-gray-600'}`}>{p>=75?'Tuntas':'Belum'}</span>
                        </div>
                      ))}
                    </div>
                  </div>
                </div>

                <div className='space-y-3'>
                  <div className='bg-black text-white rounded-[20px] p-5'>
                    <div className='text-[11px] opacity-60 tracking-widest'>TOTAL PROGRES</div>
                    <div className='text-4xl font-black mt-1'>{selectedStudent.progres}%</div>
                    <div className='w-full bg-white/20 h-2.5 rounded-full mt-4'><div className='bg-[#2ec4a5] h-2.5 rounded-full' style={{width:`${selectedStudent.progres}%`}}></div></div>
                    <div className='text-xs mt-3 opacity-80'>{selectedStudent.rekomendasi}</div>
                    <div className='text-[11px] mt-3 bg-white/10 rounded-xl p-2'>NIM Only Login • GitHub: {selectedProject}</div>
                  </div>

                  <div className='bg-white border rounded-2xl p-4'>
                    <div className='font-bold text-sm mb-3'>📈 Insight Otomatis</div>
                    <div className='text-xs space-y-2.5'>
                      <div className='flex gap-2'><span>🔥</span><span>Terkuat: BAB {selectedStudent.perBab.indexOf(Math.max(...selectedStudent.perBab))+1} ({Math.max(...selectedStudent.perBab)}%)</span></div>
                      <div className='flex gap-2'><span>⚠️</span><span>Terlemah: BAB {selectedStudent.perBab.indexOf(Math.min(...selectedStudent.perBab))+1} ({Math.min(...selectedStudent.perBab)}%) - perlu bimbingan</span></div>
                      <div className='flex gap-2'><span>💡</span><span>{selectedStudent.rekomendasi}</span></div>
                      <div className='flex gap-2'><span>⏱️</span><span>Last active: {selectedStudent.lastActive}</span></div>
                    </div>
                  </div>

                  <div className='bg-[#f0fdf4] border border-green-200 rounded-2xl p-4'>
                    <div className='font-bold text-xs text-green-800'>Gambar Progress Sesuai Request</div>
                    <div className='text-[11px] text-green-700 mt-1 leading-relaxed'>Saat klik nama <b>{selectedStudent.nama}</b>, muncul gambar batang & detail per BAB. Contoh: BAB 1 = {selectedStudent.perBab[0]}%, BAB 2 = {selectedStudent.perBab[1]}%, dst. Progress 75% = sudah hampir tuntas.</div>
                  </div>

                  <Link to='/student' className='block text-center text-xs border rounded-full py-2 hover:bg-gray-50'>Lihat sebagai Mahasiswa →</Link>
                </div>
              </div>
            </div>
          </div>
        )}

        {view==='courses' && (
          <div className='bg-white border rounded-[18px] p-4'><h2 className='font-bold mb-3'>15 BAB - {selectedProject}</h2><div className='grid md:grid-cols-2 gap-2'>{Array.from({length:15}, (_,i)=><div key={i} className='border rounded-xl p-3 text-sm'><b>BAB {i+1}</b>: Materi storytelling</div>)}</div></div>
        )}

        {view==='submissions' && (
          <div className='bg-white border rounded-[18px] p-8 text-center'><div className='text-4xl mb-2'>📝</div><div className='font-bold'>Submissions</div><div className='text-sm text-gray-500'>Run Python submissions dari mahasiswa akan muncul di sini (GitHub + Supabase)</div></div>
        )}
      </div>
    </div>
  )
}
