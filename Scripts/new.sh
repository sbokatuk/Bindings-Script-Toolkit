#!/bin/sh

for ARGUMENT in "$@"
do
   KEY=$(echo $ARGUMENT | cut -f1 -d=)

   KEY_LENGTH=${#KEY}
   VALUE="${ARGUMENT:$KEY_LENGTH+1}"

   export "$KEY"="$VALUE"
done

# GITHUB
# NMSC
# VENDOR
# DDD
# SITE
# smth
# PLATFORM

# ./Scripts/new.sh GITHUB="https://github.com/sbokatuk/Net.Agora" NMSC="Net.Agora.Video" VENDOR="Agora" DDD="Video" SITE="https://www.agora.io/en/" PLATFORM="iOS" smth="video" VERSION="4.2.6" IOSVERSION="4.2.6" ANDROIDVERSION="4.2.6" BUILD="1" MACVERSION="4.2.6" 
rm -rf NugetPackages/$smth
mkdir -p NugetPackages/$smth

cp -R Scripts/nuspecs/smth/* NugetPackages/$smth

cp -R Scripts/nuspecs/Net.nuspec NugetPackages/$NMSC.nuspec

sed -E -i "" "s=NMSC=$NMSC=" NugetPackages/$NMSC.nuspec
./Scripts/replace.sh GITHUB="$GITHUB" NMSC="$NMSC" VENDOR="$VENDOR" DDD="$DDD" SITE="$SITE" smth="$smth" INFILE="NugetPackages/$NMSC.nuspec"


./Scripts/create.sh GITHUB="$GITHUB" NMSC="$NMSC" VENDOR="$VENDOR" DDD="$DDD" SITE="$SITE" smth="$smth" PLATFORM="Mac"
./Scripts/create.sh GITHUB="$GITHUB" NMSC="$NMSC" VENDOR="$VENDOR" DDD="$DDD" SITE="$SITE" smth="$smth" PLATFORM="iOS"
./Scripts/create.sh GITHUB="$GITHUB" NMSC="$NMSC" VENDOR="$VENDOR" DDD="$DDD" SITE="$SITE" smth="$smth" PLATFORM="Android"
cp -R Scripts/build.smth.sh build.$smth.sh
./Scripts/replace.sh NMSC="$NMSC" smth="$smth" INFILE="build.$smth.sh"

cp -R Scripts/bind.smth.sh bind.$smth.sh
./Scripts/replace.sh NMSC="$NMSC" smth="$smth" INFILE="bind.$smth.sh"

cp -R Scripts/load.smth.sh load.$smth.sh
./Scripts/replace.sh NMSC="$NMSC" smth="$smth" INFILE="load.$smth.sh"

cp -R Scripts/cleanup.smth.sh cleanup.$smth.sh
./Scripts/replace.sh NMSC="$NMSC" smth="$smth" INFILE="cleanup.$smth.sh"

mkdir -p Samples/$NMSC
cp -R Scripts/samples/NMSC Samples/$NMSC
mv Samples/$NMSC/NMSC.csproj Samples/$NMSC/$NMSC.csproj
./Scripts/replace.sh NMSC="$NMSC" smth="$smth" INFILE="Samples/$NMSC/$NMSC.csproj"

mv Samples/$NMSC/NMSC.iOS.csproj Samples/$NMSC/$NMSC.iOS.csproj
./Scripts/replace.sh NMSC="$NMSC" smth="$smth" INFILE="Samples/$NMSC/$NMSC.iOS.csproj"

mv Samples/$NMSC/NMSC.Mac.csproj Samples/$NMSC/$NMSC.Mac.csproj
./Scripts/replace.sh NMSC="$NMSC" smth="$smth" INFILE="Samples/$NMSC/$NMSC.Mac.csproj"

mv Samples/$NMSC/NMSC.Android.csproj Samples/$NMSC/$NMSC.Android.csproj
./Scripts/replace.sh NMSC="$NMSC" smth="$smth" INFILE="Samples/$NMSC/$NMSC.Android.csproj"

./Scripts/build.version.sh VERSION="$VERSION" IOSVERSION="$IOSVERSION" ANDROIDVERSION="$ANDROIDVERSION" BUILD="1-beta1" MACVERSION="$MACVERSION" NMSC="$NMSC" VENDOR="$VENDOR" smth="$smth"
sed -E -i "" "s=1-beta1=$BUILD=" NugetPackages/$NMSC.nuspec
sed -E -i "" "s=1-beta1=$BUILD=" NugetPackages/$NMSC.Mac.nuspec
sed -E -i "" "s=1-beta1=$BUILD=" NugetPackages/$NMSC.Android.nuspec
sed -E -i "" "s=1-beta1=$BUILD=" NugetPackages/$NMSC.iOS.nuspec

./Scripts/publish.sh $KEY

