# BUU Score App 🏅

ระบบแจ้งผลคะแนนนิสิต วิทยาลัยการกีฬา มหาวิทยาลัยบูรพา

## Features
- ล็อกอินแยกสิทธิ์ **อาจารย์** / **นิสิต**
- กรอก–แก้ไขคะแนน (คอลเลกเตอร์, กลางภาค, ปลายภาค, พฤติกรรม)
- แสดงเกรดอัตโนมัติ (A B+ B C+ C D+ D F)
- นำเข้า/ส่งออก Excel (SheetJS)
- ซิงค์ข้อมูลกับ **Supabase** (ทำงานออฟไลน์ได้ถ้าไม่มีเน็ต)
- ธีม BUU Gold 🟡

## Quick Start

### 1. รัน SQL Schema ใน Supabase
เปิด [Supabase SQL Editor](https://supabase.com/dashboard) แล้วรันไฟล์ `supabase-setup.sql`

### 2. Deploy บน Vercel
1. Fork repo นี้
2. Import ใน [vercel.com](https://vercel.com/new)
3. ตั้ง Environment Variables:
   ```
   SB_URL   = https://xxxxx.supabase.co
   SB_KEY   = your-anon-key
   ```
4. Deploy!

### 3. ใช้แบบ Standalone (ไม่ต้อง deploy)
เปิด `index.html` ในเบราว์เซอร์ → กรอก Supabase URL + Anon Key ในหน้า Setup → พร้อมใช้งาน

## Stack
- Vanilla HTML/CSS/JS (ไม่มี framework)
- [Supabase JS v2](https://supabase.com/docs/reference/javascript)
- [SheetJS v0.18.5](https://sheetjs.com/) (Excel import/export)

## Database Schema

| Table | Description |
|-------|-------------|
| `score_teachers` | ข้อมูลอาจารย์ |
| `score_courses` | รายวิชา |
| `score_students` | ข้อมูลนิสิต |
| `score_scores` | คะแนนแต่ละวิชา |

## License
MIT © มหาวิทยาลัยบูรพา
