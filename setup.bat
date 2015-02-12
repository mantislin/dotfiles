@echo off
setlocal

if not exist "%dotfiles%" "" set "dotfiles=%~sdp0"

pushd "%dotfiles%"

set "extfiles="
set "extfiles=%extfiles%:%~nx0"
set "extfiles=%extfiles%:setup.command"
set "extfiles=%extfiles%:.DS_Store"
set "extfiles=%extfiles%:Thumbs.db"
set "extfiles=%extfiles%:.git"
set "extfiles=%extfiles%:.gitignore"

for /f %%a in ('dir/b/a:-d') do (
    echo/%extfiles%|find /i "%%a" >nul 2>nul && (
        echo/%%a>nul
    ) || (
        echo/##### %%a
        echo/%%a
    )
)
for /f %%a in ('dir/b/a:d') do (
    echo/DIR: %%a
)

popd

endlocal
exit/b
