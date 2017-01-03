LANG=ja_JP.utf-8

cp /vagrant/mongodb.repo /etc/yum.repo.d/

yum install -y git
yum install -y epel-release
yum install -y --enablerepo=epel npm
yum install -y --enablerepo=mongodb mongo-10gen
systemctl stop firewalld

yum -y install nginx

cp /vagrant/*.conf /etc/nginx/conf.d/

chkconfig nginx on
service nginx start

npm init
npm config set prefix /usr/local
npm install -g web-push --save
npm install -g node-fetch --save
npm install -g express --save
npm install -g express-generator --save
npm install -g request --save
npm install -g child_process --save
npm install -g grunt-cli --save
npm install -g mean-cli --save

service mongod start
chkconfig mongod on