ERROR: "The only supported ciphers are AES-128-CBC and AES-256-CBC with the correct key lengths."
RESOLVE: 
    1. exits file .env 
    2. run cmd: 
        php artisan key:generate
        php artisan config:clear
        