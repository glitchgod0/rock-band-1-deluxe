del /f "%~dp0..\_ark\track_new\flames\flames.dta"
cd "%~dp0..\custom_textures\flames"
forfiles /s /m *.* /C "cmd /e:on /v:on /c set \"Phile=@file\" & if @ISDIR==FALSE ren @file !Phile: =_!"
forfiles /s /m *.* /C "cmd /e:on /v:on /c set \"Phile=@file\" & if @ISDIR==FALSE  ren @file !Phile:-=_!"
for /f "Tokens=*" %%f in ('dir /l/b/a-d/s') do (move /y "%%f" "%%f")
for %%i in (*.bmp) do @echo "%%~ni">> flames.dta
for %%i in (*.png) do @echo "%%~ni">> flames.dta
for %%i in (*.jpg) do @echo "%%~ni">> flames.dta
move "%~dp0..\custom_textures\flames\flames.dta" "%~dp0..\_ark\track_new\flames\flames.dta"
"%~dp0..\dependencies/sed.exe" -i -e "s/flare_//g" "%~dp0..\_ark\track_new\flames\flames.dta"
"%~dp0..\dependencies/sed.exe" -i -e "s/green_//g" "%~dp0..\_ark\track_new\flames\flames.dta"
"%~dp0..\dependencies/sed.exe" -i -e "s/red_//g" "%~dp0..\_ark\track_new\flames\flames.dta"
"%~dp0..\dependencies/sed.exe" -i -e "s/yellow_//g" "%~dp0..\_ark\track_new\flames\flames.dta"
"%~dp0..\dependencies/sed.exe" -i -e "s/blue_//g" "%~dp0..\_ark\track_new\flames\flames.dta"
"%~dp0..\dependencies/sed.exe" -i -e "s/orange_//g" "%~dp0..\_ark\track_new\flames\flames.dta"
"%~dp0..\dependencies/sed.exe" -i -e "s/style_//g" "%~dp0..\_ark\track_new\flames\flames.dta"
"%~dp0..\dependencies/sed.exe" -i -e "s/kick_smasher_//g" "%~dp0..\_ark\track_new\flames\flames.dta"
"%~dp0..\dependencies/sed.exe" -i -e "s/light_can_star_//g" "%~dp0..\_ark\track_new\flames\flames.dta"
"%~dp0..\dependencies/sed.exe" -i -e "s/broken_glass//g" "%~dp0..\_ark\track_new\flames\flames.dta"
"%~dp0..\dependencies/sed.exe" -i -e "s/01_//g" "%~dp0..\_ark\track_new\flames\flames.dta"
"%~dp0..\dependencies/sed.exe" -i -e "s/02_//g" "%~dp0..\_ark\track_new\flames\flames.dta"
"%~dp0..\dependencies/sed.exe" -i -e "s/gem_cap_//g" "%~dp0..\_ark\track_new\flames\flames.dta"
"%~dp0..\dependencies/sed.exe" -i -e "s/radial_shockwave_//g" "%~dp0..\_ark\track_new\flames\flames.dta"
"%~dp0..\dependencies/sed.exe" -i -e "s/subtract_//g" "%~dp0..\_ark\track_new\flames\flames.dta"
"%~dp0..\dependencies/sed.exe" -i -e "s/shockwave_//g" "%~dp0..\_ark\track_new\flames\flames.dta"
"%~dp0..\dependencies/sed.exe" -i -e "s/sparks_//g" "%~dp0..\_ark\track_new\flames\flames.dta"
FOR /F "tokens=*" %%G IN ('dir /b *.jpg') DO "%~dp0..\dependencies/magick/magick.exe" convert "%~dp0..\custom_textures\flames/%%G" "%~dp0..\custom_textures\flames\%%~nG.png"
FOR /F "tokens=*" %%G IN ('dir /b *.bmp') DO "%~dp0..\dependencies/magick/magick.exe" convert "%~dp0..\custom_textures\flames/%%G" "%~dp0..\custom_textures\flames\%%~nG.png"
FOR /F "tokens=*" %%G IN ('dir /b *.png') DO "%~dp0..\dependencies/windows/superfreq.exe" png2tex "%~dp0..\custom_textures\flames/%%G" "%~dp0..\_ark\track_new\flames\gen\%%~nG.png_xbox" --platform x360 --miloVersion 25
del sed* /a /s
cd "%~dp0..\_ark/track_new/flames/gen"
FOR /F "tokens=*" %%G IN ('dir /b *.png_xbox') DO python "%~dp0..\dependencies/swap_rb_art_bytes.py" "%~dp0..\_ark/track_new/flames/gen/%%G" "%~dp0..\_ark/track_new/flames/gen/%%~nG.png_ps3"