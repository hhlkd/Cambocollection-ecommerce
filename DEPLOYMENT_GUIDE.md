# 🚀 FREE E-Commerce Deployment Guide

## Overview
- **Frontend** → Vercel (FREE)
- **Backend** → Railway (FREE tier + $5 credit)
- **Database** → MySQL on Railway (FREE)
- **Cost**: $0 (uses free credits)

---

## 📋 Prerequisites

1. **GitHub Account** (create one if you don't have)
2. Free accounts at:
   - [Vercel.com](https://vercel.com)
   - [Railway.app](https://railway.app)

---

## 🔧 Step 1: Push Code to GitHub

### 1.1 Initialize Git Repository
```bash
cd d:/Web\ developer/Back-end/Vue/e-commerce

# Initialize if not already done
git init
git add .
git commit -m "Initial commit - ecommerce project"
```

### 1.2 Create GitHub Repository
1. Go to [GitHub.com](https://github.com/new)
2. Create repo named `ecommerce`
3. Copy the commands and run:

```bash
git remote add origin https://github.com/YOUR_USERNAME/ecommerce.git
git branch -M main
git push -u origin main
```

---

## 🌐 Step 2: Deploy Backend on Railway (FREE)

### 2.1 Create Railway Account
1. Go to [railway.app](https://railway.app)
2. Sign up with GitHub
3. Click **"New Project"**

### 2.2 Deploy Backend
1. Click **"Deploy from GitHub repo"**
2. Select your `ecommerce` repo
3. Choose `ecommerce-backend` folder (if asked for directory)
4. Click **"Deploy"**

### 2.3 Add MySQL Database
1. In Railway dashboard, click **"+ New"**
2. Select **"MySQL"**
3. Railway auto-connects it to your app
4. Copy the database credentials shown

### 2.4 Configure Environment Variables

In Railway dashboard, go to **Variables** tab and add:

```
APP_NAME=E-Commerce
APP_ENV=production
APP_DEBUG=false
APP_KEY=(copy from your local .env)
APP_URL=https://your-railway-domain.railway.app

DB_CONNECTION=mysql
DB_HOST=(Railway gives you this)
DB_DATABASE=railway
DB_USERNAME=root
DB_PASSWORD=(Railway gives you this)

CACHE_DRIVER=database
SESSION_DRIVER=database
QUEUE_CONNECTION=database

TELEGRAM_BOT_TOKEN=your-telegram-bot-token
TELEGRAM_CHAT_ID=your-telegram-chat-id

GOOGLE_CLIENT_ID=your-google-oauth-client-id
GOOGLE_CLIENT_SECRET=your-google-oauth-client-secret
GOOGLE_REDIRECT_URI=https://your-railway-domain.railway.app/auth/google/callback

SANCTUM_STATEFUL_DOMAINS=your-vercel-domain.vercel.app
SESSION_DOMAIN=your-railway-domain.railway.app
CORS_ALLOWED_ORIGINS=https://your-vercel-domain.vercel.app
```

### 2.5 Run Database Migrations
1. In Railway, go to **Deployments**
2. Click on the deployment
3. Go to **"Logs"** tab
4. You'll see if migrations ran automatically
5. If not, you can run manually via SSH or add to startup script

**Note**: Your Railway backend URL will look like:
```
https://ecommerce-backend-production.up.railway.app
```

---

## 🎨 Step 3: Deploy Frontend on Vercel (FREE)

### 3.1 Create Vercel Account
1. Go to [vercel.com](https://vercel.com)
2. Sign up with GitHub
3. Click **"New Project"**

### 3.2 Import Your Repository
1. Select your `ecommerce` GitHub repo
2. Choose **"ecommerce-frontend"** as root directory
3. Add Environment Variable:
   ```
   VITE_API_URL=https://your-railway-backend.railway.app/api
   ```
4. Click **"Deploy"**

### 3.3 After Deployment
- Vercel gives you a URL like: `https://ecommerce-frontend.vercel.app`
- Your site is now LIVE! 🎉

---

## 🔄 Step 4: Update Configurations (Important!)

### Update Backend .env.production
```bash
# Replace with your actual URLs:
APP_URL=https://your-railway-backend.railway.app
GOOGLE_REDIRECT_URI=https://your-railway-backend.railway.app/auth/google/callback
CORS_ALLOWED_ORIGINS=https://your-vercel-frontend.vercel.app
```

### Update Frontend API URL
In your Vue components, update API calls:
```javascript
// In your services/api.js or similar:
const API_URL = import.meta.env.VITE_API_URL || 'https://your-railway-backend.railway.app/api'

// OR update in your main.js:
const app = createApp(App)
app.config.globalProperties.$apiUrl = 'https://your-railway-backend.railway.app/api'
```

---

## 📝 Step 5: Verify Deployment

### Test Backend API
```bash
curl https://your-railway-backend.railway.app/api/products
# Should return your products data
```

### Test Frontend
1. Visit: `https://your-vercel-frontend.vercel.app`
2. Check browser console (F12) for errors
3. Verify API calls are working

---

## 🔐 Important Security Notes

1. **Never** commit `.env` file with secrets to GitHub
2. Update Google OAuth redirect URIs in Google Console
3. Add production domains to CORS whitelist
4. Set `APP_DEBUG=false` in production

---

## 🆘 Troubleshooting

### Backend not starting?
- Check Railway logs for errors
- Verify database credentials
- Ensure migrations ran successfully

### Frontend showing blank page?
- Check browser console (F12) for errors
- Verify `VITE_API_URL` is set correctly
- Check CORS headers from backend

### API calls failing?
- Verify backend URL in frontend is correct
- Check CORS configuration in `config/cors.php`
- Test with: `curl https://your-backend.railway.app/api/test`

---

## 📊 Free Tier Limits

| Service | Free Tier | Notes |
|---------|-----------|-------|
| Vercel | 100GB bandwidth/month | Generous free tier |
| Railway | $5 credit/month | Usually covers small projects |
| MySQL | Database included | Via Railway |

---

## 💾 Automatic Deployments

Both platforms support automatic deployments:
- Push to GitHub main branch
- Vercel & Railway auto-deploy in ~2-5 minutes
- No manual deployment needed!

---

## Next Steps

1. Push code to GitHub
2. Deploy backend on Railway
3. Deploy frontend on Vercel
4. Update environment URLs
5. Test everything
6. Share your site! 🚀
