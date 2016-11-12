   								INSTALL WEB PORTAL
I. Install composer
	A.	Window

	B.	Mac OS
		1. php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
		1-or.	php -r "copy('http://getcomposer.org/installer', 'composer-setup.php');"
		2. php -r "if (hash_file('SHA384', 'composer-setup.php') === 'aa96f26c2b67226a324c27919f1eb05f21c248b987e6195cad9690d5c1ff713d53020a02ac8c217dbf90a7eacc9d141d') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
		3. php composer-setup.php
		4. php -r "unlink('composer-setup.php');"
		5. mv composer.phar /usr/local/bin/composer
		6. composer -V

II. Install Laravel framework
	A.	Window

	B.	Mac OS
		1.	composer create-project laravel/laravel <path to distination folder> --prefer-dist
		2. php artisan serve

III. Document:
	1.	Laravel cheat sheet: http://cheats.jesse-obrien.ca/