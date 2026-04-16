# CSPF Retreat 2026 — slides

Slides are written in **Markdown** using [Marp](https://marp.app/). The HTML deck is built in CI and hosted on **GitHub Pages**.

## Edit locally

**Option A — VS Code (easiest preview)**  

1. Install the extension **“Marp for VS Code”**.  
2. Open `slides.md`.  
3. Use the Marp preview pane to see slides while you edit.

**Option B — Command line**

From the repo root:

```bash
./bin/build.sh
```

If your shell says “Permission denied”, run `chmod +x bin/build.sh` once or use `bash bin/build.sh`.

Open `dist/index.html` in a browser. This runs the same steps as CI (`bin/build.sh`).

Optional local server:

```bash
npx @marp-team/marp-cli@latest slides.md -o dist/index.html --server
```

---

## Publish on GitHub (GitHub Pages)

### 1. Create the repository on GitHub

- New repository: name it **`cspf-retreat-2026`** (or your preferred name).  
- Do **not** add a README/license on GitHub if you already have files locally (avoids a merge conflict).  
- Copy the remote URL (HTTPS or SSH).

### 2. Push this folder from your machine

```bash
cd /path/to/cspf-retreat-2026
git init
git add .
git commit -m "chore: add Marp slides and GitHub Pages workflow"
git branch -M main
git remote add origin git@github.com:YOUR_USER_OR_ORG/cspf-retreat-2026.git
git push -u origin main
```

Replace `YOUR_USER_OR_ORG` and the remote URL with yours.

### 3. Enable GitHub Pages (Actions as source)

On GitHub: **Repository → Settings → Pages**

- Under **Build and deployment → Source**, choose **GitHub Actions** (not “Deploy from a branch”).

You do **not** need to pick a branch/folder manually; the workflow in `.github/workflows/deploy-pages.yml` will deploy the built site.

### 4. Wait for the workflow

- **Actions** tab → open **Deploy to GitHub Pages** → confirm the run is green.

First deploy can take a minute or two.

### 5. Open the site

Default URL:

```text
https://YOUR_USER_OR_ORG.github.io/cspf-retreat-2026/
```

If the repo is under an organization, use that org name in the URL.

### 6. Future updates

Edit `slides.md`, commit, and push to `main`. The site rebuilds automatically.

---

## Marp tips

- `---` separates slides.  
- Frontmatter at the top of `slides.md` sets theme, pagination, aspect ratio — see [Marp documentation](https://marp.app/#docs).  
- Put image files in the **`images/`** directory at the repo root (e.g. `images/photo.png`). In `slides.md`, reference them with a path relative to that file: `![Caption](images/photo.png)`. The deploy workflow copies `images/` into `dist/` so they load on GitHub Pages. Use **`images/...`**, not `../images/...` — on a project site (`/repo-name/`), `..` in the URL escapes the repo path and breaks images on GitHub Pages while local preview may still look fine.
