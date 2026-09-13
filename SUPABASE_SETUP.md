# Chinese Test Website + Telegram — Supabase sozlash

Bu sayt `chinese_students`, `chinese_questions` va `chinese_app_settings` jadvallaridan foydalanadi.
Shu sababli Arab sayt bilan bir xil Supabase loyihasiga ulansa ham ma’lumotlar aralashmaydi.

1. Supabase Dashboard -> **SQL Editor** ni oching.
2. `supabase-schema.sql` faylining hamma matnini SQL Editor'ga joylashtirib **Run** ni bosing.
3. Lokal `.env` fayliga quyidagilarni qo‘shing:

   ```text
   SUPABASE_URL=https://pxxlluithjwnfofnzhya.supabase.co
   SUPABASE_SECRET_KEY=sb_secret_...
   ```

4. Eski lokal savol, o‘quvchi va sozlamalarni bir marta Supabase'ga ko‘chiring:

   ```powershell
   npm run migrate:supabase
   ```

5. Chinese Render Web Service -> **Environment** bo‘limiga ayni `SUPABASE_URL` va
   `SUPABASE_SECRET_KEY` qiymatlarini qo‘shing. Start Command `npm start` bo‘lib qoladi.
6. GitHub'ga o‘zgarishlarni push qiling va Render’da deploy qiling.

`SUPABASE_SECRET_KEY` maxfiy. Uni GitHub'ga yoki brauzer JavaScriptiga yozmang.
