# CI/CD Setup Guide

This guide explains how to set up and use the automated CI/CD pipeline for LaTeX resume compilation.

## 🚀 Quick Start

The CI/CD pipeline is ready to use out of the box! Simply:

1. **Push changes** to your `main` branch
2. **Watch the magic** happen in [GitHub Actions](https://github.com/KarimmYasser/resume-latex/actions)
3. **Download PDFs** from the [latest release](https://github.com/KarimmYasser/resume-latex/releases/latest)

## 🔧 Pipeline Architecture

### Workflows

| Workflow       | File               | Trigger              | Purpose                  |
| -------------- | ------------------ | -------------------- | ------------------------ |
| **Main CI/CD** | `build-resume.yml` | Push to main, manual | Full build with releases |
| **PR Check**   | `pr-check.yml`     | Pull requests        | Quick validation         |

### Build Matrix

Both workflows compile multiple resume variants:

```yaml
strategy:
  matrix:
    theme:
      [
        { name: "light", file: "resume.tex", output: "resume-light.pdf" },
        { name: "dark", file: "resume-dark.tex", output: "resume-dark.pdf" },
      ]
```

## 📦 Artifacts & Releases

### Artifacts (Every Build)

- **Retention**: 90 days
- **Access**: GitHub Actions page
- **Format**: Separate artifacts per theme

### Releases (Main Branch Only)

- **Trigger**: Push to `main` branch
- **Naming**: `vYYYY.MM.DD-HHMM` (timestamp-based)
- **Assets**: Both light and dark theme PDFs
- **Notes**: Auto-generated with commit history

## 🔍 Quality Checks

### PDF Validation

- **File integrity**: Validates PDF structure
- **Size check**: Ensures reasonable file size (50KB - 5MB)
- **Page count**: Validates 1-3 pages (typical for resumes)

### Build Status

- **Success indicators**: Green badges in README
- **Failure notifications**: Build logs with error details
- **PR validation**: Prevents broken merges

## 🛠 Customization

### Adding New Themes

1. **Create new .tex file**: e.g., `resume-blue.tex`
2. **Update workflow matrix**:
   ```yaml
   { name: "blue", file: "resume-blue.tex", output: "resume-blue.pdf" }
   ```

### Modifying Build Triggers

Edit `.github/workflows/build-resume.yml`:

```yaml
on:
  push:
    branches: [main, develop] # Add more branches
    paths:
      - "**.tex"
      - "**.cls" # Add more file types
```

### Custom LaTeX Packages

Add packages to the workflow:

```yaml
- name: 🔧 Setup LaTeX Environment
  uses: xu-cheng/latex-action@v3
  with:
    extra_system_packages: |
      py3-pygments
      your-custom-package
```

## 🚨 Troubleshooting

### Common Issues

#### Build Fails on LaTeX Errors

- **Check logs**: Go to Actions → Failed build → View logs
- **Local testing**: Test compilation locally first
- **Syntax errors**: Ensure valid LaTeX syntax

#### PDF Not Generated

- **File naming**: Ensure `.tex` files match workflow configuration
- **Permissions**: Check repository permissions for Actions

#### Release Not Created

- **Branch check**: Releases only trigger on `main` branch
- **Token permissions**: Ensure `GITHUB_TOKEN` has release permissions

### Debug Steps

1. **Local compilation test**:

   ```bash
   pdflatex resume.tex
   pdflatex resume-dark.tex
   ```

2. **Check workflow syntax**:

   ```bash
   # Use GitHub CLI or online YAML validators
   gh workflow view
   ```

3. **Manual trigger**:
   - Go to Actions → Workflow → "Run workflow"

## 📊 Monitoring

### Build Status Badges

The README includes status badges that show:

- [![📄 LaTeX Resume CI/CD](https://github.com/KarimmYasser/resume-latex/actions/workflows/build-resume.yml/badge.svg)](https://github.com/KarimmYasser/resume-latex/actions/workflows/build-resume.yml) Main build status
- [![🧪 PR Check](https://github.com/KarimmYasser/resume-latex/actions/workflows/pr-check.yml/badge.svg)](https://github.com/KarimmYasser/resume-latex/actions/workflows/pr-check.yml) PR validation status

### Performance Metrics

Typical build times:

- **LaTeX compilation**: ~30-60 seconds per theme
- **PDF validation**: ~5-10 seconds
- **Release creation**: ~10-20 seconds
- **Total pipeline**: ~2-3 minutes

## 🔒 Security

### Permissions

- **GITHUB_TOKEN**: Automatically provided, scoped to repository
- **No secrets required**: Pipeline uses only public actions
- **Read-only access**: No write access to external services

### Best Practices

- **No sensitive data**: Never include personal data in LaTeX comments
- **Public artifacts**: Remember that artifacts are visible to repository collaborators
- **Release assets**: Public releases mean public PDF access

## 🤝 Contributing

### For Contributors

1. **Fork** the repository
2. **Make changes** to `.tex` files or workflows
3. **Create PR** → Automatic validation runs
4. **Merge** → Automatic release with PDFs

### For Maintainers

- **Monitor builds**: Check Actions regularly
- **Update dependencies**: Keep GitHub Actions updated
- **Manage releases**: Clean up old releases if needed

## 📚 Advanced Features

### Conditional Builds

- **Path-based triggers**: Only runs on `.tex` file changes
- **Branch-specific**: Different behaviors for different branches
- **Manual dispatch**: Can be triggered manually

### Notifications

- **GitHub notifications**: Automatic for repository watchers
- **Email alerts**: Configure in GitHub notification settings
- **Slack/Discord**: Can be extended with webhook actions

## 🎯 Future Enhancements

Planned improvements:

- **Multi-language support**: Automatic translation detection
- **PDF optimization**: Compression and size reduction
- **Preview generation**: Thumbnail images for themes
- **Semantic versioning**: Proper version management
- **Deploy to GitHub Pages**: Online PDF viewer

---

**Need Help?** Check the [main README](README.md) or open an issue!
