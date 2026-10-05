-- ============================================================
-- BUU Score App – Supabase Schema
-- วิทยาลัยการกีฬา มหาวิทยาลัยบูรพา
-- รันใน Supabase SQL Editor ครั้งเดียว
-- ============================================================

-- ── 1. Tables ───────────────────────────────────────────────

create table if not exists score_teachers (
  id      text primary key,
  uid     text unique not null,
  name    text not null,
  pw      text not null,
  cids    text[] default '{}'
);

create table if not exists score_courses (
  id      text primary key,
  code    text not null,
  name    text not null,
  name_t  text,
  credits text default '3(3-0-6)',
  grp     integer default 1,
  year    integer default 2567,
  tid     text references score_teachers(id)
);

create table if not exists score_students (
  id      text primary key,
  uid     text unique not null,
  name    text not null,
  pw      text not null,
  cids    text[] default '{}'
);

create table if not exists score_scores (
  id          text primary key default gen_random_uuid()::text,
  student_id  text not null references score_students(id) on delete cascade,
  course_id   text not null references score_courses(id) on delete cascade,
  col         numeric default 0,
  mid         numeric default 0,
  fin         numeric default 0,
  aff         numeric default 0,
  unique(student_id, course_id)
);

-- ── 2. Row Level Security ───────────────────────────────────
-- แอพนี้ใช้ anon key และ auth อยู่ฝั่ง client
-- เปิด allow-all เพื่อความสะดวก (demo app)

alter table score_teachers enable row level security;
alter table score_courses   enable row level security;
alter table score_students  enable row level security;
alter table score_scores    enable row level security;

drop policy if exists "allow all" on score_teachers;
drop policy if exists "allow all" on score_courses;
drop policy if exists "allow all" on score_students;
drop policy if exists "allow all" on score_scores;

create policy "allow all" on score_teachers for all using (true) with check (true);
create policy "allow all" on score_courses  for all using (true) with check (true);
create policy "allow all" on score_students for all using (true) with check (true);
create policy "allow all" on score_scores   for all using (true) with check (true);

-- ── 3. ข้อมูลเริ่มต้น (Seed Data) ─────────────────────────
-- (ตัวเลือก: ข้ามได้ เพราะ app จะ seed อัตโนมัติเมื่อเปิดครั้งแรก)

insert into score_teachers (id, uid, name, pw, cids) values
  ('t1', 'teacher01', 'อาจารย์ สมชาย ใจดี', 'teacher01',
   '{"c1","c2","c3"}')
on conflict (id) do nothing;

insert into score_courses (id, code, name, name_t, credits, grp, year, tid) values
  ('c1', 'SPE101', 'กีฬาเพื่อสุขภาพ', 'Sport for Health',
   '3(2-2-5)', 1, 2567, 't1'),
  ('c2', 'SPE201', 'การฝึกกีฬาขั้นสูง', 'Advanced Sport Training',
   '3(2-2-5)', 2, 2567, 't1'),
  ('c3', 'SPE301', 'วิทยาศาสตร์การกีฬา', 'Sport Science',
   '3(3-0-6)', 3, 2567, 't1')
on conflict (id) do nothing;

insert into score_students (id, uid, name, pw, cids) values
  ('s01','6410001','นิสิต ทดสอบ 01','s01','{"c1","c2","c3"}'),
  ('s02','6410002','นิสิต ทดสอบ 02','s02','{"c1","c2","c3"}'),
  ('s03','6410003','นิสิต ทดสอบ 03','s03','{"c1","c2","c3"}'),
  ('s04','6410004','นิสิต ทดสอบ 04','s04','{"c1","c2","c3"}'),
  ('s05','6410005','นิสิต ทดสอบ 05','s05','{"c1","c2","c3"}'),
  ('s06','6410006','นิสิต ทดสอบ 06','s06','{"c1","c2","c3"}'),
  ('s07','6410007','นิสิต ทดสอบ 07','s07','{"c1","c2","c3"}'),
  ('s08','6410008','นิสิต ทดสอบ 08','s08','{"c1","c2","c3"}'),
  ('s09','6410009','นิสิต ทดสอบ 09','s09','{"c1","c2","c3"}'),
  ('s10','6410010','นิสิต ทดสอบ 10','s10','{"c1","c2","c3"}'),
  ('s11','6410011','นิสิต ทดสอบ 11','s11','{"c1","c2","c3"}'),
  ('s12','6410012','นิสิต ทดสอบ 12','s12','{"c1","c2","c3"}'),
  ('s13','6410013','นิสิต ทดสอบ 13','s13','{"c1","c2","c3"}'),
  ('s14','6410014','นิสิต ทดสอบ 14','s14','{"c1","c2","c3"}'),
  ('s15','6410015','นิสิต ทดสอบ 15','s15','{"c1","c2","c3"}'),
  ('s16','6410016','นิสิต ทดสอบ 16','s16','{"c1","c2","c3"}'),
  ('s17','6410017','นิสิต ทดสอบ 17','s17','{"c1","c2","c3"}'),
  ('s18','6410018','นิสิต ทดสอบ 18','s18','{"c1","c2","c3"}'),
  ('s19','6410019','นิสิต ทดสอบ 19','s19','{"c1","c2","c3"}'),
  ('s20','6410020','นิสิต ทดสอบ 20','s20','{"c1","c2","c3"}'),
  ('s21','6410021','นิสิต ทดสอบ 21','s21','{"c1","c2","c3"}'),
  ('s22','6410022','นิสิต ทดสอบ 22','s22','{"c1","c2","c3"}'),
  ('s23','6410023','นิสิต ทดสอบ 23','s23','{"c1","c2","c3"}'),
  ('s24','6410024','นิสิต ทดสอบ 24','s24','{"c1","c2","c3"}'),
  ('s25','6410025','นิสิต ทดสอบ 25','s25','{"c1","c2","c3"}'),
  ('s26','6410026','นิสิต ทดสอบ 26','s26','{"c1","c2","c3"}')
on conflict (id) do nothing;

-- เสร็จแล้ว! app จะ seed คะแนนอัตโนมัติเมื่อเปิดครั้งแรก
