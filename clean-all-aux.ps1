# PowerShell script to completely clean ALL LaTeX auxiliary files
# Run this for a complete clean build (removes everything including TOC, bibliography, etc.)

Write-Host "Performing COMPLETE cleanup of LaTeX auxiliary files..." -ForegroundColor Red

# List of ALL auxiliary file extensions to remove
$extensions = @(
    "*.aux", "*.bbl", "*.bcf", "*.blg", "*.fdb_latexmk", "*.fls",
    "*.glg", "*.glo", "*.gls", "*.idx", "*.ilg", "*.ind", "*.lof", 
    "*.log", "*.lot", "*.nav", "*.out", "*.run.xml", "*.snm", 
    "*.synctex.gz", "*.toc", "*.vrb", "*.xdv", "*.acr", "*.acn", 
    "*.alg", "*.glsdefs", "*.ist"
)

$removedCount = 0

foreach ($ext in $extensions) {
    $files = Get-ChildItem -Recurse -Filter $ext -ErrorAction SilentlyContinue
    foreach ($file in $files) {
        Write-Host "Removing: $($file.Name)" -ForegroundColor Yellow
        Remove-Item $file.FullName -Force
        $removedCount++
    }
}

if ($removedCount -eq 0) {
    Write-Host "No auxiliary files found to clean." -ForegroundColor Blue
} else {
    Write-Host "COMPLETELY cleaned $removedCount auxiliary files." -ForegroundColor Green
    Write-Host "Next compilation will rebuild everything from scratch." -ForegroundColor Cyan
}

Write-Host "Done!" -ForegroundColor Green
