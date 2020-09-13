set -e


echo "<?php
$CONF['database_type'] = 'mysqli';
$CONF['database_host'] = '172.17.0.1';
$CONF['database_user'] = 'postfixadmin';
$CONF['database_password'] = 'toor';
$CONF['database_name'] = 'postfixadmin';
$CONF['configured'] = true;
?>" > /var/www/html/postfixadmin/config.local.php
chown -R www-data: /var/www/html/postfixadmin
mkdir /var/www/html/postfixadmin/templates_c
