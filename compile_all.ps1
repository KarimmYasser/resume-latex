$ErrorActionPreference = "Stop"

$out_dir = "d:\Documents\Resume\CVs"
if (-not (Test-Path $out_dir)) {
    New-Item -ItemType Directory -Path $out_dir
}

$main_resume = Get-Content "d:\Documents\Resume\resume.tex" -Raw
$files = Get-ChildItem -Path "d:\Documents\Resume\cv_content" -Filter "resume-content-*.tex"

$processes = @()

foreach ($file in $files) {
    $role = $file.Name.Replace("resume-content-", "").Replace(".tex", "")
    $temp_tex = "d:\Documents\Resume\temp_$role.tex"
    $temp_pdf = "d:\Documents\Resume\temp_$role.pdf"
    
    # Replace the input command
    $temp_main = $main_resume.Replace("\input{resume-content.tex}", "\input{cv_content/$($file.Name)}")
    Set-Content -Path $temp_tex -Value $temp_main
    
    Write-Host "Starting compilation for $role..."
    
    # Run pdflatex in the background asynchronously by using -PassThru and removing -Wait
    $proc = Start-Process -FilePath "pdflatex" -ArgumentList "-interaction=nonstopmode", $temp_tex -NoNewWindow -PassThru -RedirectStandardError "$temp_tex.err" -RedirectStandardOutput "$temp_tex.out"
    
    $processes += [PSCustomObject]@{
        Process = $proc
        Role = $role
        TempPdf = $temp_pdf
    }
}

Write-Host "`nWaiting for all 15 compilations to finish simultaneously..."
# Wait for all the parallel processes to complete
$processes | ForEach-Object { $_.Process | Wait-Process }
Write-Host "All compilations finished! Processing PDFs...`n"

foreach ($item in $processes) {
    if (Test-Path $item.TempPdf) {
        $words = $item.Role.Split('-')
        $formattedWords = $words | ForEach-Object { 
            $w = $_
            if ($w -eq 'ai') { 'AI' }
            elseif ($w -eq 'ml') { 'ML' }
            elseif ($w -eq 'cpp') { 'CPP' }
            else { $w.Substring(0,1).ToUpper() + $w.Substring(1) }
        }
        $formattedRole = $formattedWords -join '_'
        
        $out_pdf = Join-Path $out_dir "Karim_Yasser_${formattedRole}.pdf"
        Copy-Item -Path $item.TempPdf -Destination $out_pdf -Force
        Write-Host "Successfully compiled $formattedRole"
    } else {
        Write-Host "Failed to compile $($item.Role). Check log for errors."
    }
    
    # Remove temporary compilation files for this role
    Remove-Item "d:\Documents\Resume\temp_$($item.Role).*" -Force -ErrorAction SilentlyContinue
}
