# PowerShell script to clean LaTeX auxiliary files
# Run this when you want to clean up your project folder

Write-Host "Cleaning LaTeX auxiliary files..." -ForegroundColor Green

# List of auxiliary file extensions to remove (excluding essential files)
$extensions = @(
    "*.aux", "*.blg", "*.fdb_latexmk", "*.fls",
    "*.glg", "*.glo", "*.gls", "*.idx", "*.ilg", "*.ind", "*.lof", 
    "*.log", "*.lot", "*.nav", "*.run.xml", "*.snm", 
    "*.vrb", "*.xdv", "*.acr", "*.acn", 
    "*.alg", "*.glsdefs", "*.ist"
)

# Keep these files as they're needed for cross-references and bibliography:
# *.bbl, *.bcf, *.out, *.synctex.gz, *.toc

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
    Write-Host "Cleaned $removedCount auxiliary files." -ForegroundColor Green
}

Write-Host "Done!" -ForegroundColor Green
