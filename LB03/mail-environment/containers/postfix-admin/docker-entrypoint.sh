set -e


echo "<?php
$CONF['database_type'] = 'mysqli';
$CONF['database_host'] = '172.17.0.3';
$CONF['database_user'] = 'root';
$CONF['database_password'] = 'toor';
$CONF['database_name'] = 'postfixadmin';
$CONF['configured'] = true;
$CONF['setup_password'] = 'f0a56f9f9664aaa493733144055acf1f:4c811aa4b38d9d1b0098438b8c98e43c4b164428';
?>" > /var/www/html/config.inc.php
# chown -R www-data: /var/www/html/postfixadmin
