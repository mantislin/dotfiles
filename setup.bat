@echo off
setlocal

if not exist "%dotfiles%" set "dotfiles=%~dp0"

pushd "%dotfiles%" || (
    echo/System cannot find "%dotfiles%".
    goto :eof
)

set "extfiles=%~nx0"

set "extfiles=%extfiles%:.git"
rem set "extfiles=%extfiles%:bin"

set "extfiles=%extfiles%:.DS_Store"
set "extfiles=%extfiles%:.gitignore"
rem set "extfiles=%extfiles%:.zshrc"
rem set "extfiles=%extfiles%:.gemrc"
rem set "extfiles=%extfiles%:.bashrc"
rem set "extfiles=%extfiles%:.bash_profile"
set "extfiles=%extfiles%:setup.command"
set "extfiles=%extfiles%:Thumbs.db"

for /f %%a in ('dir/b/a:d "%dotfiles%"') do (
    echo/%extfiles%|find /i "%%a" >nul 2>nul && (
        echo/%%a>nul
    ) || (
        echo/
        echo/########## %%a ##########
        if "%%a" == ".vimperator" (
            mklink /j "%userprofile%\vimperator" "%dotfiles%\%%a"
        ) else (
            mklink /j "%userprofile%\%%a" "%dotfiles%\%%a"
        )
    )
)
for /f %%a in ('dir/b/a:-d "%dotfiles%"') do (
    echo/%extfiles%|find /i "%%a" >nul 2>nul && (
        echo/%%a>nul
    ) || (
        echo/
        echo/########## %%a ##########
        if "%%a" == "vimrc" (
            mklink "%userprofile%\_vimrc" "%dotfiles%\%%a"
        ) else (
            mklink "%userprofile%\%%a" "%dotfiles%\%%a"
        )
    )
)

popd

endlocal
exit/b
