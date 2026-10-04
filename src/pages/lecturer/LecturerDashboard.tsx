import { chapters } from '@/data/chapters';
import { mockStudents, conceptDifficulty } from '@/data/mockStudents';

export function LecturerDashboard(){
  const myProgress = JSON.parse(localStorage.getItem('progress')||'{}');
  const students = mockStudents.map(s => s.isYou ? {...s, progress: myProgress} : s);

  const totalAvg = Math.round(students.reduce((acc,s)=> acc + Object.keys(s.progress).length,0) / students.length);

  return (
    <div className='max-w-6xl mx-auto space-y-6'>
      <div>
        <h1 className='text-3xl font-bold'>Dashboard Dosen</h1>
        <p className='text-gray-600'>Analisis pembelajaran 15 Bab Algoritma</p>
      </div>

      <div className='grid md:grid-cols-4 gap-4'>
        <div className='p-5 border-2 rounded-xl bg-black text-white'><p className='text-sm opacity-70'>Total Mahasiswa</p><p className='text-3xl font-bold mt-1'>{students.length}</p></div>
        <div className='p-5 border-2 rounded-xl'><p className='text-sm text-gray-500'>Rata-rata Selesai</p><p className='text-3xl font-bold mt-1'>{totalAvg}/15 Bab</p></div>
        <div className='p-5 border-2 rounded-xl'><p className='text-sm text-gray-500'>Bab Tersulit</p><p className='text-xl font-bold mt-1'>BAB 11: Rekursif</p></div>
        <div className='p-5 border-2 rounded-xl bg-yellow-50 border-yellow-300'><p className='text-sm'>Butuh Perhatian</p><p className='text-3xl font-bold mt-1'>1 Mahasiswa</p><p className='text-xs mt-1'>Progress &lt; 3 bab</p></div>
      </div>

      <div className='grid md:grid-cols-2 gap-6'>
        <div className='p-5 border rounded-xl'>
          <h3 className='font-bold mb-4'>Progress per Bab (Kelas)</h3>
          <div className='space-y-2'>
            {chapters.slice(0,10).map(ch=>{
              const doneCount = students.filter(s=> s.progress[ch.id]).length;
              const pct = Math.round(doneCount / students.length * 100);
              return (
                <div key={ch.id} className='flex items-center gap-3'>
                  <span className='text-xs w-16'>BAB {ch.id}</span>
                  <div className='flex-1 h-2 bg-gray-100 rounded'><div className='h-2 bg-black rounded' style={{width: pct+'%'}}></div></div>
                  <span className='text-xs w-8'>{pct}%</span>
                </div>
              )
            })}
          </div>
        </div>
        <div className='p-5 border rounded-xl'>
          <h3 className='font-bold mb-4'>Analisis Konsep Tersulit</h3>
          <div className='space-y-3'>
            {conceptDifficulty.map(c=>(
              <div key={c.concept} className='flex justify-between items-center p-3 bg-gray-50 rounded-lg'>
                <div><p className='font-bold text-sm'>{c.concept}</p><p className='text-xs text-gray-500'>BAB {c.bab} • {c.studentsStruggle} mhs kesulitan</p></div>
                <div className='text-right'><p className={`font-bold ${c.avgScore < 60 ? 'text-red-600' : 'text-green-600'}`}>{c.avgScore}%</p><p className='text-xs'>avg score</p></div>
              </div>
            ))}
          </div>
        </div>
      </div>

      <div className='p-5 border rounded-xl overflow-auto'>
        <h3 className='font-bold mb-4'>Daftar Mahasiswa & Progress</h3>
        <table className='w-full text-sm'>
          <thead><tr className='text-left border-b'><th className='pb-2'>Nama</th><th>NIM</th><th>Progress</th><th>Waktu</th><th>Status</th></tr></thead>
          <tbody>
            {students.map(s=>{
              const p = Object.keys(s.progress).length;
              return <tr key={s.id} className='border-b'><td className='py-2 font-medium'>{s.name} {s.isYou && '(Kamu)'}</td><td>{s.nim}</td><td>{p}/15 <div className='w-20 h-1 bg-gray-100 inline-block ml-2'><div className='h-1 bg-black' style={{width: p/15*100+'%'}}></div></div></td><td>{s.time}</td><td><span className={`px-2 py-1 rounded text-xs ${p>=8 ? 'bg-green-100' : p>=3 ? 'bg-yellow-100' : 'bg-red-100'}`}>{p>=8 ? 'On Track' : p>=3 ? 'Perlu Bimbingan' : 'Tertinggal'}</span></td></tr>
            })}
          </tbody>
        </table>
      </div>
    </div>
  )
}
