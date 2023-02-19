
ipset destroy  countries
ipset create countries hash:net


COUNTRIES=('ir')

for i in "${COUNTRIES[@]}"; do
        echo "BAN IP of country ${i}"
        for IP in $(wget -O - https://www.ipdeny.com/ipblocks/data/countries/${i}.zone)
        do
		ipset add countries $IP
	done
	echo "======= ipset created to block ${i} =========="
done

iptables -F
iptables -X

iptables -A OUTPUT -p tcp --dport 80  -m set --match-set countries dst -j REJECT
iptables -A OUTPUT -p tcp --dport 443 -m set --match-set countries dst -j REJECT

#iptables -A FORWARD -m set --match-set countries src -j DROP


echo "port 80 & 443 is now blocked for ipset 'countries'"

touch "/etc/ipban_created"

