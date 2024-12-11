default: build

start:
	./angie_local/sbin/angie -g "daemon off;"

build:
	./configure

gen-certs:
	openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout angie_local/conf/server.key -out angie_local/conf/server.crt -subj "/C=US/ST=State/L=City/O=Organization/OU=Department/CN=localhost"

convert-crt-to-pem:
	openssl x509 -in angie_local/conf/server.crt -out angie_local/conf/server.pem -outform PEM