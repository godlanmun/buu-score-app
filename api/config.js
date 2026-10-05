// Vercel Serverless Function
// ส่ง Supabase config จาก Environment Variables ให้ frontend
export default function handler(req, res) {
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.setHeader('Cache-Control', 'no-store');
  res.json({
    url: process.env.SB_URL || '',
    key: process.env.SB_KEY || '',
  });
}
