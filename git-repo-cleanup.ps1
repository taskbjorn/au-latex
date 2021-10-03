# GIT-REPO-CLEAN.PS1
# Removes all extra files from the AU-LaTeX repository when using `git clone`
# Must be run from the root of the Git repository!

# Remove repository files
Remove-Item -Force -Path .\extras -Recurse
Remove-Item -Force -Path .\screenshots -Recurse
Remove-Item -Force -Path .\output -Recurse
Remove-Item -Force -Path .\build -Recurse
Remove-Item -Force -Path .\assets\listings -Recurse
Remove-Item -Force -Path README.md
Remove-Item -Force -Path LICENSE

# Remove example sections and bibliography entries
Remove-Item -Force -Path .\content\*  -Recurse
Clear-Content -Path .\bibliography.bib

# Re-initialise git repository
if (Test-Path .git) {
    Remove-Item .git -Recurse
}
git init

# Remove the script
Remove-Item -Force -LiteralPath $MyInvocation.MyCommand.Path
