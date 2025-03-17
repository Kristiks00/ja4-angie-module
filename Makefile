default: install
.PHONY: start dependencies install clean gen-certs convert-crt-to-pem
WORKDIR := $(shell pwd)
PREFIX := Angie-with-ja4

start:
	$(PREFIX)/sbin/angie -g "daemon off;"

dependencies:
	./dependencies $(WORKDIR)

install: dependencies
	./install $(WORKDIR) $(PREFIX)

clean:
	rm -rf angie openssl angie-module-lua

gen-certs:
	openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout $(PREFIX)/conf/server.key -out $(PREFIX)/conf/server.crt -subj "/C=US/ST=State/L=City/O=Organization/OU=Department/CN=localhost"

convert-crt-to-pem:
	openssl x509 -in $(PREFIX)/conf/server.crt -out $(PREFIX)/conf/server.pem -outform PEM