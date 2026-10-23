#!/bin/bash
# Quick Deployment Checklist for E-Commerce Project

echo "=========================================="
echo "E-Commerce FREE Deployment Checklist"
echo "=========================================="
echo ""

# Step 1: GitHub Setup
echo "✅ Step 1: Push to GitHub"
echo "   □ Create GitHub account (github.com)"
echo "   □ Create new repository 'ecommerce'"
echo "   □ Run these commands:"
echo "     git init"
echo "     git add ."
echo "     git commit -m 'Initial commit'"
echo "     git remote add origin https://github.com/YOUR_USERNAME/ecommerce.git"
echo "     git push -u origin main"
echo ""

# Step 2: Railway Backend
echo "✅ Step 2: Deploy Backend on Railway"
echo "   □ Go to railway.app"
echo "   □ Sign up with GitHub"
echo "   □ New Project → Deploy from GitHub"
echo "   □ Select your ecommerce repo"
echo "   □ Railway auto-deploys"
echo "   □ Add MySQL database"
echo "   □ Copy Railway URL (something like: project.railway.app)"
echo ""

# Step 3: Railway Environment
echo "✅ Step 3: Configure Railway Environment Variables"
echo "   □ In Railway dashboard → Variables"
echo "   □ Add these environment variables:"
echo "      APP_ENV=production"
echo "      APP_DEBUG=false"
echo "      APP_KEY=(from your local .env)"
echo "      APP_URL=https://your-railway-url.railway.app"
echo "      DB_HOST=(Railway provides this)"
echo "      DB_DATABASE=railway"
echo "      DB_USERNAME=root"
echo "      DB_PASSWORD=(Railway provides this)"
echo "      FRONTEND_URL=https://your-vercel-frontend.vercel.app"
echo "      (More vars in DEPLOYMENT_GUIDE.md)"
echo ""

# Step 4: Vercel Frontend
echo "✅ Step 4: Deploy Frontend on Vercel"
echo "   □ Go to vercel.com"
echo "   □ Sign up with GitHub"
echo "   □ New Project → Import Git Repository"
echo "   □ Select your ecommerce repo"
echo "   □ Root Directory: ecommerce-frontend"
echo "   □ Add Environment Variable:"
echo "      VITE_API_URL=https://your-railway-backend.railway.app/api"
echo "   □ Deploy!"
echo ""

# Step 5: Verify
echo "✅ Step 5: Verify Everything Works"
echo "   □ Visit your Vercel frontend URL"
echo "   □ Check browser console (F12) for errors"
echo "   □ Test some API calls"
echo "   □ Verify authentication works"
echo ""

echo "=========================================="
echo "🎉 Your site is now LIVE!"
echo "=========================================="
echo ""
echo "📊 Cost: FREE"
echo "💾 Both platforms auto-deploy on git push"
echo "📚 Full guide: DEPLOYMENT_GUIDE.md"
