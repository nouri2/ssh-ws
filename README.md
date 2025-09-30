# استخدم صورة Node.js رسمية
FROM node:18

# إنشاء مجلد التطبيق
WORKDIR /app

# نسخ ملفات المشروع (إذا كان لديك server.js و package.json)
COPY . .

# تثبيت dependencies
RUN npm install ws

# تحديد البورت الذي سيستمع عليه السيرفر (Railway يعطي PORT)
ENV PORT=3000

# أمر التشغيل
CMD ["node", "server.js"]
