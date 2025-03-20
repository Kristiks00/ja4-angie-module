PREFIX := $(shell pwd)/nginx-with-ja4
OPENSSL_VERSION := "3.4.1"
OPENRESTY_VERSION := "1.27.1.1"
NGINX_VERSION := "1.27.1"
ANGIE_VERSION := "1.8.1"

.PHONY: start
start:
	$(PREFIX)/nginx/sbin/nginx -g "daemon off;"

.PHONY: openssl
openssl: clean
	./dependencies/openssl $(OPENSSL_VERSION)

.PHONY: openresty
openresty: openssl
	./dependencies/openresty $(PREFIX) $(OPENRESTY_VERSION) $(NGINX_VERSION) $(OPENSSL_VERSION)

.PHONY: angie-module-lua
angie-module-lua:
	./dependencies/angie-module-lua

.PHONY: angie
angie: openssl angie-module-lua
	./dependencies/angie $(PREFIX) $(ANGIE_VERSION) $(OPENSSL_VERSION)

.PHONY: clean
clean:
	rm -rf openresty-$(OPENRESTY_VERSION) openssl-$(OPENSSL_VERSION) angie-$(ANGIE_VERSION) angie-module-lua $(PREFIX)

.PHONY: gen-certs
gen-certs:
	openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout $(PREFIX)/nginx/conf/server.key -out $(PREFIX)/nginx/conf/server.crt -subj "/C=US/ST=State/L=City/O=Organization/OU=Department/CN=localhost"
