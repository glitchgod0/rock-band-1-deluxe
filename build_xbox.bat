git pull https://github.com/hmxmilohax/rock-band-1-deluxe main
@echo OFF
echo:Make sure your 1.0 vanilla ark files are in _build/Xbox/gen/
del "%~dp0\_build\Xbox\gen\main.hdr"
del "%~dp0\_build\Xbox\gen\main_2.ark"
xcopy "%~dp0\_build\_rebuild_files\xbox\main.hdr" "%~dp0\_build\Xbox\gen" >nul
echo:Temporarily moving PS3 files out of the ark path to reduce final ARK size
@%SystemRoot%\System32\robocopy.exe "%~dp0_ark" "%~dp0_temp\_ark" *.milo_ps3 /S /MOVE /XD "%~dp0_temp\_ark" /NDL /NFL /NJH /NJS /R:0 >nul
@%SystemRoot%\System32\robocopy.exe "%~dp0_ark" "%~dp0_temp\_ark" *.png_ps3 /S /MOVE /XD "%~dp0_temp\_ark" /NDL /NFL /NJH /NJS /R:0 >nul
@%SystemRoot%\System32\robocopy.exe "%~dp0_ark" "%~dp0_temp\_ark" *.bmp_ps3 /S /MOVE /XD "%~dp0_temp\_ark" /NDL /NFL /NJH /NJS /R:0 >nul
echo:Building Rock Band 1 Deluxe patch arks.
echo:The "Unhandled exception" below is expected, and does not indicate failure.
"%~dp0dependencies/arkhelper" patchcreator -a "%~dp0\_ark" -o "%~dp0\_build\Xbox" "%~dp0\_build\Xbox\gen\main.hdr" >nul
echo:Moving back PS3 files
@%SystemRoot%\System32\robocopy.exe "%~dp0_temp\_ark" "%~dp0_ark" *.milo_ps3 /S /MOVE /XD "%~dp0_ark" /NDL /NFL /NJH /NJS /R:0 >nul
@%SystemRoot%\System32\robocopy.exe "%~dp0_temp\_ark" "%~dp0_ark" *.png_ps3 /S /MOVE /XD "%~dp0_ark" /NDL /NFL /NJH /NJS /R:0 >nul
@%SystemRoot%\System32\robocopy.exe "%~dp0_temp\_ark" "%~dp0_ark" *.bmp_ps3 /S /MOVE /XD "%~dp0_ark" /NDL /NFL /NJH /NJS /R:0 >nul
rd _temp
echo:Wrote Rock Band 1 Deluxe patch arks.
echo:Complete. Enjoy Rock Band 1 Deluxe
pause