wget https://raw.github.com/reeceyng/v2ray-agent/master/install.sh
chmod +x install.sh
printf '1\n3\ny\n\n\n\n\n\n\n\n\n' | ./install.sh | tee installation_output_$(date +'%y%m%d_%H%M%S').txt

rm install.sh

