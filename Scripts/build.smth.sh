#!/bin/sh

# ./Scripts/build.smth.sh BUILD="1-beta1" VERSION="6.0.0" IOSVERSION="6.0.0" ANDROIDVERSION="6.0.0" MACVERSION="6.0.0"
for ARGUMENT in "$@"
do
   KEY=$(echo $ARGUMENT | cut -f1 -d=)

   KEY_LENGTH=${#KEY}
   VALUE="${ARGUMENT:$KEY_LENGTH+1}"

   export "$KEY"="$VALUE"
done

if [ -z "$VERSION" ]
then
echo "No target Argument for nuget version"
else
echo "$IOSVERSION" > Bindings/NMSC.iOS/Readme.md
sed -E -i "" "s/<Version>([0-9]{1,}\.)+[0-9]{1,}/<Version>$IOSVERSION.7/" Bindings/NMSC.iOS/NMSC.iOS.csproj
sed -E -i "" "s/<TargetFramework>net([0-9]{1,}\.)+[0-9]{1,}-ios/<TargetFramework>net7.0-ios/" Bindings/NMSC.iOS/NMSC.iOS.csproj
rm -rf Bindings/NMSC.iOS/bin
rm -rf Bindings/NMSC.iOS/obj
dotnet pack Bindings/NMSC.iOS/NMSC.iOS.csproj --output NugetPackages --force --verbosity quiet --property WarningLevel=0 /clp:ErrorsOnly
sed -E -i "" "s/<Version>([0-9]{1,}\.)+[0-9]{1,}/<Version>$IOSVERSION.8/" Bindings/NMSC.iOS/NMSC.iOS.csproj
sed -E -i "" "s/<TargetFramework>net([0-9]{1,}\.)+[0-9]{1,}-ios/<TargetFramework>net8.0-ios/" Bindings/NMSC.iOS/NMSC.iOS.csproj
rm -rf Bindings/NMSC.iOS/bin
rm -rf Bindings/NMSC.iOS/obj
dotnet pack Bindings/NMSC.iOS/NMSC.iOS.csproj --output NugetPackages --force --verbosity quiet --property WarningLevel=0 /clp:ErrorsOnly
cd NugetPackages
rm -rf smthios
unzip -n -q NMSC.iOS.$IOSVERSION.7.nupkg -d smthios
unzip -n -q NMSC.iOS.$IOSVERSION.8.nupkg -d smthios
rm NMSC.iOS.$IOSVERSION.7.nupkg
rm NMSC.iOS.$IOSVERSION.8.nupkg
cd ..
echo "ios part nugets generated"
echo "$MACVERSION" > Bindings/NMSC.Mac/Readme.md
sed -E -i "" "s/<Version>([0-9]{1,}\.)+[0-9]{1,}/<Version>$MACVERSION.7/" Bindings/NMSC.Mac/NMSC.Mac.csproj
sed -E -i "" "s/<TargetFramework>net([0-9]{1,}\.)+[0-9]{1,}-maccatalyst/<TargetFramework>net7.0-maccatalyst/" Bindings/NMSC.Mac/NMSC.Mac.csproj
rm -rf Bindings/NMSC.Mac/bin
rm -rf Bindings/NMSC.Mac/obj
dotnet pack Bindings/NMSC.Mac/NMSC.Mac.csproj --output NugetPackages --force --verbosity quiet --property WarningLevel=0 /clp:ErrorsOnly
sed -E -i "" "s/<Version>([0-9]{1,}\.)+[0-9]{1,}/<Version>$MACVERSION.8/" Bindings/NMSC.Mac/NMSC.Mac.csproj
sed -E -i "" "s/<TargetFramework>net([0-9]{1,}\.)+[0-9]{1,}-maccatalyst/<TargetFramework>net8.0-maccatalyst/" Bindings/NMSC.Mac/NMSC.Mac.csproj
rm -rf Bindings/NMSC.Mac/bin
rm -rf Bindings/NMSC.Mac/obj
dotnet pack Bindings/NMSC.Mac/NMSC.Mac.csproj --output NugetPackages --force --verbosity quiet --property WarningLevel=0 /clp:ErrorsOnly
cd NugetPackages
rm -rf smthmac
unzip -n -q NMSC.Mac.$MACVERSION.7.nupkg -d smthmac
unzip -n -q NMSC.Mac.$MACVERSION.8.nupkg -d smthmac
rm NMSC.Mac.$MACVERSION.7.nupkg
rm NMSC.Mac.$MACVERSION.8.nupkg
cd ..
echo "mac part nugets generated"
echo "$ANDROIDVERSION" > Bindings/NMSC.Android/Readme.md
sed -E -i "" "s/<Version>([0-9]{1,}\.)+[0-9]{1,}/<Version>$ANDROIDVERSION.7/" Bindings/NMSC.Android/NMSC.Android.csproj
sed -E -i "" "s/<TargetFramework>net([0-9]{1,}\.)+[0-9]{1,}-android/<TargetFramework>net7.0-android/" Bindings/NMSC.Android/NMSC.Android.csproj
rm -rf Bindings/NMSC.Android/bin
rm -rf Bindings/NMSC.Android/obj
dotnet pack Bindings/NMSC.Android/NMSC.Android.csproj --output NugetPackages --force --verbosity quiet --property WarningLevel=0 /clp:ErrorsOnly
sed -E -i "" "s/<Version>([0-9]{1,}\.)+[0-9]{1,}/<Version>$ANDROIDVERSION.8/" Bindings/NMSC.Android/NMSC.Android.csproj
sed -E -i "" "s/<TargetFramework>net([0-9]{1,}\.)+[0-9]{1,}-android/<TargetFramework>net8.0-android/" Bindings/NMSC.Android/NMSC.Android.csproj
rm -rf Bindings/NMSC.Android/bin
rm -rf Bindings/NMSC.Android/obj
dotnet pack Bindings/NMSC.Android/NMSC.Android.csproj --output NugetPackages --force --verbosity quiet --property WarningLevel=0 /clp:ErrorsOnly
cd NugetPackages
rm -rf smthandroid
unzip -n -q NMSC.Android.$ANDROIDVERSION.7.nupkg -d smthandroid
unzip -n -q NMSC.Android.$ANDROIDVERSION.8.nupkg -d smthandroid
rm NMSC.Android.$ANDROIDVERSION.7.nupkg
rm NMSC.Android.$ANDROIDVERSION.8.nupkg
cd ..
echo "android part nugets generated"
cd NugetPackages

cp -R smthandroid/Readme.md smthandroid/Readme.txt
cp -R smthmac/Readme.md smthmac/Readme.txt
cp -R smthios/Readme.md smthios/Readme.txt
cp -R smth/Readme.md smth/Readme.txt

mkdir smthios/native/
mkdir smthios/native/lib
mkdir smthios/native/lib/ios
cp -R smthios/lib/net8.0-ios17.2/NMSC.iOS.resources smthios/native/lib/ios

rm -rf smthios/lib/net8.0-ios17.2/NMSC.iOS.resources
rm -rf smthios/lib/net7.0-ios16.1/NMSC.iOS.resources

mkdir smthmac/native
mkdir smthmac/native/lib
mkdir smthmac/native/lib/mac
cp -R smthmac/lib/net8.0-maccatalyst17.2/NMSC.Mac.resources smthmac/native/lib/mac

rm -rf smthmac/lib/net8.0-maccatalyst17.2/NMSC.Mac.resources
rm -rf smthmac/lib/net7.0-maccatalyst16.1/NMSC.Mac.resources

mkdir smthandroid/native
mkdir smthandroid/native/lib
mkdir smthandroid/native/lib/android
cp -R smthandroid/lib/net8.0-android34.0/*.aar smthandroid/native/lib/android

rm smthandroid/lib/net8.0-android34.0/*.aar
rm smthandroid/lib/net7.0-android33.0/*.aar 



sed -E -i "" "s/<version>([0-9]{1,}\.)+[0-9]{1,}/<version>$ANDROIDVERSION.$BUILD/" NMSC.Android.nuspec
sed -E -i "" "s/<version>([0-9]{1,}\.)+[0-9]{1,}/<version>$IOSVERSION.$BUILD/" NMSC.iOS.nuspec
sed -E -i "" "s/<version>([0-9]{1,}\.)+[0-9]{1,}/<version>$MACVERSION.$BUILD/" NMSC.Mac.nuspec
sed -E -i "" "s/<version>([0-9]{1,}\.)+[0-9]{1,}/<version>$VERSION.$BUILD/" NMSC.nuspec

nuget pack NMSC.Android.nuspec
nuget pack NMSC.iOS.nuspec
nuget pack NMSC.Mac.nuspec
nuget pack NMSC.nuspec

rm -rf smthandroid
rm -rf smthios
rm -rf smthmac

cd ..
sed -E -i "" "s/NMSC.Android\" Version=\([0-9]{1,}\.)+[0-9]{1,}/NMSC.Android\" Version=\$ANDROIDVERSION.$BUILD/" Samples/NMSC/NMSC.Android.csproj
sed -E -i "" "s/NMSC.iOS\" Version=\([0-9]{1,}\.)+[0-9]{1,}/NMSC.iOS\" Version=\$IOSVERSION.$BUILD/" Samples/NMSC/NMSC.iOS.csproj
sed -E -i "" "s/NMSC.Mac\" Version=\([0-9]{1,}\.)+[0-9]{1,}/NMSC.Mac\" Version=\$MACVERSION.$BUILD/" Samples/NMSC/NMSC.Mac.csproj
sed -E -i "" "s/NMSC\" Version=\"([0-9]{1,}\.)+[0-9]{1,}/NMSC\" Version=\$VERSION.$BUILD/" Samples/NMSC/NMSC.csproj

cd Samples/NMSC
rm -rf bin
rm -rf obj
dotnet build NMSC.csproj -c Release -f net8.0-ios --verbosity quiet --property WarningLevel=0 /clp:ErrorsOnly
rm -rf bin
rm -rf obj
dotnet build NMSC.csproj -c Release -f net8.0-maccatalyst --verbosity quiet --property WarningLevel=0 /clp:ErrorsOnly
rm -rf bin
rm -rf obj
dotnet build NMSC.csproj -c Release -f net8.0-android --verbosity quiet --property WarningLevel=0 /clp:ErrorsOnly
rm -rf bin
rm -rf obj
dotnet build NMSC.iOS.csproj -c Release -f net8.0-ios --verbosity quiet --property WarningLevel=0 /clp:ErrorsOnly
rm -rf bin
rm -rf obj
dotnet build NMSC.Mac.csproj -c Release -f net8.0-maccatalyst --verbosity quiet --property WarningLevel=0 /clp:ErrorsOnly
rm -rf bin
rm -rf obj
dotnet build NMSC.Android.csproj -c Release -f net8.0-android --verbosity quiet --property WarningLevel=0 /clp:ErrorsOnly


# if  [ -z "$3" ]
# then
# echo "package ready"
# unzip -n -q OpenTok.Net.webrtc.Dependency.Android.$VERSION.$2.nupkg -d webrtc
# else 
# dotnet nuget push OpenTok.Net.webrtc.Dependency.Android.$VERSION.$2.nupkg --api-key $3 --source https://api.nuget.org/v3/index.json --timeout 3000000
# # rm OpenTok.Net.webrtc.Dependency.Android.$VERSION.$2.nupkg
# fi
# cd ..
fi