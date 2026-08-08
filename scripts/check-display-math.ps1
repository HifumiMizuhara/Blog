$ErrorActionPreference = 'Stop'

$violations = Get-ChildItem -Path content -Recurse -Filter '*.md' | Where-Object {
    Select-String -Path $_.FullName -Pattern '^\$\$$' -Quiet
}

if ($violations) {
    $files = ($violations | ForEach-Object FullName) -join [Environment]::NewLine
    throw "Display math must keep both $$ delimiters on one line. This prevents Goldmark from interpreting a formula line such as '=' as a Markdown heading.`n$files"
}
