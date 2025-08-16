import { create } from 'zustand';
import { persist, createJSONStorage } from 'zustand/middleware';

type State = {
  token: string | null;
  user: { id: number; email: string } | null;
};

type Actions = {
  setAuth: (token: string, user: { id: number; email: string }) => void;
  logout: () => void;
};

// persistミドルウェアを使い、状態をlocalStorageに永続化する
export const useAuthStore = create<State & Actions>()(
  persist(
    (set) => ({
      token: null,
      user: null,
      setAuth: (token, user) => set(() => ({ token, user })),
      logout: () => set(() => ({ token: null, user: null })),
    }),
    {
      name: 'auth-storage', // localStorage内でのキー名
    }
  )
);
