#set -e


#echo "<?php
#$CONF['setup_password'] = 'f0a56f9f9664aaa493733144055acf1f:4c811aa4b38d9d1b0098438b8c98e43c4b164428';
#?>" > /var/www/html/config.inc.php
#chown -R www-data: /var/www/html/postfixadmin

sed -i "s/'791eb4ead7fd996c01bed30707ae27dd:b7910d09773104bf84c4f4951205d2198c7cfc4f'/'f0a56f9f9664aaa493733144055acf1f:4c811aa4b38d9d1b0098438b8c98e43c4b164428'/" /var/www/html/config.local.php

