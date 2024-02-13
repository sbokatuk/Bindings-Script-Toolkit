#!/bin/sh
for ARGUMENT in "$@"
do
   KEY=$(echo $ARGUMENT | cut -f1 -d=)

   KEY_LENGTH=${#KEY}
   VALUE="${ARGUMENT:$KEY_LENGTH+1}"

   export "$KEY"="$VALUE"
done

if [ -z "$TYPE" ]
then
echo "for cleaning add TYPE parameter all/nuget/native/version"
else

if [[ "$TYPE" == "all" ]]
then
rm -rf Bindings
mkdir Bindings
rm -rf Native
mkdir Native
rm -rf Downloads
mkdir Downloads
rm -rf NugetPackages
mkdir NugetPackages
fi
if [[ "$TYPE" == "nuget" ]]
then
rm -rf NugetPackages/*.nupkg
fi
if [[ "$TYPE" == "version" ]]
then

sed -E -i "" "s=$OLD=$BUILD=" NugetPackages/$NMSC.nuspec
sed -E -i "" "s=$OLD=$BUILD=" NugetPackages/$NMSC.Mac.nuspec
sed -E -i "" "s=$OLD=$BUILD=" NugetPackages/$NMSC.Android.nuspec
sed -E -i "" "s=$OLD=$BUILD=" NugetPackages/$NMSC.iOS.nuspec
fi

if [[ "$TYPE" == "native" ]]
then
rm -rf Native
mkdir Native
rm -rf Downloads
mkdir Downloads
fi

fi



