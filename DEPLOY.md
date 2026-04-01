# Deploying Mega X Holding Ltd. Website

Your website is ready to deploy! No build step required — just upload the folder.

## Option 1: Netlify (Easiest — Drag & Drop)

1. Go to [app.netlify.com](https://app.netlify.com)
2. Sign up or log in (free tier is plenty)
3. Drag your entire `megax/` project folder onto the deploy area
4. Done! Your site is live at a `.netlify.app` URL

**To set a custom domain:**
- Go to Domain Settings → Add custom domain
- Update your domain's DNS to point to Netlify

**To update your site later:**
- Just drag the updated folder again, or set up Git integration

## Option 2: Vercel

1. Install Vercel CLI: `npm i -g vercel`
2. In your project folder, run: `vercel`
3. Follow the prompts (accept defaults)
4. Your site is live!

Or use the web dashboard:
1. Go to [vercel.com](https://vercel.com)
2. Import your project from GitHub
3. Framework: "Other"
4. Deploy!

## Option 3: GitHub Pages (Free)

1. Create a new repository on GitHub
2. Push your project files:
   ```bash
   git init
   git add .
   git commit -m "Initial commit"
   git remote add origin https://github.com/YOUR_USERNAME/YOUR_REPO.git
   git push -u origin main
   ```
3. Go to repo Settings → Pages
4. Source: Deploy from a branch → `main` → `/ (root)`
5. Your site will be at `https://YOUR_USERNAME.github.io/YOUR_REPO/`

## Option 4: Cloudflare Pages

1. Push your project to a GitHub or GitLab repo
2. Go to [dash.cloudflare.com](https://dash.cloudflare.com) → Pages
3. Connect your repository
4. Build settings: leave everything empty (no build needed)
5. Deploy!

## Option 5: Manual Hosting (cPanel / FTP)

1. Log in to your hosting control panel
2. Navigate to File Manager → public_html
3. Upload all project files (maintaining folder structure)
4. Your site is live at your domain!

## File Structure

Make sure these files are at the root level of your upload:
- `index.html` (home page)
- `about.html` (company page)
- `contact.html` (contact page)
- `404.html` (error page)
- `styles/` folder (all CSS)
- `js/` folder (all JavaScript)
- `favicon.svg`

## Custom Domain Setup (General)

For any platform, you'll need to:
1. Buy a domain from a registrar (Namecheap, Cloudflare, etc.)
2. Point your domain's DNS records:
   - Usually an `A` record or `CNAME` pointing to your hosting provider
   - Each platform above provides specific DNS instructions in their dashboard
3. Wait for DNS propagation (usually 5-30 minutes, sometimes up to 48 hours)

## Testing Locally

Before deploying, you can test your site locally:

```bash
# Python
python3 -m http.server 8000

# Node.js
npx serve .
```

Then visit `http://localhost:8000`
