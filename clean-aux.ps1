# # PowerShell script to clean LaTeX auxiliary files
# # Run this when you want to clean up your project folder

# Write-Host "Cleaning LaTeX auxiliary files..." -ForegroundColor Green

# # List of auxiliary file extensions to remove (PRESERVING files needed for bibliography)
# $extensions = @(
#     "*.blg", "*.fdb_latexmk", "*.fls",
#     "*.glg", "*.glo", "*.gls", "*.idx", "*.ilg", "*.ind", "*.lof", 
#     "*.log", "*.lot", "*.nav", "*.snm", 
#     "*.vrb", "*.xdv", "*.acr", "*.acn", 
#     "*.alg", "*.glsdefs", "*.ist"
# )

# # IMPORTANT: We preserve these files for bibliography and cross-references:
# # *.aux (needed by biber), *.bbl (bibliography output), *.bcf (biber control file)
# # *.run.xml (biber control file), *.out (hyperref), *.synctex.gz (sync), *.toc (table of contents)

# $removedCount = 0

# foreach ($ext in $extensions) {
#     $files = Get-ChildItem -Recurse -Filter $ext -ErrorAction SilentlyContinue
#     foreach ($file in $files) {
#         Write-Host "Removing: $($file.Name)" -ForegroundColor Yellow
#         Remove-Item $file.FullName -Force
#         $removedCount++
#     }
# }

# if ($removedCount -eq 0) {
#     Write-Host "No auxiliary files found to clean." -ForegroundColor Blue
# } else {
#     Write-Host "Cleaned $removedCount auxiliary files." -ForegroundColor Green
# }

# Write-Host "Done!" -ForegroundColor Green
