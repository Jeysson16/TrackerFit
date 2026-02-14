-- Enable UUID extension if not already enabled
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- 1. Enums
CREATE TYPE gender_type AS ENUM ('male', 'female');
CREATE TYPE goal_type AS ENUM ('deficit', 'maintenance', 'surplus');
CREATE TYPE meal_type_enum AS ENUM ('breakfast', 'lunch', 'dinner', 'snack');

-- 2. Profiles Table (Extends Supabase Auth)
CREATE TABLE public.profiles (
    id UUID REFERENCES auth.users(id) ON DELETE CASCADE PRIMARY KEY,
    email TEXT,
    full_name TEXT,
    birth_date DATE,
    gender gender_type,
    height_cm NUMERIC,
    current_weight_kg NUMERIC,
    activity_level NUMERIC CHECK (activity_level IN (1.2, 1.375, 1.55, 1.725, 1.9)),
    goal goal_type,
    protein_per_kg NUMERIC DEFAULT 2.0,
    fat_per_kg NUMERIC DEFAULT 1.0,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()) NOT NULL,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()) NOT NULL
);

-- Enable RLS for profiles
ALTER TABLE public.profiles ENABLE ROW LEVEL SECURITY;

-- Policies for profiles
CREATE POLICY "Public profiles are viewable by everyone." ON public.profiles FOR SELECT USING (true);
CREATE POLICY "Users can insert their own profile." ON public.profiles FOR INSERT WITH CHECK (auth.uid() = id);
CREATE POLICY "Users can update their own profile." ON public.profiles FOR UPDATE USING (auth.uid() = id);

-- 3. Daily Targets Table
CREATE TABLE public.daily_targets (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    user_id UUID REFERENCES public.profiles(id) ON DELETE CASCADE NOT NULL,
    date DATE NOT NULL,
    calorie_target NUMERIC NOT NULL,
    protein_target_g NUMERIC NOT NULL,
    carb_target_g NUMERIC NOT NULL,
    fat_target_g NUMERIC NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()) NOT NULL,
    UNIQUE(user_id, date)
);

ALTER TABLE public.daily_targets ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Users can view their own targets" ON public.daily_targets FOR SELECT USING (auth.uid() = user_id);
CREATE POLICY "Users can manage their own targets" ON public.daily_targets FOR ALL USING (auth.uid() = user_id);

-- 4. Food Products (Cache)
CREATE TABLE public.food_products (
    barcode TEXT PRIMARY KEY,
    product_name TEXT NOT NULL,
    brand TEXT,
    serving_size TEXT,
    calories NUMERIC,
    proteins_100g NUMERIC,
    carbs_100g NUMERIC,
    fats_100g NUMERIC,
    image_url TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()) NOT NULL
);

ALTER TABLE public.food_products ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Food products are readable by everyone" ON public.food_products FOR SELECT USING (true);
CREATE POLICY "Authenticated users can add food products" ON public.food_products FOR INSERT WITH CHECK (auth.role() = 'authenticated');

-- 5. Meal Logs
CREATE TABLE public.meal_logs (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    user_id UUID REFERENCES public.profiles(id) ON DELETE CASCADE NOT NULL,
    date DATE NOT NULL,
    meal_type meal_type_enum NOT NULL,
    food_product_barcode TEXT REFERENCES public.food_products(barcode),
    custom_name TEXT,
    quantity_consumed NUMERIC NOT NULL,
    unit TEXT NOT NULL, -- 'g', 'ml', 'serving'
    
    -- Snapshot Nutricional (Calculated at log time)
    total_calories NUMERIC,
    total_protein NUMERIC,
    total_carbs NUMERIC,
    total_fat NUMERIC,
    
    created_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()) NOT NULL
);

ALTER TABLE public.meal_logs ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Users can manage their own meal logs" ON public.meal_logs FOR ALL USING (auth.uid() = user_id);

-- 6. Daily Summaries (Gemini Feedback)
CREATE TABLE public.daily_summaries (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    user_id UUID REFERENCES public.profiles(id) ON DELETE CASCADE NOT NULL,
    date DATE NOT NULL,
    daily_note TEXT,
    gemini_feedback TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()) NOT NULL,
    UNIQUE(user_id, date)
);

ALTER TABLE public.daily_summaries ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Users can manage their own summaries" ON public.daily_summaries FOR ALL USING (auth.uid() = user_id);

-- Trigger to create profile on signup (Optional but recommended)
CREATE OR REPLACE FUNCTION public.handle_new_user() 
RETURNS TRIGGER AS $$
BEGIN
  INSERT INTO public.profiles (id, email, full_name)
  VALUES (new.id, new.email, new.raw_user_meta_data->>'full_name');
  RETURN new;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

CREATE OR REPLACE TRIGGER on_auth_user_created
  AFTER INSERT ON auth.users
  FOR EACH ROW EXECUTE PROCEDURE public.handle_new_user();
