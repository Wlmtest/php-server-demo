server {
    listen       0.0.0.0:80;
    server_name  blade.de;
    set $root /var/www/projects/blade;
    root    $root;

    location / {
        index    index.html index.php;
        if ( -f $request_filename) {
            break;
        }
    }

    location ~ .+\.php($|/) {
        fastcgi_pass    php-fpm:9000;
        fastcgi_index    index.php?IF_REWRITE=1;
        fastcgi_param    SCRIPT_FILENAME    $root$fastcgi_script_name;
        include        fastcgi_params;
    }
}
