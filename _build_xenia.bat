git pull https://github.com/hmxmilohax/rock-band-1-deluxe main
"%~dp0\dependencies/arkhelper" dir2ark "%~dp0\_ark" "%~dp0\_build\Xbox\gen" -e -s 4073741823
"%~dp0\_xenia\xenia_canary" "%~dp0\_build\xbox\default.xex"
pause