set -e

password="toor"

if [ ! -f .initialized ]; then                                                                                                                                                                                    
    echo "Initializing container"                                                                                                                                                                                 
    # run initializing commands                                                                                                                                                                                   
    touch .initialized 

    echo "configuring mariadb database..." 
    mysql -u root -psecret <<EOF
    CREATE USER 'postfixadmin'@'%' IDENTIFIED BY $password;
    CREATE DATABASE postfixadmin;
    GRANT ALL PRIVILEGES ON postfixadmin.* TO 'postfixadmin'@'0.0.0.0';
    FLUSH PRIVILEGES;
    EOF

fi  

# https://stackoverflow.com/questions/46482257/how-to-add-a-startup-script-to-a-mysql-docker-container






