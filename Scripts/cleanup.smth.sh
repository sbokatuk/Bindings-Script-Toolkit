#!/bin/sh
for ARGUMENT in "$@"
do
   KEY=$(echo $ARGUMENT | cut -f1 -d=)

   KEY_LENGTH=${#KEY}
   VALUE="${ARGUMENT:$KEY_LENGTH+1}"

   export "$KEY"="$VALUE"
done

rm -rf NugetPackages/NMSC*.nupkg
rm -rf Bindings/NMSC.Mac/bin
rm -rf Bindings/NMSC.Mac/obj
rm -rf Bindings/NMSC.Android/bin
rm -rf Bindings/NMSC.Android/obj
rm -rf Bindings/NMSC.iOS/bin
rm -rf Bindings/NMSC.iOS/obj
rm -rf Downloads/smthandroid
rm -rf Downloads/smthmac
rm -rf Downloads/smthios


if [ -z "$Native" ]
then
rm -rf Native/NMSC.Mac
rm -rf Native/NMSC.Android
rm -rf Native/NMSC.iOS
rm -rf Bindings/NMSC.Mac/lib
rm -rf Bindings/NMSC.Android/lib
rm -rf Bindings/NMSC.iOS/lib
fi

if [ -z "$SELF" ]
then
rm -rf Native/NMSC.Mac
rm -rf Native/NMSC.Android
rm -rf Native/NMSC.iOS
rm -rf Samples/NMSC.Mac
rm -rf Samples/NMSC.Android
rm -rf Samples/NMSC.iOS
rm -rf Bindings/NMSC.Mac
rm -rf Bindings/NMSC.Android
rm -rf Bindings/NMSC.iOS
rm -rf Downloads/smthandroid
rm -rf Downloads/smthmac
rm -rf Downloads/smthios
rm -rf NugetPackages/smthandroid
rm -rf NugetPackages/smthmac
rm -rf NugetPackages/smthios
rm -rf NugetPackages/NMSC.nuspec
rm -rf NugetPackages/NMSC.Mac.nuspec
rm -rf NugetPackages/NMSC.Android.nuspec
rm -rf NugetPackages/NMSC.iOS.nuspec
rm -rf load.smth.sh
rm -rf bind.smth.sh
rm -rf build.smth.sh
rm -rf cleanup.smth.sh
fi

if [ -z "$OLD" ]
then
sed -E -i "" "s=$OLD=$BUILD=" NugetPackages/NMSC.nuspec
sed -E -i "" "s=$OLD=$BUILD=" NugetPackages/NMSC.Mac.nuspec
sed -E -i "" "s=$OLD=$BUILD=" NugetPackages/NMSC.Android.nuspec
sed -E -i "" "s=$OLD=$BUILD=" NugetPackages/NMSC.iOS.nuspec
fi


