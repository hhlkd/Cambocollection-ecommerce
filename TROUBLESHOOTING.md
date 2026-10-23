# 🔧 Deployment Troubleshooting Guide

## Backend Issues

### ❌ "502 Bad Gateway" or "503 Service Unavailable"
**Causes**: Laravel not starting, database not connected, missing dependencies

**Solutions**:
1. Check Railway logs: Railway Dashboard → Deployments → View Logs
2. Verify all environment variables are set
3. Ensure migrations ran (check logs for "migrating" messages)
4. Clear cache: Add this to Railway startup command
   ```
   php artisan config:clear && php artisan cache:clear
   ```

### ❌ "SQLSTATE[HY000]: General error: 2006 MySQL server has gone away"
**Cause**: Database connection lost

**Solutions**:
1. Verify DB_HOST, DB_USERNAME, DB_PASSWORD in Railway variables
2. Check Railway MySQL is running (Dashboard → Resources)
3. Restart deployment: Railway Dashboard → Redeploy

### ❌ "Class not found" or "File not found" errors
**Cause**: Composer dependencies not installed

**Solutions**:
```bash
# Ensure Procfile exists:
cat Procfile
# Should show: web: vendor/bin/heroku-php-apache2 public/

# Make sure composer.json is in root
cat composer.json
```

### ❌ "401 Unauthorized" on all API calls
**Cause**: CORS or authentication issue

**Solutions**:
1. Check CORS is properly configured:
   - FRONTEND_URL environment variable set
   - CORS config updated with your frontend URL
2. Check Sanctum configuration in `config/sanctum.php`
3. Verify session domain settings

---

## Frontend Issues

### ❌ Blank page on Vercel
**Causes**: Build failed, environment variables not set, API unreachable

**Solutions**:
1. Check Vercel build logs:
   - Vercel Dashboard → Project → Deployments → Build Logs
2. Verify `VITE_API_URL` is set correctly
3. Check browser console (F12) for JavaScript errors
4. Clear browser cache and hard refresh (Ctrl+Shift+R)

### ❌ "Cannot GET /" - 404 errors
**Cause**: Vercel not serving Vue app correctly

**Solutions**:
1. Check `vercel.json` exists in ecommerce-frontend root
2. Verify rewrites configuration:
   ```json
   {
     "rewrites": [
       {
         "source": "/(.*)",
         "destination": "/index.html"
       }
     ]
   }
   ```
3. Redeploy on Vercel

### ❌ API calls showing CORS errors
**Error**: `Access to XMLHttpRequest blocked by CORS policy`

**Solutions**:
1. Backend must have correct FRONTEND_URL set
2. Check backend CORS config includes your Vercel frontend URL
3. Verify backend is returning proper CORS headers:
   ```bash
   curl -i -H "Origin: https://your-vercel.vercel.app" \
        https://your-railway.railway.app/api/products
   # Should show: Access-Control-Allow-Origin: https://your-vercel.vercel.app
   ```

### ❌ "Cannot find module 'axios'" or dependency errors
**Cause**: Dependencies not installed during build

**Solutions**:
1. Verify `package.json` has all dependencies
2. Check build command in `vercel.json`:
   ```json
   "buildCommand": "npm run build"
   ```
3. Clear Vercel cache and redeploy:
   - Vercel Dashboard → Settings → Git → Redeploy

---

## Database Issues

### ❌ Migrations not running
**Cause**: `startCommand` not executing properly

**Solutions**:
1. Add this to Railway `startCommand`:
   ```json
   "startCommand": "php artisan migrate --force && php artisan cache:clear && vendor/bin/heroku-php-apache2 public/"
   ```
2. Check railway.json exists in backend root:
   ```bash
   cat railway.json
   ```

### ❌ "Unknown database 'ecommerce'"
**Cause**: Wrong database name in environment variables

**Solutions**:
1. Railway creates database named `railway` by default
2. Update DB_DATABASE in Railway variables:
   ```
   DB_DATABASE=railway
   ```
3. If you want custom name, create it first via Railway CLI or panel

---

## Common Environment Variable Issues

### Missing Variables Checklist
Make sure these are set in Railway:

```
✓ APP_NAME
✓ APP_ENV=production
✓ APP_DEBUG=false
✓ APP_KEY (from local .env, starts with base64:)
✓ APP_URL
✓ DB_CONNECTION=mysql
✓ DB_HOST
✓ DB_DATABASE
✓ DB_USERNAME
✓ DB_PASSWORD
✓ CACHE_DRIVER=database
✓ SESSION_DRIVER=database
✓ FRONTEND_URL
✓ GOOGLE_CLIENT_ID
✓ GOOGLE_CLIENT_SECRET
✓ GOOGLE_REDIRECT_URI
```

### Vercel Environment Variables

Make sure this is set:

```
✓ VITE_API_URL=https://your-railway-backend/api
```

---

## Quick Debugging Commands

### Test Backend is Running
```bash
curl https://your-railway-url.railway.app/api/products
# Should return JSON, not HTML error
```

### Check Frontend Can Reach Backend
Open browser console (F12) and run:
```javascript
fetch('https://your-railway-url.railway.app/api/products')
  .then(r => r.json())
  .then(d => console.log('Success!', d))
  .catch(e => console.error('Error:', e))
```

### View Railway Logs
```bash
# Using Railway CLI (install from railway.app/docs/cli)
railway logs -f
```

---

## Reset & Redeploy

If everything is broken, start fresh:

1. **Vercel**: Settings → Danger Zone → Delete Project
2. **Railway**: Delete deployment, redeploy from GitHub
3. **GitHub**: Make sure code is up to date
   ```bash
   git status
   git add .
   git commit -m "fix: deployment configs"
   git push
   ```

---

## Still Stuck?

1. Check [Railway Logs](https://railway.app) - usually shows exact error
2. Check [Vercel Logs](https://vercel.com/dashboard)
3. Open browser DevTools (F12) → Console tab for frontend errors
4. Test API separately: `curl your-backend/api/test`
5. Check all environment variables are set (typos break everything!)

