# Ja4-nginx-module

This fork of [ja4-nginx-module](https://github.com/FoxIO-LLC/ja4-nginx-module) was modified to use ja4-fingerprints under openresty's and angie's (not implemented yet) control.

## Installation:
`make openresty` (Depends on `openresty -V` command. If it's not work, install `openresty`)

## Start:

Firstly, add configure file and crt/key files to `$PREFIX/conf`. Default configure file for watching ja4-fingerprints in `./nginx.conf`.  
Then run: `sudo make start`

### Some typical errors:

`sudo apt update error: "Release file is not yet valid"` -> `sudo hwclock --hctosys`

`module requires the PCRE library`                       -> `sudo apt-get install libpcre3 libpcre3-dev`

`module requires the zlib library`                       -> `sudo apt install zlib1g-dev`

`checking for C compiler ... not found`
`C compiler cc is not found`                             -> `sudo apt install gcc`
