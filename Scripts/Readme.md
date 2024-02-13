## Summary of Scripts

This is a scripts to auto-generate binding solutions and folders structure, for .net 7 and .net 8 targets

## replacable values

GITHUB="https://github.com/sbokatuk/Starscream.Net" 
VENDOR="Starscream" 
DDD="Sockets" 
SITE="https://github.com/daltoniam/Starscream" 
BUILD="1" 
smth="sc" 
VERSION="4.0.6" 
IOSVERSION="4.0.6" A
NDROIDVERSION="1.0.0" 
MACVERSION="4.0.6" 
NMSC="Starscream.Net" 
KEY="nuget.org key"

./Scripts/new.sh GITHUB="https://github.com/sbokatuk/Starscream.Net" VENDOR="Starscream" DDD="Sockets" SITE="https://github.com/daltoniam/Starscream" BUILD="1" smth="sc" VERSION="4.0.6" IOSVERSION="4.0.6" ANDROIDVERSION="1.0.0" MACVERSION="4.0.6" NMSC="Starscream.Net" KEY=""


./Scripts/build.sc.sh BUILD="1" smth="sc" VERSION="4.0.6" IOSVERSION="4.0.6" ANDROIDVERSION="1.0.0" MACVERSION="4.0.6" KEY=""