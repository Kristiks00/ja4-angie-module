# Ja4-angie-module

This fork of [ja4-nginx-module](https://github.com/FoxIO-LLC/ja4-nginx-module) was modified to use ja4-fingerprints under angie's control.

## Installation:
Use `make` to download dependencies with patches (openssh, angie, etc)
If an error occurs, resolve conflict and use `make install`

## Start:

Firstly, add configure file and crt/key files to `./angie_local/conf`. Default configure file for watching ja4-fingerprints in `./angie.conf`.  
Then run: `sudo make start`

### Fast testing:

`cp angie.conf ./angie_local/conf/angie.conf`  
`make gen-certs`  
`sudo make start`

### Some typical errors:

`sudo apt update error: "Release file is not yet valid"` -> `sudo hwclock --hctosys`
`module requires the PCRE library`                       -> `sudo apt-get install libpcre3 libpcre3-dev`
`module requires the zlib library`                       -> `sudo apt install zlib1g-dev`
`checking for C compiler ... not found`
`C compiler cc is not found`                             -> `sudo apt install gcc`