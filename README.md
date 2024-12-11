# Ja4-angie-module

This fork of [ja4-nginx-module](https://github.com/FoxIO-LLC/ja4-nginx-module) was modified to use ja4-fingerprints under angie's control.

## Installation:
`git clone git@github.com:Kristiks00/ja4-angie-module.git`  
`cd ja4-angie-module`  
`make`

## Start:

Firstly, add configure file and crt/key files to `./angie_local/conf`. Default configure file for watching ja4-fingerprints in `./angie.conf`.  
Then run: `sudo make start`

### Fast testing:

`cp angie.conf ./angie_local/conf/angie.conf`  
`make gen-certs`  
`sudo make start`
