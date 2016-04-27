#
#/etc/cron.d/netflow-clean.sh
#

DNS="10.14.160.9"
INPUT="/var/log/netflow"

for OUTPUT in $(ls /tmp/nfcapd.2*)
do
	DATE=$(date +"%Y%m%d%H%M%S%N")
	nfdump -r $OUTPUT -D $DNS -o csv | grep 20 > $INPUT.$DATE
	rm $OUTPUT
done

 find /var/log/netflow* -mmin +15 -exec rm {} \;
