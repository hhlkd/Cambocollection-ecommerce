# 🚀 Deployment URLs & Credentials Tracker

**Fill in your actual URLs as you deploy:**

## GitHub
- Repository URL: `https://github.com/YOUR_USERNAME/ecommerce`
- Branch: `main`

## Railway Backend
- **Backend URL**: `https://[your-project].railway.app`
- **MySQL Host**: `[provided by Railway]`
- **MySQL Username**: `root`
- **MySQL Password**: `[provided by Railway]`
- **Database Name**: `railway`
- Railway Dashboard: `https://railway.app/project/[project-id]`

## Vercel Frontend
- **Frontend URL**: `https://ecommerce-frontend-[username].vercel.app`
- Vercel Dashboard: `https://vercel.com/dashboard`

## Important Environment Variables

### Backend (.env on Railway)
```
APP_URL=https://[your-railway-url].railway.app
APP_KEY=[from local .env - starts with base64:]
FRONTEND_URL=https://[your-vercel-url].vercel.app
DB_HOST=[Railway MySQL host]
DB_PASSWORD=[Railway MySQL password]
GOOGLE_REDIRECT_URI=https://[your-railway-url].railway.app/auth/google/callback
```

### Frontend (.env on Vercel)
```
VITE_API_URL=https://[your-railway-url].railway.app/api
```

---

## Deployment Status Checklist

- [ ] GitHub repo created and code pushed
- [ ] Railway backend deployed
- [ ] Railway MySQL database added
- [ ] Railway environment variables configured
- [ ] Backend migrations ran successfully
- [ ] Vercel frontend deployed
- [ ] Vercel environment variables configured
- [ ] Frontend builds successfully
- [ ] API calls working (test in browser console)
- [ ] Authentication working
- [ ] Database operations working

---

## Testing URLs

Once live, test these:

1. **Frontend**: `https://[your-vercel-url].vercel.app`
2. **API**: `https://[your-railway-url].railway.app/api/products`
3. **Health Check**: `https://[your-railway-url].railway.app/api/health` (if configured)

---

## Support Links

- [Railway Docs](https://docs.railway.app)
- [Vercel Docs](https://vercel.com/docs)
- [Laravel Deployment](https://laravel.com/docs/11.x/deployment)
- [Vue Deployment](https://vuejs.org/guide/ssr/deployment.html)

