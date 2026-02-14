-- 1. Sports Catalog
CREATE TABLE public.sports (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    name TEXT NOT NULL UNIQUE, -- Gym, CrossFit, Running, Calisthenics
    icon_asset_path TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()) NOT NULL
);

-- 2. Muscle Groups
CREATE TABLE public.muscle_groups (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    name TEXT NOT NULL UNIQUE, -- Chest, Back, Quads, Hamstrings...
    hex_color TEXT, -- #FF0000 for heatmap
    icon_path TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()) NOT NULL
);

-- 3. Capabilities (Training Focus)
CREATE TABLE public.capabilities (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    name TEXT NOT NULL UNIQUE, -- Strength, Hypertrophy, Endurance, Mobility
    created_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()) NOT NULL
);

-- 4. Exercises
CREATE TABLE public.exercises (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    name TEXT NOT NULL,
    sport_id UUID REFERENCES public.sports(id) ON DELETE CASCADE,
    video_url TEXT,
    instructions TEXT,
    is_custom BOOLEAN DEFAULT false, -- If user created it locally
    created_by UUID REFERENCES auth.users(id), -- Null for global exercises
    created_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()) NOT NULL
);

-- Pivot: Exercise <-> Muscles
CREATE TABLE public.exercise_muscles (
    exercise_id UUID REFERENCES public.exercises(id) ON DELETE CASCADE,
    muscle_group_id UUID REFERENCES public.muscle_groups(id) ON DELETE CASCADE,
    is_primary BOOLEAN DEFAULT true,
    PRIMARY KEY (exercise_id, muscle_group_id)
);

-- Pivot: Exercise <-> Capabilities
CREATE TABLE public.exercise_capabilities (
    exercise_id UUID REFERENCES public.exercises(id) ON DELETE CASCADE,
    capability_id UUID REFERENCES public.capabilities(id) ON DELETE CASCADE,
    PRIMARY KEY (exercise_id, capability_id)
);

-- 5. Routine Templates (Plans)
CREATE TABLE public.templates (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    name TEXT NOT NULL, -- "Push Pull Legs"
    description TEXT,
    sport_id UUID REFERENCES public.sports(id),
    default_color TEXT,
    is_public BOOLEAN DEFAULT true,
    created_by UUID REFERENCES auth.users(id), -- For user custom templates
    created_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()) NOT NULL
);

-- 6. User Routines (Active Assignments)
CREATE TABLE public.user_routines (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    user_id UUID REFERENCES auth.users(id) ON DELETE CASCADE NOT NULL,
    template_id UUID REFERENCES public.templates(id), -- Optional link to original template
    name TEXT NOT NULL, -- User can rename it
    is_active BOOLEAN DEFAULT true,
    start_date DATE DEFAULT CURRENT_DATE,
    schedule_config JSONB, -- { "monday": "Push", "tuesday": "Pull" ... }
    created_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()) NOT NULL
);

-- 7. Workout Sessions (The Log Header)
CREATE TABLE public.workout_sessions (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    user_id UUID REFERENCES auth.users(id) ON DELETE CASCADE NOT NULL,
    routine_id UUID REFERENCES public.user_routines(id) ON DELETE SET NULL,
    name TEXT, -- "Monday Push Day"
    start_time TIMESTAMP WITH TIME ZONE NOT NULL,
    end_time TIMESTAMP WITH TIME ZONE,
    day_rating INTEGER CHECK (day_rating BETWEEN 1 AND 10),
    notes TEXT,
    
    -- Sync fields
    synced_at TIMESTAMP WITH TIME ZONE,
    local_id TEXT, -- To map offline logs
    
    created_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()) NOT NULL
);

-- 8. Exercise Logs (Exercises within a session)
CREATE TABLE public.exercise_logs (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    session_id UUID REFERENCES public.workout_sessions(id) ON DELETE CASCADE NOT NULL,
    exercise_id UUID REFERENCES public.exercises(id) NOT NULL,
    order_index INTEGER DEFAULT 0,
    notes TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()) NOT NULL
);

-- 9. Set Logs (The actual data)
CREATE TABLE public.set_logs (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    exercise_log_id UUID REFERENCES public.exercise_logs(id) ON DELETE CASCADE NOT NULL,
    set_order INTEGER NOT NULL,
    weight_kg NUMERIC,
    reps INTEGER,
    rpe NUMERIC, -- 1-10 (allows 8.5)
    rir INTEGER, -- Reps In Reserve
    rest_time_seconds INTEGER,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()) NOT NULL
);

-- RLS Policies (Examples)
ALTER TABLE public.workout_sessions ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Users can manage their own sessions" ON public.workout_sessions FOR ALL USING (auth.uid() = user_id);

ALTER TABLE public.user_routines ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Users can manage their own routines" ON public.user_routines FOR ALL USING (auth.uid() = user_id);

-- Initial Seed Data (Optional - just examples)
INSERT INTO public.sports (name) VALUES ('Gym'), ('Calisthenics'), ('Running') ON CONFLICT DO NOTHING;
