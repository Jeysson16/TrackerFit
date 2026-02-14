-- 1. User Streaks
CREATE TABLE public.user_streaks (
    user_id UUID REFERENCES auth.users(id) ON DELETE CASCADE PRIMARY KEY,
    current_streak INTEGER DEFAULT 0,
    max_streak INTEGER DEFAULT 0,
    last_activity_date DATE, -- The last day the streak was incremented
    freeze_items_available INTEGER DEFAULT 0, -- Protection items
    created_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()) NOT NULL,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()) NOT NULL
);

ALTER TABLE public.user_streaks ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Users can view their own streak" ON public.user_streaks FOR SELECT USING (auth.uid() = user_id);
CREATE POLICY "Users can update their own streak" ON public.user_streaks FOR UPDATE USING (auth.uid() = user_id);
CREATE POLICY "Users can insert their own streak" ON public.user_streaks FOR INSERT WITH CHECK (auth.uid() = user_id);

-- 2. Achievements Catalog
CREATE TABLE public.achievements (
    id TEXT PRIMARY KEY, -- e.g., 'iron_novice'
    name TEXT NOT NULL,
    description TEXT NOT NULL,
    icon_path TEXT, -- Local asset path or URL
    condition_code TEXT, -- e.g., 'workouts_10', 'macros_7_days'
    xp_reward INTEGER DEFAULT 100,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()) NOT NULL
);

ALTER TABLE public.achievements ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Achievements are viewable by everyone" ON public.achievements FOR SELECT USING (true);

-- 3. User Achievements (Unlocked)
CREATE TABLE public.user_achievements (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    user_id UUID REFERENCES auth.users(id) ON DELETE CASCADE NOT NULL,
    achievement_id TEXT REFERENCES public.achievements(id) ON DELETE CASCADE NOT NULL,
    unlocked_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()) NOT NULL,
    UNIQUE(user_id, achievement_id)
);

ALTER TABLE public.user_achievements ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Users can view their unlocked achievements" ON public.user_achievements FOR SELECT USING (auth.uid() = user_id);
CREATE POLICY "System/Users can insert unlocked achievements" ON public.user_achievements FOR INSERT WITH CHECK (auth.uid() = user_id);

-- 4. Personal Records (PRs)
CREATE TABLE public.personal_records (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    user_id UUID REFERENCES auth.users(id) ON DELETE CASCADE NOT NULL,
    exercise_id UUID REFERENCES public.exercises(id) ON DELETE CASCADE NOT NULL,
    reps INTEGER NOT NULL, -- PRs are usually specific to rep ranges (1RM, 5RM)
    weight_kg NUMERIC NOT NULL,
    achieved_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()) NOT NULL
);

ALTER TABLE public.personal_records ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Users can manage their own PRs" ON public.personal_records FOR ALL USING (auth.uid() = user_id);

-- Seed Data: Basic Achievements
INSERT INTO public.achievements (id, name, description, condition_code, xp_reward) VALUES
('iron_novice', 'Novato de Hierro', 'Completa 10 entrenamientos.', 'workouts_10', 100),
('macro_master', 'Maestro del Macro', 'Cumple tus macros 7 días seguidos.', 'macros_7_streak', 500),
('early_bird', 'Madrugador', 'Entrena antes de las 7 AM 5 veces.', 'early_workouts_5', 200)
ON CONFLICT DO NOTHING;
