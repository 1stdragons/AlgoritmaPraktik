import { createContext, useContext, useEffect, useState } from 'react';
import { supabase } from '@/lib/supabase';
export const AuthContext = createContext<any>(null);
export const AuthProvider = ({ children }: any) => {
  const [session, setSession] = useState<any>(null);
  const [profile, setProfile] = useState<any>(null);
  const [loading, setLoading] = useState(true);
  useEffect(() => {
    supabase.auth.getSession().then(({ data }) => { setSession(data.session); setLoading(false); });
    const { data: sub } = supabase.auth.onAuthStateChange((_e, s) => setSession(s));
    return () => sub.subscription.unsubscribe();
  }, []);
  useEffect(() => {
    if (session?.user) setProfile({ role: session.user.user_metadata?.role || 'student', email: session.user.email });
    else setProfile(null);
  }, [session]);
  return <AuthContext.Provider value={{ session, profile, loading }}>{children}</AuthContext.Provider>;
};
export const useAuth = () => useContext(AuthContext);
