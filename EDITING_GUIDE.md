# Resume Editing Guide for Non-Technical Users

Welcome! This guide will help you easily update your resume without needing to understand complex LaTeX code.

## 📁 File Structure

Your resume is now split into two files:

- **`resume-content.tex`** - ✅ **EDIT THIS FILE** - Contains all your personal information, experiences, projects, and skills
- **`resume.tex`** - ❌ **DO NOT EDIT** - Contains the formatting and styling code

## 🎯 How to Edit Your Resume

### Step 1: Open the Content File

Open the file called `resume-content.tex` in any text editor (Notepad, VS Code, etc.)

### Step 2: Find What You Want to Change

The file is organized into clear sections with helpful comments:

```latex
% ============================================================
% PERSONAL INFORMATION
% ============================================================
```

### Step 3: Edit Only the Text Between Curly Braces `{ }`

**Important Rule:** Only edit the text between the curly braces `{ }`. Do NOT change the commands (words starting with `\`).

## 📝 Examples

### Example 1: Changing Your Name

**CORRECT ✅**

```latex
\newcommand{\myName}{John Smith}
```

**WRONG ❌**

```latex
\newcommand{\yourName}{John Smith}  % Don't change "myName"
```

### Example 2: Updating Your Email

**CORRECT ✅**

```latex
\newcommand{\myEmail}{newemail@example.com}
```

### Example 3: Changing Your Phone Number

**CORRECT ✅**

```latex
\newcommand{\myPhone}{+1234567890}
```

## 💼 Editing Work Experience

Work experiences are stored in a list format. Each experience is separated by `|||` (three pipe symbols).

**Structure of each experience:**

```latex
{Job Title}%
{Company Name}%
{Date Range}%
{%
    \item Achievement 1
    \item Achievement 2
    \item Achievement 3
}%
|||%
```

**To ADD a new experience:**

1. Find the `\newcommand{\experienceList}{%` section
2. Scroll to the end (before the closing `}`)
3. Add `|||%` on a new line after the last experience
4. Copy and paste this template:

```latex
{Your Job Title}%
{Company Name}%
{Start Date - End Date}%
{%
    \item Your first achievement or responsibility
    \item Your second achievement or responsibility
}%
|||%
```

**To EDIT an experience:**
Simply find the experience block and change the text between `{ }`. Keep the `%` signs at the end of each line.

**To REMOVE an experience:**
Delete the entire block (5 lines including the `|||%` separator).

**Example:**

```latex
\newcommand{\experienceList}{%
    {Software Developer}%
    {Google}%
    {Jan 2024 - Present}%
    {%
        \item Built scalable web applications
        \item Led a team of 5 developers
    }%
    |||%
    {Junior Developer}%
    {Microsoft}%
    {Jun 2022 - Dec 2023}%
    {%
        \item Developed mobile applications
        \item Improved code performance by 30\%
    }%
}
```

## 🚀 Editing Projects

Projects work the same way as experiences, stored in a list format separated by `|||` (three pipe symbols).

**Structure of each project:**

```latex
{Date or Date Range}%
{GitHub Link or Website URL}%
{Project Title}%
{Project description goes here in one paragraph}%
|||%
```

**To ADD a new project:**

1. Find the `\newcommand{\projectsList}{%` section
2. Scroll to the end (before the closing `}`)
3. Add `|||%` on a new line after the last project
4. Add your project:

```latex
{Sep 2025}%
{https://github.com/username/project-name}%
{My Awesome Project}%
{Built an amazing application that does XYZ using technologies ABC.}%
|||%
```

**To EDIT a project:**
Find the project block and change the text between `{ }`. Keep the `%` signs.

**To REMOVE a project:**
Delete the entire block (5 lines including the `|||%` separator).

**Example:**

```latex
\newcommand{\projectsList}{%
    {Jun 2025}%
    {https://github.com/user/app}%
    {Mobile Shopping App}%
    {Developed a Flutter-based shopping app with 10K+ downloads.}%
    |||%
    {Mar 2025}%
    {https://mywebsite.com}%
    {Portfolio Website}%
    {Created a responsive portfolio website using React and TypeScript.}%
}
```

## 🛠️ Editing Skills

Skills are organized into categories. Simply edit the text between the curly braces:

```latex
\newcommand{\programmingLanguages}{Python, JavaScript, Java, C++}
```

**To add a new skill:**

```latex
\newcommand{\programmingLanguages}{Python, JavaScript, Java, C++, TypeScript}
```

Just add a comma and the new skill!

**To remove a skill:**
Delete it and its preceding comma:

```latex
\newcommand{\programmingLanguages}{Python, JavaScript, C++}  % Removed Java
```

## 📋 Quick Reference Table

| What You Want to Change | Where to Find It                           | What to Edit                 |
| ----------------------- | ------------------------------------------ | ---------------------------- | --- | --- | --- |
| Name                    | `\newcommand{\myName}{...}`                | Text between `{ }`           |
| Email                   | `\newcommand{\myEmail}{...}`               | Text between `{ }`           |
| Phone                   | `\newcommand{\myPhone}{...}`               | Text between `{ }`           |
| Experience              | Inside `\newcommand{\experienceList}{...}` | 5-line blocks separated by ` |     |     | %`  |
| Project                 | Inside `\newcommand{\projectsList}{...}`   | 5-line blocks separated by ` |     |     | %`  |
| Skills                  | `\newcommand{\programmingLanguages}{...}`  | Text between `{ }`           |

## ⚠️ Important Rules

1. **DO NOT** change command names (the part after `\newcommand`)
2. **DO NOT** delete the `\newcommand` part
3. **DO NOT** change anything in `resume.tex` (the main file)
4. **ALWAYS** keep the curly braces `{ }` intact
5. **ALWAYS** keep the `%` signs at the end of each line in experience/project lists
6. **USE** `|||%` (three pipe symbols followed by %) to separate different experiences or projects
7. **USE** `\item` for each bullet point in experiences

## 🔍 Common Mistakes to Avoid

❌ **Wrong:**

```latex
\newcommand{\myName}John Smith  % Missing curly braces
```

✅ **Correct:**

```latex
\newcommand{\myName}{John Smith}
```

---

❌ **Wrong (Experiences):**

```latex
{Software Developer}  % Missing % at the end
{Google}
{Jan 2024 - Present}
{
    \item Built apps
}
```

✅ **Correct (Experiences):**

```latex
{Software Developer}%
{Google}%
{Jan 2024 - Present}%
{%
    \item Built apps
}%
|||%
```

---

❌ **Wrong (Projects):**

```latex
{Jun 2025}%
{https://github.com/user/app}%
{My App}%
{Great description}
% Missing |||%
{Mar 2025}%
```

✅ **Correct (Projects):**

```latex
{Jun 2025}%
{https://github.com/user/app}%
{My App}%
{Great description}%
|||%
{Mar 2025}%
{https://github.com/user/app2}%
{My App 2}%
{Another description}%
|||%
```

## 🎨 Formatting Tips

### Making Text Bold

To make specific words bold within your descriptions, wrap them with `\textbf{...}`:

```latex
Developed a \textbf{cross-platform mobile app} using Flutter.
```

### Adding Multiple Experiences or Projects

Simply add more blocks to the list! Each block must be separated by `|||%`.

**For experiences:**

```latex
\newcommand{\experienceList}{%
    {Job 1}%
    {Company 1}%
    {Date 1}%
    {%
        \item Achievement
    }%
    |||%
    {Job 2}%
    {Company 2}%
    {Date 2}%
    {%
        \item Achievement
    }%
    |||%
    {Job 3}%  ← Add as many as you need!
    {Company 3}%
    {Date 3}%
    {%
        \item Achievement
    }%
}
```

**For projects:**

```latex
\newcommand{\projectsList}{%
    {Date 1}%
    {Link 1}%
    {Title 1}%
    {Description 1}%
    |||%
    {Date 2}%
    {Link 2}%
    {Title 2}%
    {Description 2}%
    |||%
    {Date 3}%  ← Add unlimited projects!
    {Link 3}%
    {Title 3}%
    {Description 3}%
}
```

## 🆘 Getting Help

If something goes wrong:

1. **Don't panic!**
2. You can always undo your changes (Ctrl+Z / Cmd+Z)
3. If the PDF doesn't compile, check that:
   - All curly braces `{ }` are paired
   - You didn't accidentally delete a `\` or command name
   - You didn't edit the wrong file (`resume.tex`)

## 🎉 You're Ready!

Now you can update your resume anytime by simply:

1. Opening `resume-content.tex`
2. Changing the text between `{ }`
3. Saving the file
4. Compiling the LaTeX (or having someone compile it for you)

**Remember:** Only edit `resume-content.tex`, never touch `resume.tex`!

---

**Pro Tip:** Before making major changes, save a backup copy of your `resume-content.tex` file!
