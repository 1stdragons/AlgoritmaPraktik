import { Outlet } from 'react-router-dom';
export function LecturerLayout() { return <div><nav className='p-4 bg-black text-white'>Lecturer - AlgoritmaPraktik</nav><main className='p-6'><Outlet /></main></div>; }
