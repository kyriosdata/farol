rm -rf output
./_genonce.sh
rm -rf /var/www/html/
mkdir /var/www/html/
cp -r output/. /var/www/html/