@chcp 65001 >nul 2>nul

@if exist "%ffmpeg_bin%" (
    @set "path=%ffmpeg_bin%;%path%" >nul 2>nul
)

@set "fftail=-threads 0 -stats -loglevel error"
@set "hwaccel0=-hwaccel_device 0 -hwaccel d3d11va"
@set "hwaccel1=-hwaccel_device 1 -hwaccel qsv"
@set "hwaccel=%hwaccel0%"
@set "upgradepip=python -m pip install --upgrade pip"