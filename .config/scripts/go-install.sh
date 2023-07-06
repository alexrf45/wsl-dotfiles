echo -e "Installing Go"

sudo rm -rf /usr/local/go/ &&
	sudo tar -C /usr/local/ -xzf go1.20.5.linux-amd64.tar &&
	wget https://go.dev/dl/go1.20.linux-amd64.tar.gz && tar -C /usr/local -xzf go1.20.linux-amd64.tar.gz

if /usr/local/go/bin/go version; then
	echo "Install Successful!"
else
	echo "Install Failed. Try Again."
fi
