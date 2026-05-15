---
noteId: "11bce7309a4c11f0b2c731debbcefd2b"
tags: []
---

# Dark Theme Implementation Guide

## Overview

This LaTeX resume supports both light and dark themes through a configurable color system. The implementation uses conditional compilation to switch between color schemes.

## How It Works

### 1. **Theme Configuration**

The theme is controlled by a simple command definition:

```latex
% Theme Configuration
% Uncomment the next line to enable dark theme
% \newcommand{\darktheme}{}
```

- **Light Theme (Default)**: Comment out or remove the `\newcommand{\darktheme}{}` line
- **Dark Theme**: Uncomment the `\newcommand{\darktheme}{}` line

### 2. **Color System**

The implementation uses conditional color definitions:

```latex
\ifdefined\darktheme
    % Dark Theme Colors
    \definecolor{primaryColor}{RGB}{255, 255, 255} % White text
    \definecolor{backgroundColor}{RGB}{33, 37, 41} % Dark background
    \definecolor{sectionColor}{RGB}{255, 255, 255} % White sections
    \definecolor{accentColor}{RGB}{64, 162, 255} % Bright blue accent
    \definecolor{textColor}{RGB}{248, 249, 250} % Light text
    \definecolor{subtextColor}{RGB}{173, 181, 189} % Muted text
\else
    % Light Theme Colors (Default)
    \definecolor{primaryColor}{RGB}{0, 0, 0} % Black text
    \definecolor{backgroundColor}{RGB}{255, 255, 255} % White background
    \definecolor{sectionColor}{RGB}{0, 0, 0} % Black sections
    \definecolor{accentColor}{RGB}{0, 0, 139} % Dark blue accent
    \definecolor{textColor}{RGB}{0, 0, 0} % Black text
    \definecolor{subtextColor}{RGB}{64, 64, 64} % Dark gray text
\fi
```

### 3. **Background Application**

For dark theme, the page background and text color are automatically applied:

```latex
\ifdefined\darktheme
    \pagecolor{backgroundColor}
    \color{textColor}
\fi
```

## Color Scheme Details

### Light Theme (Default)

- **Background**: White (#FFFFFF)
- **Primary Text**: Black (#000000)
- **Section Headers**: Black (#000000)
- **Accent/Links**: Dark Blue (#00008B)
- **Subtext**: Dark Gray (#404040)

### Dark Theme

- **Background**: Dark Gray (#212529)
- **Primary Text**: White (#FFFFFF)
- **Section Headers**: White (#FFFFFF)
- **Accent/Links**: Bright Blue (#40A2FF)
- **Subtext**: Light Gray (#ADB5BD)

## File Structure

```
resume-latex/
├── resume.tex          # Light theme (default)
├── resume-dark.tex     # Dark theme version
├── README.md          # Documentation
└── DARK_THEME_GUIDE.md # This guide
```

## Usage Instructions

### Method 1: Toggle in Existing File

1. Open `resume.tex`
2. Find the line: `% \newcommand{\darktheme}{}`
3. **For Dark Theme**: Remove the `%` to uncomment: `\newcommand{\darktheme}{}`
4. **For Light Theme**: Add `%` to comment: `% \newcommand{\darktheme}{}`
5. Compile the LaTeX file

### Method 2: Use Separate Files

- **Light Theme**: Use `resume.tex` (default)
- **Dark Theme**: Use `resume-dark.tex` (pre-configured for dark theme)

## Compilation

### Command Line

```bash
# Light theme
pdflatex resume.tex

# Dark theme
pdflatex resume-dark.tex
```

### LaTeX Editors

- Open the desired file (`resume.tex` or `resume-dark.tex`)
- Compile using your editor's build function

### Online (Overleaf)

1. Upload both files to your Overleaf project
2. Select the desired theme file as your main document
3. Compile

## Customization

### Adding New Colors

To add new colors to the theme system:

```latex
\ifdefined\darktheme
    \definecolor{newColor}{RGB}{dark_r, dark_g, dark_b}
\else
    \definecolor{newColor}{RGB}{light_r, light_g, light_b}
\fi
```

### Modifying Existing Colors

Update the RGB values in the color definitions:

```latex
% Example: Change accent color
\ifdefined\darktheme
    \definecolor{accentColor}{RGB}{255, 0, 0} % Red accent for dark theme
\else
    \definecolor{accentColor}{RGB}{139, 0, 0} % Dark red for light theme
\fi
```

### Using Colors in Content

Apply colors to text using the defined color names:

```latex
{\color{primaryColor}Your Text Here}
{\color{accentColor}Accent Text}
{\color{subtextColor}Muted Text}
```

## Advanced Features

### Conditional Formatting

You can apply different formatting based on the theme:

```latex
\ifdefined\darktheme
    % Dark theme specific formatting
    \setlength{\fboxsep}{2pt}
    \fcolorbox{accentColor}{backgroundColor}{Dark Theme Box}
\else
    % Light theme specific formatting
    \fcolorbox{black}{white}{Light Theme Box}
\fi
```

### Theme-Specific Content

Include different content for different themes:

```latex
\ifdefined\darktheme
    \textit{Optimized for dark mode viewing}
\else
    \textit{Standard light theme version}
\fi
```

## Technical Notes

### Required Packages

- `xcolor`: For color definitions and management
- `pagecolor`: For setting page background color
- `ifthen`: For conditional statements (already included)

### ATS Compatibility

Both themes maintain full ATS compatibility:

- Text remains selectable and parseable
- Color changes don't affect text structure
- PDF metadata remains consistent

### Print Compatibility

- **Light Theme**: Optimized for printing (black text on white)
- **Dark Theme**: May consume more ink/toner when printed
- Consider using light theme for printed versions

## Troubleshooting

### Common Issues

1. **Colors Not Changing**

   - Ensure you've uncommented `\newcommand{\darktheme}{}`
   - Check that the file compiles without errors
   - Clear LaTeX cache and recompile

2. **Background Not Applied**

   - Verify `pagecolor` package is loaded
   - Check for conflicting color packages
   - Ensure `\pagecolor{backgroundColor}` is called

3. **Links Not Visible**
   - Adjust `accentColor` values for better contrast
   - Test link visibility in PDF viewer
   - Consider using different colors for better readability

### Best Practices

1. **Test Both Themes**: Always verify your changes work in both light and dark modes
2. **Contrast Checking**: Ensure sufficient contrast between text and background
3. **Consistent Updates**: When modifying content, update both theme versions
4. **PDF Testing**: Test the final PDF in different viewers and devices

## Future Enhancements

Potential improvements to the theme system:

- Additional color themes (blue, green, etc.)
- Automatic theme detection based on system preferences
- Theme-specific fonts or styling
- Gradient backgrounds or advanced styling options
