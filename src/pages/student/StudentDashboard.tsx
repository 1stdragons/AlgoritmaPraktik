import { chapters } from '@/data/chapters';
import { Link } from 'react-router-dom';
export function StudentDashboard(){
  const progress = JSON.parse(localStorage.getItem('progress')||'{}');
  return (
    <div className='max-w-6xl mx-auto'>
      <h1 className='text-3xl font-bold mb-2'>Dashboard Mahasiswa</h1>
      <p className='text-gray-600 mb-6'>15 Bab Algoritma - {Object.keys(progress).length}/15 selesai</p>
      <div className='grid md:grid-cols-3 gap-4'>
        {chapters.map(ch => {
          const done =!!progress[ch.id];
          return (
            <Link key={ch.id} to={''+'/student/chapter/'+ch.id} className={'p-5 rounded-xl border-2 hover:shadow-lg transition ' + (done? 'bg-green-50 border-green-400' : 'bg-white border-gray-200')}>
              <div className='flex justify-between'><span className='text-xs px-2 py-1 bg-black text-white rounded'>BAB {ch.id}</span>{done && <span>✅</span>}</div>
              <h3 className='font-bold mt-3'>{ch.title}</h3>
              <p className='text-sm text-gray-600 mt-1'>{ch.desc}</p>
              <div className='flex gap-1 mt-3 flex-wrap'>{ch.concepts.map(c => <span key={c} className='text- bg-gray-100 px-2 py-1 rounded'>{c}</span>)}</div>
            </Link>
          )
        })}
      </div>
    </div>
  )
}
