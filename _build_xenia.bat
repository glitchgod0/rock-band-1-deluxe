git pull https://github.com/hmxmilohax/rock-band-1-deluxe main
del "%~dp0\_build\Xbox\gen\main.hdr"
del "%~dp0\_build\Xbox\gen\main_2.ark"
xcopy "%~dp0\_build\_rebuild_files\main.hdr" "%~dp0\_build\Xbox\gen"
"%~dp0dependencies/arkhelper" patchcreator -a "%~dp0\_ark" -o "%~dp0\_build\Xbox" "%~dp0\_build\Xbox\gen\main.hdr"
"%~dp0\_xenia\xenia_canary" "%~dp0\_build\xbox\default.xex"
pause