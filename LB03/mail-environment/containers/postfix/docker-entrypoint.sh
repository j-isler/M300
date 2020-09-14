POSTFIXADMINUSER=$1
POSTFIXADMINPW=$2
POSTFIXHOST=$3
POSTFIXADMINDB=$4
DOVECOTIP=$5

mkdir -p /etc/postfix/sql/
echo "user = POSTFIXADMINUSER
password = POSTFIXADMINPW
hosts = POSTFIXHOST
dbname = POSTFIXADMINDB
query = SELECT goto FROM alias,alias_domain WHERE alias_domain.alias_domain = '%d' and alias.address = CONCAT('@', alias_domain.target_domain) AND alias.active = 1 AND alias_domain.active='1'" > /etc/postfix/sql/mysql_virtual_alias_domain_catchall_maps.cf
echo "user = POSTFIXADMINUSER
password = POSTFIXADMINPW
hosts = POSTFIXHOST
dbname = POSTFIXADMINDB
query = SELECT maildir FROM mailbox,alias_domain WHERE alias_domain.alias_domain = '%d' and mailbox.username = CONCAT('%u', '@', alias_domain.target_domain) AND mailbox.active = 1 AND alias_domain.active='1'" > /etc/postfix/sql/mysql_virtual_alias_domain_mailbox_maps.cf
echo "user = POSTFIXADMINUSER
password = POSTFIXADMINPW
hosts = POSTFIXHOST
dbname = POSTFIXADMINDB
query = SELECT goto FROM alias,alias_domain WHERE alias_domain.alias_domain = '%d' and alias.address = CONCAT('%u', '@', alias_domain.target_domain) AND alias.active = 1 AND alias_domain.active='1'" > /etc/postfix/sql/mysql_virtual_alias_domain_maps.cf
echo "user = POSTFIXADMINUSER
password = POSTFIXADMINPW
hosts = POSTFIXHOST
dbname = POSTFIXADMINDB
query = SELECT goto FROM alias WHERE address='%s' AND active = '1'" > /etc/postfix/sql/mysql_virtual_alias_maps.cf
echo "user = POSTFIXADMINUSER
password = POSTFIXADMINPW
hosts = POSTFIXHOST
dbname = POSTFIXADMINDB
query = SELECT domain FROM domain WHERE domain='%s' AND active = '1'" > /etc/postfix/sql/mysql_virtual_domains_maps.cf
echo "user = POSTFIXADMINUSER
password = POSTFIXADMINPW
hosts = POSTFIXHOST
dbname = POSTFIXADMINDB
query = SELECT quota FROM mailbox WHERE username='%s' AND active = '1'" > /etc/postfix/sql/mysql_virtual_mailbox_limit_maps.cf
echo "user = POSTFIXADMINUSER
password = POSTFIXADMINPW
hosts = POSTFIXHOST
dbname = POSTFIXADMINDB
query = SELECT maildir FROM mailbox WHERE username='%s' AND active = '1'" > /etc/postfix/sql/mysql_virtual_mailbox_maps.cf
postconf -e "myhostname = $(hostname -f)"
postconf -e "virtual_mailbox_domains = proxy:mysql:/etc/postfix/sql/mysql_virtual_domains_maps.cf"
postconf -e "virtual_alias_maps = proxy:mysql:/etc/postfix/sql/mysql_virtual_alias_maps.cf, proxy:mysql:/etc/postfix/sql/mysql_virtual_alias_domain_maps.cf, proxy:mysql:/etc/postfix/sql/mysql_virtual_alias_domain_catchall_maps.cf"
postconf -e "virtual_mailbox_maps = proxy:mysql:/etc/postfix/sql/mysql_virtual_mailbox_maps.cf, proxy:mysql:/etc/postfix/sql/mysql_virtual_alias_domain_mailbox_maps.cf"
postconf -e "smtpd_tls_cert_file = /etc/ssl/certs/ssl-cert-snakeoil.pem"
postconf -e "smtpd_tls_key_file = /etc/ssl/private/ssl-cert-snakeoil.key"
postconf -e "smtpd_use_tls = yes"
postconf -e "smtpd_tls_auth_only = yes"
postconf -e "smtpd_sasl_type = dovecot"
postconf -e "smtpd_sasl_path = inet:DOVECOTIP:12345"
postconf -e "smtpd_sasl_auth_enable = yes"
postconf -e "smtpd_recipient_restrictions = permit_sasl_authenticated, permit_mynetworks, reject_unauth_destination"
postconf -e "mydestination = localhost"
postconf -e "mynetworks = 127.0.0.0/8"
postconf -e "inet_protocols = ipv4"
postconf -e "inet_interfaces = all"
postconf -e "virtual_transport = lmtp:DOVECOTIP:24"
postconf -e "mailbox_transport = lmtp:DOVECOTIP:24"
echo "smtp inet n - y - - smtpd
#smtp inet n - y - 1 postscreen
#smtpd pass - - y - - smtpd
#dnsblog unix - - y - 0 dnsblog
#tlsproxy unix - - y - 0 tlsproxy
submission inet n - y - - smtpd
	-o syslog_name=postfix/submission
	-o smtpd_tls_security_level=encrypt
	-o smtpd_sasl_auth_enable=yes
# -o smtpd_reject_unlisted_recipient=no
# -o smtpd_client_restrictions=$mua_client_restrictions
# -o smtpd_helo_restrictions=$mua_helo_restrictions
# -o smtpd_sender_restrictions=$mua_sender_restrictions
# -o smtpd_recipient_restrictions=
# -o smtpd_relay_restrictions=permit_sasl_authenticated,reject
	-o smtpd_client_restrictions=permit_sasl_authenticated,reject
	-o milter_macro_daemon_name=ORIGINATING
smtps inet n - y - - smtpd
	-o syslog_name=postfix/smtps
# -o smtpd_tls_wrappermode=yes
	-o smtpd_sasl_auth_enable=yes
# -o smtpd_reject_unlisted_recipient=no
	-o smtpd_client_restrictions=permit_sasl_authenticated,reject
# -o smtpd_client_restrictions=$mua_client_restrictions
# -o smtpd_helo_restrictions=$mua_helo_restrictions
# -o smtpd_sender_restrictions=$mua_sender_restrictions
# -o smtpd_recipient_restrictions=
# -o smtpd_relay_restrictions=permit_sasl_authenticated,reject
	-o milter_macro_daemon_name=ORIGINATING" > /etc/postfix/master.cf
