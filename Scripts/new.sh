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
mkdir NugetPackages/$smth

cp -R Scripts/nuspecs/smth/* NugetPackages/$smth

cp -R Scripts/nuspecs/Net.nuspec NugetPackages/$NMSC.nuspec
sed -E -i "" "s=NMSC=$NMSC=" NugetPackages/$NMSC.nuspec
sed -E -i "" "s=GITHUB=$GITHUB=" NugetPackages/$NMSC.nuspec
sed -E -i "" "s=VENDOR=$VENDOR=" NugetPackages/$NMSC.nuspec
sed -E -i "" "s=DDD=$DDD=" NugetPackages/$NMSC.nuspec
sed -E -i "" "s=VENDOR=$VENDOR=" NugetPackages/$NMSC.nuspec
sed -E -i "" "s=DDD=$DDD=" NugetPackages/$NMSC.nuspec
sed -E -i "" "s=SITE=$SITE=" NugetPackages/$NMSC.nuspec
sed -E -i "" "s=smth=$smth=" NugetPackages/$NMSC.nuspec


./Scripts/create.sh GITHUB="$GITHUB" NMSC="$NMSC" VENDOR="$VENDOR" DDD="$DDD" SITE="$SITE" smth="$smth" PLATFORM="Mac"
./Scripts/create.sh GITHUB="$GITHUB" NMSC="$NMSC" VENDOR="$VENDOR" DDD="$DDD" SITE="$SITE" smth="$smth" PLATFORM="iOS"
./Scripts/create.sh GITHUB="$GITHUB" NMSC="$NMSC" VENDOR="$VENDOR" DDD="$DDD" SITE="$SITE" smth="$smth" PLATFORM="Android"
cp -R Scripts/build.smth.sh build.$smth.sh
sed -E -i "" "s=NMSC=$NMSC=" build.$smth.sh
sed -E -i "" "s=smth=$smth=" build.$smth.sh
sed -E -i "" "s=NMSC=$NMSC=" build.$smth.sh
sed -E -i "" "s=smth=$smth=" build.$smth.sh
sed -E -i "" "s=NMSC=$NMSC=" build.$smth.sh
sed -E -i "" "s=smth=$smth=" build.$smth.sh

cp -R Scripts/bind.smth.sh bind.$smth.sh
sed -E -i "" "s=NMSC=$NMSC=" bind.$smth.sh
sed -E -i "" "s=smth=$smth=" bind.$smth.sh
sed -E -i "" "s=NMSC=$NMSC=" bind.$smth.sh
sed -E -i "" "s=smth=$smth=" bind.$smth.sh
sed -E -i "" "s=NMSC=$NMSC=" bind.$smth.sh
sed -E -i "" "s=smth=$smth=" bind.$smth.sh

cp -R Scripts/load.smth.sh load.$smth.sh
sed -E -i "" "s=NMSC=$NMSC=" load.$smth.sh
sed -E -i "" "s=smth=$smth=" load.$smth.sh
sed -E -i "" "s=NMSC=$NMSC=" load.$smth.sh
sed -E -i "" "s=smth=$smth=" load.$smth.sh
sed -E -i "" "s=NMSC=$NMSC=" load.$smth.sh
sed -E -i "" "s=smth=$smth=" load.$smth.sh

cp -R Scripts/cleanup.smth.sh cleanup.$smth.sh
sed -E -i "" "s=NMSC=$NMSC=" cleanup.$smth.sh
sed -E -i "" "s=smth=$smth=" cleanup.$smth.sh
sed -E -i "" "s=NMSC=$NMSC=" cleanup.$smth.sh
sed -E -i "" "s=smth=$smth=" cleanup.$smth.sh
sed -E -i "" "s=NMSC=$NMSC=" cleanup.$smth.sh
sed -E -i "" "s=smth=$smth=" cleanup.$smth.sh

mkdir -p Samples/$NMSC
cp -R Scripts/samples/NMSC Samples/$NMSC
mv Samples/$NMSC/NMSC.csproj Samples/$NMSC/$NMSC.csproj
sed -E -i "" "s=NMSC=$NMSC=" Samples/$NMSC/$NMSC.csproj
sed -E -i "" "s=smth=$smth=" Samples/$NMSC/$NMSC.csproj
sed -E -i "" "s=NMSC=$NMSC=" Samples/$NMSC/$NMSC.csproj
sed -E -i "" "s=smth=$smth=" Samples/$NMSC/$NMSC.csproj
sed -E -i "" "s=NMSC=$NMSC=" Samples/$NMSC/$NMSC.csproj
sed -E -i "" "s=smth=$smth=" Samples/$NMSC/$NMSC.csproj

mv Samples/$NMSC/NMSC.iOS.csproj Samples/$NMSC/$NMSC.iOS.csproj
sed -E -i "" "s=NMSC=$NMSC=" Samples/$NMSC/$NMSC.iOS.csproj
sed -E -i "" "s=smth=$smth=" Samples/$NMSC/$NMSC.iOS.csproj
sed -E -i "" "s=NMSC=$NMSC=" Samples/$NMSC/$NMSC.iOS.csproj
sed -E -i "" "s=smth=$smth=" Samples/$NMSC/$NMSC.iOS.csproj
sed -E -i "" "s=NMSC=$NMSC=" Samples/$NMSC/$NMSC.iOS.csproj
sed -E -i "" "s=smth=$smth=" Samples/$NMSC/$NMSC.iOS.csproj

mv Samples/$NMSC/NMSC.Mac.csproj Samples/$NMSC/$NMSC.Mac.csproj
sed -E -i "" "s=NMSC=$NMSC=" Samples/$NMSC/$NMSC.Mac.csproj
sed -E -i "" "s=smth=$smth=" Samples/$NMSC/$NMSC.Mac.csproj
sed -E -i "" "s=NMSC=$NMSC=" Samples/$NMSC/$NMSC.Mac.csproj
sed -E -i "" "s=smth=$smth=" Samples/$NMSC/$NMSC.Mac.csproj
sed -E -i "" "s=NMSC=$NMSC=" Samples/$NMSC/$NMSC.Mac.csproj
sed -E -i "" "s=smth=$smth=" Samples/$NMSC/$NMSC.Mac.csproj

mv Samples/$NMSC/NMSC.Android.csproj Samples/$NMSC/$NMSC.Android.csproj
sed -E -i "" "s=NMSC=$NMSC=" Samples/$NMSC/$NMSC.Android.csproj
sed -E -i "" "s=smth=$smth=" Samples/$NMSC/$NMSC.Android.csproj
sed -E -i "" "s=NMSC=$NMSC=" Samples/$NMSC/$NMSC.Android.csproj
sed -E -i "" "s=smth=$smth=" Samples/$NMSC/$NMSC.Android.csproj
sed -E -i "" "s=NMSC=$NMSC=" Samples/$NMSC/$NMSC.Android.csproj
sed -E -i "" "s=smth=$smth=" Samples/$NMSC/$NMSC.Android.csproj

./Scripts/build.version.sh VERSION="$VERSION" IOSVERSION="$IOSVERSION" ANDROIDVERSION="$ANDROIDVERSION" BUILD="1-beta1" MACVERSION="$MACVERSION" NMSC="$NMSC" VENDOR="$VENDOR" smth="$smth"
sed -E -i "" "s=1-beta1=$BUILD=" NugetPackages/$NMSC.nuspec
sed -E -i "" "s=1-beta1=$BUILD=" NugetPackages/$NMSC.Mac.nuspec
sed -E -i "" "s=1-beta1=$BUILD=" NugetPackages/$NMSC.Android.nuspec
sed -E -i "" "s=1-beta1=$BUILD=" NugetPackages/$NMSC.iOS.nuspec

./Scripts/publish.sh $KEY

