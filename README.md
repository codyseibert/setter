# Start MySQL
docker run --name setter-db -e MYSQL_ROOT_PASSWORD=123456 -p 3306:3306 mysql/mysql-server


# Remote into DB
mysql -u root -p123456 -h 192.168.1.4
