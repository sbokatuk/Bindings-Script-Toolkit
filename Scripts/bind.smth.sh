#!/bin/sh

# ./Scripts/build.smth.sh BUILD="1-beta1" VERSION="6.0.0" IOSVERSION="6.0.0" ANDROIDVERSION="6.0.0" MACVERSION="6.0.0"
for ARGUMENT in "$@"
do
   KEY=$(echo $ARGUMENT | cut -f1 -d=)

   KEY_LENGTH=${#KEY}
   VALUE="${ARGUMENT:$KEY_LENGTH+1}"

   export "$KEY"="$VALUE"
done


fi