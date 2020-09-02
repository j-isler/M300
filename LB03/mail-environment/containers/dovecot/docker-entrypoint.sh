sed -i '/\!include conf\.d\/\*\.conf/ s/^#//' /etc/dovecot/dovecot.conf
echo "protocols = imap lmtp pop3" >> /etc/dovecot/dovecot.conf
sed -i 's/#mail_location = mbox:~\/mail:INBOX=\/var\/mail\/%u/mail_location = maildir:\/var\/vmail\/vhosts\/%d\/%n/' /etc/dovecot/conf.d/10-mail.conf
sed -i 's/#mail_privileged_group =/mail_privileged_group = mail/' /etc/dovecot/conf.d/10-mail.conf
echo "mail_uid = vmail
mail_gid = mail
first_valid_uid = 150
last_valid_uid = 150" >> /etc/dovecot/conf.d/10-mail.conf
mkdir -p /var/vmail/vhosts/jenia-isler.ch
useradd -r -g mail -u 150 -d /var/mail vmail
chmod -R 770 /var/vmail
chown -R vmail:mail /var/vmail
sed -i 's/auth_mechanisms = plain/auth_mechanisms = plain login/' /etc/dovecot/conf.d/10-auth.conf
sed -i '/\!include auth-system\.conf\.ext/ s/^/#/g' /etc/dovecot/conf.d/10-auth.conf
sed -i '/\!include auth-sql\.conf\.ext/s/^#//g' /etc/dovecot/conf.d/10-auth.conf
sed -i 's/#driver =/driver = mysql/' /etc/dovecot/dovecot-sql.conf.ext
sed -i 's/#connect =/connect = host=localhost dbname=postfixadmin user=postfixadmin password='toor'/' /etc/dovecot/dovecot-sql.conf.ext
sed -i 's/#default_pass_scheme = MD5/default_pass_scheme = MD5-CRYPT/' /etc/dovecot/dovecot-sql.conf.ext
sed -i '/^password_query =.*/s/^/#/g' /etc/dovecot/dovecot-sql.conf.ext
echo "password_query = SELECT username as user, password, '/var/vmail/%d/%n' as userdb_home, 'maildir:/var/vmail/%d/%n' as userdb_mail, 150 as userdb_uid, 8 as userdb_gid FROM mailbox WHERE username = '%u' AND active = '1';" >> /etc/dovecot/dovecot-sql.conf.ext
sed -i '/^user_query =.*/s/^/#/g' /etc/dovecot/dovecot-sql.conf.ext
echo "user_query = SELECT '/var/vmail/%d/%u' as home, 'maildir:/var/vmail/%d/%u' as mail, 150 AS uid, 8 AS gid, concat('dirsize:storage=', quota) AS quota FROM mailbox WHERE username = '%u' AND active = '1';" >> /etc/dovecot/dovecot-sql.conf.ext
echo "postmaster_address = postmaster@jenia-isler.ch" >> /etc/dovecot/conf.d/15-lda.conf
echo "service imap-login {
  inet_listener imap {
    port = 0
  }
  inet_listener imaps {
    #port = 993
    #ssl = yes
  }
}
service pop3-login {
  inet_listener pop3 {
    #port = 110
  }
  inet_listener pop3s {
    #port = 995
    #ssl = yes
  }
}
service lmtp {
   inet_listener lmtp {
      address = 172.17.0.2 127.0.0.1 ::1
      port = 24
   }

   unix_listener lmtp {
      #mode = 0666
   }
}
service imap {
}
service pop3 {
}
service auth {
   inet_listener {
	   port = 12345
   }

	 unix_listener auth-userdb {
     mode = 0600
     user = vmail

	 }
	 user = dovecot
}

service auth-worker {
  user = vmail
}
service dict {
  unix_listener dict {
  }
}" > /etc/dovecot/conf.d/10-master.conf
chown -R vmail:dovecot /etc/dovecot 
chmod -R o-rwx /etc/dovecot