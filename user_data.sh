#!/bin/bash
yum -y update
yum -y install httpd


myip=`curl http://169.254.169.254/latest/meta-data/local-ipv4`

cat <<EOF > /var/www/html/index.html
<html>
<body bgcolor="yellow">
<font color="green">Server PrivateIP: <font color="aqua">$myip<br><br>
<font color="magenta">
</body>
</html>
EOF

sudo service httpd start
chkconfig httpd on
