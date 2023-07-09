del /f "%~dp0..\_ark\track_new\smashers\smashers.dta"
cd "%~dp0..\custom_textures\smashers"
forfiles /s /m *.* /C "cmd /e:on /v:on /c set \"Phile=@file\" & if @ISDIR==FALSE ren @file !Phile: =_!"
forfiles /s /m *.* /C "cmd /e:on /v:on /c set \"Phile=@file\" & if @ISDIR==FALSE  ren @file !Phile:-=_!"
for /f "Tokens=*" %%f in ('dir /l/b/a-d/s') do (move /y "%%f" "%%f")
for %%i in (*.bmp) do @echo "%%~ni">> smashers.dta
for %%i in (*.png) do @echo "%%~ni">> smashers.dta
for %%i in (*.jpg) do @echo "%%~ni">> smashers.dta
move "%~dp0..\custom_textures\smashers\smashers.dta" "%~dp0..\_ark\track_new\smashers\smashers.dta"
"%~dp0..\dependencies/sed.exe" -i -e "s/black_smasher_blue_//g" "%~dp0..\_ark\track_new\smashers\smashers.dta"
"%~dp0..\dependencies/sed.exe" -i -e "s/black_smasher_green_//g" "%~dp0..\_ark\track_new\smashers\smashers.dta"
"%~dp0..\dependencies/sed.exe" -i -e "s/black_smasher_norm_//g" "%~dp0..\_ark\track_new\smashers\smashers.dta"
"%~dp0..\dependencies/sed.exe" -i -e "s/black_smasher_spec_//g" "%~dp0..\_ark\track_new\smashers\smashers.dta"
"%~dp0..\dependencies/sed.exe" -i -e "s/drums_//g" "%~dp0..\_ark\track_new\smashers\smashers.dta"
"%~dp0..\dependencies/sed.exe" -i -e "s/black_smasher_orange_//g" "%~dp0..\_ark\track_new\smashers\smashers.dta"
"%~dp0..\dependencies/sed.exe" -i -e "s/black_smasher_red_//g" "%~dp0..\_ark\track_new\smashers\smashers.dta"
"%~dp0..\dependencies/sed.exe" -i -e "s/black_smasher_yellow_//g" "%~dp0..\_ark\track_new\smashers\smashers.dta"
"%~dp0..\dependencies/sed.exe" -i -e "s/square_smasher_bright_green_//g" "%~dp0..\_ark\track_new\smashers\smashers.dta"
"%~dp0..\dependencies/sed.exe" -i -e "s/square_smasher_bright_red_//g" "%~dp0..\_ark\track_new\smashers\smashers.dta"
"%~dp0..\dependencies/sed.exe" -i -e "s/square_smasher_bright_yellow_//g" "%~dp0..\_ark\track_new\smashers\smashers.dta"
"%~dp0..\dependencies/sed.exe" -i -e "s/square_smasher_bright_blue_//g" "%~dp0..\_ark\track_new\smashers\smashers.dta"
"%~dp0..\dependencies/sed.exe" -i -e "s/square_smasher_bright_orange_//g" "%~dp0..\_ark\track_new\smashers\smashers.dta"
"%~dp0..\dependencies/sed.exe" -i -e "s/radial_shockwave_//g" "%~dp0..\_ark\track_new\smashers\smashers.dta"
"%~dp0..\dependencies/sed.exe" -i -e "s/subtract_//g" "%~dp0..\_ark\track_new\smashers\smashers.dta"
"%~dp0..\dependencies/sed.exe" -i -e "s/shockwave_//g" "%~dp0..\_ark\track_new\smashers\smashers.dta"
"%~dp0..\dependencies/sed.exe" -i -e ":a;N;$!ba;s/\n/\t/g" "%~dp0..\_ark\track_new\smashers\smashers.dta"
"%~dp0..\dependencies/sed.exe" -i -e "s/\t/ /g" "%~dp0..\_ark\track_new\smashers\smashers.dta"
"%~dp0..\dependencies/sed.exe" -i -e "s/\"rb2\"/               \"rb2\"/g" "%~dp0..\_ark\track_new\smashers\smashers.dta"
FOR /F "tokens=*" %%G IN ('dir /b *.jpg') DO "%~dp0..\dependencies/magick/magick.exe" convert "%~dp0..\custom_textures\smashers/%%G" "%~dp0..\custom_textures\smashers\%%~nG.png"
FOR /F "tokens=*" %%G IN ('dir /b *.bmp') DO "%~dp0..\dependencies/magick/magick.exe" convert "%~dp0..\custom_textures\smashers/%%G" "%~dp0..\custom_textures\smashers\%%~nG.png"
FOR /F "tokens=*" %%G IN ('dir /b *.png') DO "%~dp0..\dependencies/windows/superfreq.exe" png2tex "%~dp0..\custom_textures\smashers/%%G" "%~dp0..\_ark\track_new\smashers\gen\%%~nG.png_xbox" --platform x360 --miloVersion 25
del sed* /a /s
cd "%~dp0..\_ark/track_new/smashers/gen"
FOR /F "tokens=*" %%G IN ('dir /b *.png_xbox') DO python "%~dp0..\dependencies/swap_rb_art_bytes.py" "%~dp0..\_ark/track_new/smashers/gen/%%G" "%~dp0..\_ark/track_new/smashers/gen/%%~nG.png_ps3"
