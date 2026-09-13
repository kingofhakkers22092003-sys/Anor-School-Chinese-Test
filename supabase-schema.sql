-- Supabase SQL Editor oynasida shu faylning hammasini bir marta Run qiling.
-- Jadval nomlari xitoy tili saytiga tegishli bo‘lib, boshqa saytlardagi ma’lumotlar bilan aralashmaydi.
create table if not exists public.chinese_students (
  id uuid primary key,
  full_name text not null,
  school_class text not null,
  password text not null,
  results jsonb not null default '{}'::jsonb,
  attempts jsonb not null default '[]'::jsonb,
  pending_review jsonb not null default '{}'::jsonb,
  telegram_sent boolean not null default false,
  telegram_error text,
  created_at timestamptz not null default now()
);
create unique index if not exists chinese_students_name_class_unique on public.chinese_students (lower(full_name), school_class);

create table if not exists public.chinese_questions (
  id text primary key,
  section text not null,
  grade integer check (grade between 1 and 11),
  prompt text not null,
  options jsonb,
  answer text,
  audio_text text,
  audio_url text,
  created_at timestamptz not null default now()
);
create index if not exists chinese_questions_section_grade_index on public.chinese_questions (section, grade);

create table if not exists public.chinese_app_settings (
  key text primary key,
  value jsonb not null,
  updated_at timestamptz not null default now()
);
insert into public.chinese_app_settings (key, value)
values ('main', '{"gradingMode":"teacher","adminUsername":"admin","adminPassword":"admin","readingPassage":{"content":"","translation":""}}'::jsonb)
on conflict (key) do nothing;

alter table public.chinese_students enable row level security;
alter table public.chinese_questions enable row level security;
alter table public.chinese_app_settings enable row level security;
