# Jorlin Yang

Personal site: https://thedaosheng.github.io

| File | What |
|---|---|
| `index.html` | Homepage (single file; styles and scripts inline) |
| `assets/` | Photos and compressed clips used by the homepage |
| `resume.html` | Résumé source (one page, Letter) |
| `Jorlin_Yang_Resume.pdf` | Exported résumé |

Re-export the PDF after editing `resume.html`:

```bash
"/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" --headless=new --no-pdf-header-footer --print-to-pdf=Jorlin_Yang_Resume.pdf resume.html
```
