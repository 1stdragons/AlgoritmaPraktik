import { useParams, useNavigate } from 'react-router-dom';
import { chapters } from '@/data/chapters';
import { useState } from 'react';
export function ChapterPage(){
  const { id } = useParams(); const nav = useNavigate();
  const ch = chapters.find(c => c.id === Number(id));
  const [code, setCode] = useState('# Tulis solusi algoritma Python\nprint("Hello Bab '+id+'")');
  const [done, setDone] = useState(false);
  if(!ch) return <div>Bab tidak ditemukan</div>;
  const complete = () => {
    const p = JSON.parse(localStorage.getItem('progress')||'{}'); p[ch.id]=true; localStorage.setItem('progress', JSON.stringify(p)); setDone(true);
    setTimeout(()=>nav('/student'), 800);
  };
  const pseudo = `ALGORITMA ${ch.title.replace(/ /g,'_')}\nDEKLARASI\n x : integer\nDESKRIPSI\n baca x\n jika x > 0 maka\n   tulis "Positif"\n selesai`;
  return (
    <div className='max-w-5xl mx-auto grid md:grid-cols-2 gap-6'>
      <div>
        <button onClick={()=>nav(-1)} className='text-sm mb-3'>← Kembali</button>
        <h1 className='text-2xl font-bold'>BAB {ch.id}: {ch.title}</h1>
        <p className='text-gray-600 mt-2'>{ch.desc}</p>
        <div className='mt-6 p-4 bg-gray-50 rounded-xl'>
          <h3 className='font-bold'>Materi & Konsep</h3>
          <ul className='list-disc ml-5 mt-2 text-sm'>{ch.concepts.map(c=><li key={c}>{c}: Penjelasan {c} pada {ch.title}</li>)}</ul>
          <div className='mt-4 p-3 bg-white border rounded text-sm'><b>Pseudocode:</b><pre className='mt-2 bg-black text-green-400 p-3 rounded text-xs overflow-auto'>{pseudo}</pre></div>
        </div>
      </div>
      <div>
        <div className='p-4 border rounded-xl'>
          <h3 className='font-bold mb-2'>Praktik Kode</h3>
          <textarea value={code} onChange={e=>setCode(e.target.value)} className='w-full h-64 bg-black text-green-400 p-3 rounded font-mono text-sm'></textarea>
          <button onClick={complete} className='w-full mt-3 bg-black text-white py-2 rounded-lg'>{done? 'Selesai! Mengalihkan...' : 'Tandai Selesai & Lanjut'}</button>
        </div>
      </div>
    </div>
  )
}
