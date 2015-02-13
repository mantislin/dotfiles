@echo off

:: =============================================================================
:setup          -- Setup script
setlocal
rem setlocal enabledelayedexpansion

if not exist "%dotfiles%" set "dotfiles=%~dp0"

pushd "%dotfiles%" || (
    echo/System cannot find "%dotfiles%".
    goto :eo_setup
)

set "extfiles=%~nx0"

set "extfiles=%extfiles%:.git"
set "extfiles=%extfiles%:bin"

set "extfiles=%extfiles%:.DS_Store"
set "extfiles=%extfiles%:.gitignore"
set "extfiles=%extfiles%:.zshrc"
set "extfiles=%extfiles%:.gemrc"
set "extfiles=%extfiles%:.bashrc"
set "extfiles=%extfiles%:.bash_profile"
set "extfiles=%extfiles%:setup.command"
set "extfiles=%extfiles%:Thumbs.db"

for /f %%a in ('dir/b/a:d "%dotfiles%"') do (
    echo/%extfiles%|find /i "%%a" >nul 2>nul && (
        echo/%%a>nul
    ) || (
        call :myln /d /f /b
        rem echo/
        rem echo/########## %%a ##########
        rem echo/"a=%%a"
        if "%%a" == ".vimperator" (
            call :myln /d /f /b "%userprofile%\vimperator" "%dotfiles%\%%a"
            rem mklink /j "%userprofile%\vimperator" "%dotfiles%\%%a"
        ) else (
            call :myln /d /f /b "%userprofile%\%%a" "%dotfiles%\%%a"
            rem mklink /j "%userprofile%\%%a" "%dotfiles%\%%a"
        )
    )
)
for /f %%a in ('dir/b/a:-d "%dotfiles%"') do (
    echo/%extfiles%|find /i "%%a" >nul 2>nul && (
        echo/%%a>nul
    ) || (
        rem echo/
        rem echo/########## %%a ##########
        rem echo/"a=%%a"
        if "%%a" == "vimrc" (
            call :myln /f /b "%userprofile%\_vimrc" "%dotfiles%\%%a"
            rem mklink "%userprofile%\_vimrc" "%dotfiles%\%%a"
        ) else (
            call :myln /f /b "%userprofile%\%%a" "%dotfiles%\%%a"
            rem mklink "%userprofile%\%%a" "%dotfiles%\%%a"
        )
    )
)

popd

:eo_setup
endlocal
goto :eof


:: =============================================================================
:help           -- Show help messages
    echo/Do dotfiles setup for windows.
goto :eof


:: =============================================================================
:myln           -- Customize mklink
::              -- /D       Make link for directory, not file.
::              -- /F       Force overwrite if target is exist.
::              -- /B       Create backup if overwrite(/F) is happening.
setlocal enabledelayedexpansion
    set "link="
    set "target="
    set "toDirectory=0"
    set "toOverwrite=0"
    set "toBackup=0"
    :loop_myln_1
        if "%~1" == "" goto :done_myln_1
        if not "%~1" == "" (
            set "arg1=%~1"
            if not "!arg1:~0,1!" == "/" (
                if "!link!" == "" (
                    set "link=!arg1!"
                ) else if "!target!" == "" (
                    set "target=!arg1!"
                )
            ) else (
                set "arg1=!arg1:~1!"
                :loop_myln_1_1
                    if not "!arg1!" == "" (
                        set "chr1=!arg1:~0,1!"
                        set "arg1=!arg1:~1!"

                        if /i "!chr1!" == "D" (
                            set "toDirectory=1"
                        ) else if /i "!chr1!" == "F" (
                            set "toOverwrite=1"
                        ) else if /i "!chr1!" == "B" (
                            set "toBackup=1"
                        )

                        goto :loop_myln_1_1
                    )
            )
            shift
        )
        goto :loop_myln_1
    :done_myln_1

    if "%link%" == "" if "%target%" == "" goto :eo_myln
    if exist "%link%" (
        if "%toOverwrite%" == "1" (
            if "%toBackup%" == "1" (
                set "basename="
                set "extname="
                for /f %%a in ("%link%") do (
                    set "basename=%%~na"
                    set "extname=%%~xa"
                )

                set "suffix="
                call :gensuffix "suffix"
                if not "!suffix!" == "" set "suffix=_!suffix!"

                set "newname=!basename!_backup!suffix!!extname!"
                if "!basename!" == "" ( if not "!extname!" == "" (
                    set "newname=!extname!_backup!suffix!"
                ))

                rem here
                echo/ren "%link%" "!newname!"
            )
        )
    )

    rem echo/"all=%*"
    rem echo/"target=%target%"
    rem echo/"link=%link%"
    rem echo/"toOverwrite=%toOverwrite%"
    rem echo/"toBackup=%toBackup%"
    rem echo/##############################
:eo_myln
endlocal
goto :eof


:: =============================================================================
:getbasename   -- Get basename of file.
::          -- %~1:     Get output value.
::                      return basename of passed file.
::          -- %~2:     Get the file to get basename.
setlocal
    set "basename="
    if not "%~1" == "" if exist "%~2" set "basename=%~n2"
:eo_basename
(endlocal
    if not "%~1" == "" set "%~1=%basename%"
)
goto :eof


:: =============================================================================
:getextname    -- Get extname of file.
::          -- %~1:     Get output value.
::                      return extname of passed file.
::          -- %~2:     Get the file to get extname.
setlocal
    set "extname="
    if not "%~1" == "" if exist "%~2" set "extname=%~x2"
:eo_extname
(endlocal
    if not "%~1" == "" set "%~1=%extname%"
)
goto :eof


:: =============================================================================
:gensuffix  -- Generate name suffix append on current time
::          -- %~1:     Get output value.
::                      return generated suffix.
setlocal
    set "suffix="
    if "%~1" == "" goto :eo_gensuffix

    for /f "tokens=1-2 delims= " %%x in ('echo %date%') do (
        for /f "tokens=1-3 delims=:./- " %%a in ('echo %%x') do (
            if not "%%b" == "" (
                set "month=%%a"
                set "day=%%b"
                set "year=%%c"
            )
        )
        for /f "tokens=1-3 delims=:./- " %%a in ('echo %%y') do (
            if not "%%b" == "" (
                set "month=%%a"
                set "day=%%b"
                set "year=%%c"
            )
        )
    )

    for /f "tokens=1-4 delims=:./- " %%a in ('echo %time%') do (
        set "hour=%%a" & set "min=%%b" & set "sec=%%c" & set "msec=%%d"
    )

    set "suffix=%year%%month%%day%%hour%%min%%sec%%msec%"
:eo_gensuffix
(endlocal
    if not "%~1" == "" set "%~1=%suffix%"
)
goto :eof
