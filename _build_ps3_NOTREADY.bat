git pull https://github.com/hmxmilohax/rock-band-1-deluxe main
@echo OFF
echo:Make sure your 1.0 vanilla ark files are in _build/ps3/USRDIR/gen/
del "%~dp0\_build\ps3\USRDIR\gen\main.hdr"
del "%~dp0\_build\ps3\USRDIR\gen\main_2.ark"
xcopy "%~dp0\_build\_rebuild_files\ps3\main.hdr" "%~dp0\_build\ps3\USRDIR\gen" >nul
echo:Building Rock Band 1 Deluxe patch arks.
echo:The "Unhandled exception" below is expected, and does not indicate failure.
"%~dp0dependencies/arkhelper" patchcreator -a "%~dp0\_ark" -o "%~dp0\_build\ps3\USRDIR" "%~dp0\_build\ps3\USRDIR\gen\main.hdr" >nul
echo:Wrote Rock Band 1 Deluxe patch arks.
echo:Complete. Enjoy Rock Band 1 Deluxe
pause