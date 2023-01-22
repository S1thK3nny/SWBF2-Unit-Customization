@echo off
if not exist ..\assets\bkupmungebats mkdir ..\assets\bkupmungebats
if not exist ..\assets\bkupmungebats\munge.bat (
	copy ..\data\_BUILD\munge.bat ..\assets\bkupmungebats
	copy munge.bat ..\data\_BUILD
)
if not exist ..\assets\bkupmungebats\Common\munge.bat (
	mkdir ..\assets\bkupmungebats\Common
	copy ..\data\_BUILD\Common\munge.bat ..\assets\bkupmungebats\Common
	copy Common\munge.bat ..\data\_BUILD\Common\munge.bat
)
if not exist ..\assets\bkupmungebats\Common\munge_fpm.bat (
	copy ..\data\_BUILD\Common\munge_fpm.bat ..\assets\bkupmungebats\Common
	copy Common\munge_fpm.bat ..\data\_BUILD\Common\munge_fpm.bat
)
if not exist ..\assets\bkupmungebats\Common\munge_sprites.bat (
	copy ..\data\_BUILD\Common\munge_sprites.bat ..\assets\bkupmungebats\Common
	copy Common\munge_sprites.bat ..\data\_BUILD\Common\munge_sprites.bat
)
if not exist ..\assets\bkupmungebats\Load\munge.bat (
	mkdir ..\assets\bkupmungebats\Load
	copy ..\data\_BUILD\Load\munge.bat ..\assets\bkupmungebats\Load
	copy Load\munge.bat ..\data\_BUILD\Load\munge.bat
)
if not exist ..\assets\bkupmungebats\Shell\munge.bat (
	mkdir ..\assets\bkupmungebats\Shell
	copy ..\data\_BUILD\Shell\munge.bat ..\assets\bkupmungebats\Shell
	copy Shell\munge.bat ..\data\_BUILD\Shell\munge.bat
)
if not exist ..\assets\bkupmungebats\Sides\munge_fpm.bat (
	mkdir ..\assets\bkupmungebats\Sides
	copy ..\data\_BUILD\Sides\munge_fpm.bat ..\assets\bkupmungebats\Sides
	copy Sides\munge_fpm.bat ..\data\_BUILD\Sides\munge_fpm.bat
)
if not exist ..\assets\bkupmungebats\Sides\munge_side.bat (
	copy ..\data\_BUILD\Sides\munge_side.bat ..\assets\bkupmungebats\Sides
	copy Sides\munge_side.bat ..\data\_BUILD\Sides\munge_side.bat
)
if not exist ..\assets\bkupmungebats\Sound\munge.bat (
	mkdir ..\assets\bkupmungebats\Sound
	copy ..\data\_BUILD\Sound\munge.bat ..\assets\bkupmungebats\Sound
	copy Sound\munge.bat ..\data\_BUILD\Sound\munge.bat
)
if not exist ..\assets\bkupmungebats\Worlds\munge_world.bat (
	mkdir ..\assets\bkupmungebats\Worlds
	copy ..\data\_BUILD\Worlds\munge_world.bat ..\assets\bkupmungebats\Worlds
	copy Worlds\munge_world.bat ..\data\_BUILD\Worlds\munge_world.bat
)