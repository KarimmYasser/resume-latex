# LaTeX Resume - Karim Yasser

A professional, ATS-optimized resume built with LaTeX, designed for software engineering and computer science positions.

## 📋 Overview

This repository contains my professional resume created using LaTeX, optimized for:

- **ATS (Applicant Tracking System) compatibility**
- **Clean, professional formatting**
- **Easy customization and maintenance**
- **Consistent typography and layout**

## 🚀 Features

- **ATS-Optimized**: Uses standard section headers and formatting that ATS systems can easily parse
- **Professional Design**: Clean, modern layout with proper spacing and typography
- **Dark Mode Support**: Toggle between light and dark themes for modern viewing preferences
- **Comprehensive Sections**: Includes Summary, Education, Experience, Projects, Technical Skills, and Core Competencies
- **Keyword-Rich**: Contains relevant technical keywords for better searchability
- **Quantified Achievements**: Includes metrics and specific accomplishments
- **Easy to Customize**: Well-structured LaTeX code for easy updates

## 🌙 Dark Mode Feature

This resume now supports both **light** and **dark** themes! Perfect for modern viewing preferences and digital portfolios.

### Theme Options

| Theme               | Background | Text Color | Accent Color | Best For                           |
| ------------------- | ---------- | ---------- | ------------ | ---------------------------------- |
| **Light** (Default) | White      | Black      | Dark Blue    | Printing, traditional viewing      |
| **Dark**            | Dark Gray  | White      | Bright Blue  | Digital viewing, modern portfolios |

### How to Use Dark Mode

#### Method 1: Toggle in Existing File

1. Open `resume.tex`
2. Find this line: `% \newcommand{\darktheme}{}`
3. **Enable Dark Mode**: Remove the `%` → `\newcommand{\darktheme}{}`
4. **Disable Dark Mode**: Add `%` → `% \newcommand{\darktheme}{}`
5. Compile the LaTeX file

#### Method 2: Use Separate Files

- **Light Theme**: Use `resume.tex` (default)
- **Dark Theme**: Use `resume-dark.tex` (pre-configured)

### Compilation Examples

```bash
# Light theme (default)
pdflatex resume.tex

# Dark theme (pre-configured)
pdflatex resume-dark.tex
```

### Color Scheme Details

The dark theme uses carefully chosen colors for optimal readability:

```latex
% Dark Theme Colors
\definecolor{primaryColor}{RGB}{255, 255, 255}    % White text
\definecolor{backgroundColor}{RGB}{33, 37, 41}     % Dark background
\definecolor{sectionColor}{RGB}{255, 255, 255}     % White sections
\definecolor{accentColor}{RGB}{64, 162, 255}       % Bright blue accent
\definecolor{subtextColor}{RGB}{173, 181, 189}     % Light gray subtext
```

### Benefits of Dark Mode

✅ **Modern Appearance**: Professional dark theme for digital portfolios  
✅ **Eye-Friendly**: Reduces eye strain during digital viewing  
✅ **Distinctive**: Stands out from traditional resumes  
✅ **ATS Compatible**: Maintains full compatibility with tracking systems  
✅ **Print Ready**: Light theme available for printing needs

## 📁 Repository Structure

```
resume-latex/
├── resume.tex              # Light theme resume (default)
├── resume-dark.tex         # Dark theme resume (pre-configured)
├── README.md              # Main documentation
├── DARK_THEME_GUIDE.md    # Detailed dark theme implementation guide
└── .gitignore             # Git ignore file for LaTeX build artifacts
```

## 🛠 Prerequisites

To compile this resume, you need:

- **LaTeX Distribution**:
  - Windows: [MiKTeX](https://miktex.org/) or [TeX Live](https://www.tug.org/texlive/)
  - macOS: [MacTeX](https://www.tug.org/mactex/)
  - Linux: TeX Live (usually available in package managers)
- **Required Packages**: The following LaTeX packages are used:
  - `geometry` - Page layout
  - `titlesec` - Section formatting
  - `tabularx` - Tables
  - `xcolor` - Colors and color management
  - `pagecolor` - Background color support (for dark theme)
  - `enumitem` - Lists
  - `fontawesome5` - Icons
  - `hyperref` - Links
  - `charter` - Font

## 🔧 How to Compile

### Method 1: Command Line

```bash
pdflatex resume.tex
```

### Method 2: LaTeX Editor

- Open `resume.tex` in your preferred LaTeX editor (TeXstudio, Overleaf, etc.)
- Compile using the editor's build function

### Method 3: Online (Overleaf)

1. Upload `resume.tex` to [Overleaf](https://www.overleaf.com/)
2. Compile online without local setup

## 📝 Customization Guide

### Personal Information

Update the header section with your details:

```latex
\begin{header}
\fontsize{25 pt}{25 pt}\selectfont Your Name
% Update contact information below
```

### Experience Section

Add new positions using the two-column entry format:

```latex
\begin{twocolentry}{
Start Date - End Date
}
\textbf{\large Job Title} - Company Name
\end{twocolentry}

\begin{onecolentry}
\begin{highlights}
\item Your achievement or responsibility
\item Another bullet point with quantified results
\end{highlights}
\end{onecolentry}
```

### Technical Skills

Update the skills section with your technologies:

```latex
\item \textbf{Programming Languages:} Your languages here
\item \textbf{Frameworks \& Libraries:} Your frameworks here
```

### Projects

Add projects with links:

```latex
\begin{twocolentry}{
\mbox{Date | \hrefWithoutArrow{https://github.com/your-repo}{GitHub}}%
}
\textbf{Project Name}
\end{twocolentry}
```

## 🎯 ATS Optimization Features

This resume is optimized for ATS systems with:

- **Standard section headers** (Summary, Experience, Education, etc.)
- **Consistent date formats** (Mon YYYY - Mon YYYY)
- **Clean contact information** without excessive formatting
- **Keyword-rich content** with industry-standard terminology
- **Proper hierarchy** using LaTeX sections and subsections
- **Quantified achievements** with specific metrics

## 📊 Sections Included

1. **Summary** - Professional overview with key skills and experience
2. **Education** - Academic background with relevant coursework
3. **Experience** - Professional experience with achievements and technologies
4. **Projects** - Key projects with links and technical details
5. **Technical Skills** - Comprehensive list of programming languages, frameworks, and tools
6. **Core Competencies** - Professional skills and methodologies

## 🔍 Keywords Included

The resume includes relevant keywords for software engineering positions:

- Programming languages (Dart, Flutter, Kotlin, Python, etc.)
- Frameworks and technologies (Android, iOS, React, etc.)
- Methodologies (Agile, Scrum, MVVM, Clean Architecture)
- Tools (Git, GitHub, Docker, etc.)
- Concepts (API Integration, Database Design, Machine Learning)

## 📱 Contact Information

The resume includes optimized contact information:

- **Location**: Cairo, Egypt
- **Email**: karimmyasserr@gmail.com
- **Phone**: +201144432284
- **LinkedIn**: [linkedin.com/in/karimmyasserr](https://www.linkedin.com/in/karimmyasserr/)
- **GitHub**: [github.com/KarimmYasser](https://github.com/KarimmYasser)
- **Portfolio**: [karim-yasser.vercel.app](https://karim-yasser.vercel.app)

## 📋 TODO / Future Improvements

- [x] ~~Add dark theme version~~ ✅ **Completed!**
- [ ] Create multiple format variations (1-page, 2-page)
- [ ] Add automated CI/CD for PDF generation
- [ ] Create template version for others to use
- [ ] Add multi-language support
- [ ] Add additional color themes (blue, green, purple)
- [ ] Create theme preview images for documentation
- [ ] Add automatic theme detection based on system preferences
- [ ] Implement gradient backgrounds for premium themes

## 🤝 Contributing

If you have suggestions for improvements or find any issues:

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Submit a pull request

## ➕ Additional Documentation

For detailed information about the dark theme implementation, color customization, and advanced features, see:

- **[DARK_THEME_GUIDE.md](DARK_THEME_GUIDE.md)** - Comprehensive guide to dark theme features and customization

## 📄 License

This resume template is available under the MIT License. Feel free to use it as a template for your own resume.

## 📞 Contact

If you have any questions about this resume or want to connect:

- **Email**: karimmyasserr@gmail.com
- **LinkedIn**: [Karim Yasser](https://www.linkedin.com/in/karimmyasserr/)
- **GitHub**: [@KarimmYasser](https://github.com/KarimmYasser)

---

**Last Updated**: September 2025
