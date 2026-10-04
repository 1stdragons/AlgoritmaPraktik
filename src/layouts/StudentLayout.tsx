import { Outlet } from 'react-router-dom';
export function StudentLayout() { return <div><nav className='p-4 bg-black text-white'>Student - AlgoritmaPraktik</nav><main className='p-6'><Outlet /></main></div>; }
