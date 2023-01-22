@echo off
copy ..\assets\bkupmungebats\munge.bat ..\data\_BUILD
copy ..\assets\bkupmungebats\Common\munge.bat ..\data\_BUILD\Common
copy ..\assets\bkupmungebats\Common\munge_fpm.bat ..\data\_BUILD\Common
copy ..\assets\bkupmungebats\Common\munge_sprites.bat ..\data\_BUILD\Common
copy ..\assets\bkupmungebats\Load\munge.bat ..\data\_BUILD\Load
copy ..\assets\bkupmungebats\Shell\munge.bat ..\data\_BUILD\Shell
copy ..\assets\bkupmungebats\Sides\munge_fpm.bat ..\data\_BUILD\Sides
copy ..\assets\bkupmungebats\Sides\munge_side.bat ..\data\_BUILD\Sides
copy ..\assets\bkupmungebats\Sound\munge.bat ..\data\_BUILD\Sound
copy ..\assets\bkupmungebats\Worlds\munge_world.bat ..\data\_BUILD\Worlds
rmdir /Q /S ..\assets\bkupmungebats