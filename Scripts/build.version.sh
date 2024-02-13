#!/bin/sh

#GITHUB="https://github.com/sbokatuk/Net.Agora" VENDOR="Agora" DDD="MediaplayerKit" SITE="https://www.agora.io/en/" BUILD="1" smth="mk" VERSION="1.3.0" IOSVERSION="1.3.0" ANDROIDVERSION="1.3.0" MACVERSION="1.3.0" NMSC="Net.Agora.MediaplayerKit" 
# ./Scripts/build.smth.sh BUILD="1-beta1" smth="iw" VERSION="2.16.62" IOSVERSION="2.16.62" ANDROIDVERSION="2.16.59" MACVERSION="2.16.62" NMSC="Net.Agora.InteractiveWhiteboard"  
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
echo "$IOSVERSION" > Bindings/$NMSC.iOS/Readme.md
sed -E -i "" "s/<Version>([0-9]{1,}\.)+[0-9]{1,}/<Version>$IOSVERSION.7/" Bindings/$NMSC.iOS/$NMSC.iOS.csproj
sed -E -i "" "s/<TargetFramework>net([0-9]{1,}\.)+[0-9]{1,}-ios/<TargetFramework>net7.0-ios/" Bindings/$NMSC.iOS/$NMSC.iOS.csproj
rm -rf Bindings/$NMSC.iOS/bin
rm -rf Bindings/$NMSC.iOS/obj
dotnet pack Bindings/$NMSC.iOS/$NMSC.iOS.csproj --output NugetPackages --force --verbosity quiet --property WarningLevel=0 /clp:ErrorsOnly
sed -E -i "" "s/<Version>([0-9]{1,}\.)+[0-9]{1,}/<Version>$IOSVERSION.8/" Bindings/$NMSC.iOS/$NMSC.iOS.csproj
sed -E -i "" "s/<TargetFramework>net([0-9]{1,}\.)+[0-9]{1,}-ios/<TargetFramework>net8.0-ios/" Bindings/$NMSC.iOS/$NMSC.iOS.csproj
rm -rf Bindings/$NMSC.iOS/bin
rm -rf Bindings/$NMSC.iOS/obj
dotnet pack Bindings/$NMSC.iOS/$NMSC.iOS.csproj --output NugetPackages --force --verbosity quiet --property WarningLevel=0 /clp:ErrorsOnly
cd NugetPackages
rm -rf ${smth}ios
unzip -n -q $NMSC.iOS.$IOSVERSION.7.nupkg -d ${smth}ios
unzip -n -q $NMSC.iOS.$IOSVERSION.8.nupkg -d ${smth}ios
rm $NMSC.iOS.$IOSVERSION.7.nupkg
rm $NMSC.iOS.$IOSVERSION.8.nupkg
cd ..
echo "ios part nugets generated"
echo "$MACVERSION" > Bindings/$NMSC.Mac/Readme.md
sed -E -i "" "s/<Version>([0-9]{1,}\.)+[0-9]{1,}/<Version>$MACVERSION.7/" Bindings/$NMSC.Mac/$NMSC.Mac.csproj
sed -E -i "" "s/<TargetFramework>net([0-9]{1,}\.)+[0-9]{1,}-maccatalyst/<TargetFramework>net7.0-maccatalyst/" Bindings/$NMSC.Mac/$NMSC.Mac.csproj
rm -rf Bindings/$NMSC.Mac/bin
rm -rf Bindings/$NMSC.Mac/obj
dotnet pack Bindings/$NMSC.Mac/$NMSC.Mac.csproj --output NugetPackages --force --verbosity quiet --property WarningLevel=0 /clp:ErrorsOnly
sed -E -i "" "s/<Version>([0-9]{1,}\.)+[0-9]{1,}/<Version>$MACVERSION.8/" Bindings/$NMSC.Mac/$NMSC.Mac.csproj
sed -E -i "" "s/<TargetFramework>net([0-9]{1,}\.)+[0-9]{1,}-maccatalyst/<TargetFramework>net8.0-maccatalyst/" Bindings/$NMSC.Mac/$NMSC.Mac.csproj
rm -rf Bindings/$NMSC.Mac/bin
rm -rf Bindings/$NMSC.Mac/obj
dotnet pack Bindings/$NMSC.Mac/$NMSC.Mac.csproj --output NugetPackages --force --verbosity quiet --property WarningLevel=0 /clp:ErrorsOnly
cd NugetPackages
rm -rf ${smth}mac
unzip -n -q $NMSC.Mac.$MACVERSION.7.nupkg -d ${smth}mac
unzip -n -q $NMSC.Mac.$MACVERSION.8.nupkg -d ${smth}mac
rm $NMSC.Mac.$MACVERSION.7.nupkg
rm $NMSC.Mac.$MACVERSION.8.nupkg
cd ..
echo "mac part nugets generated"
echo "$ANDROIDVERSION" > Bindings/$NMSC.Android/Readme.md
sed -E -i "" "s/<Version>([0-9]{1,}\.)+[0-9]{1,}/<Version>$ANDROIDVERSION.7/" Bindings/$NMSC.Android/$NMSC.Android.csproj
sed -E -i "" "s/<TargetFramework>net([0-9]{1,}\.)+[0-9]{1,}-android/<TargetFramework>net7.0-android/" Bindings/$NMSC.Android/$NMSC.Android.csproj
rm -rf Bindings/$NMSC.Android/bin
rm -rf Bindings/$NMSC.Android/obj
dotnet pack Bindings/$NMSC.Android/$NMSC.Android.csproj --output NugetPackages --force --verbosity quiet --property WarningLevel=0 /clp:ErrorsOnly
sed -E -i "" "s/<Version>([0-9]{1,}\.)+[0-9]{1,}/<Version>$ANDROIDVERSION.8/" Bindings/$NMSC.Android/$NMSC.Android.csproj
sed -E -i "" "s/<TargetFramework>net([0-9]{1,}\.)+[0-9]{1,}-android/<TargetFramework>net8.0-android/" Bindings/$NMSC.Android/$NMSC.Android.csproj
rm -rf Bindings/$NMSC.Android/bin
rm -rf Bindings/$NMSC.Android/obj
dotnet pack Bindings/$NMSC.Android/$NMSC.Android.csproj --output NugetPackages --force --verbosity quiet --property WarningLevel=0 /clp:ErrorsOnly
cd NugetPackages
rm -rf ${smth}android
unzip -n -q $NMSC.Android.$ANDROIDVERSION.7.nupkg -d ${smth}android
unzip -n -q $NMSC.Android.$ANDROIDVERSION.8.nupkg -d ${smth}android
rm $NMSC.Android.$ANDROIDVERSION.7.nupkg
rm $NMSC.Android.$ANDROIDVERSION.8.nupkg
cd ..
echo "android part nugets generated"
cd NugetPackages

cp -R ${smth}android/Readme.md ${smth}android/Readme.txt
cp -R ${smth}mac/Readme.md ${smth}mac/Readme.txt
cp -R ${smth}ios/Readme.md ${smth}ios/Readme.txt
cp -R ${smth}/Readme.md ${smth}/Readme.txt

mkdir ${smth}ios/native/
mkdir ${smth}ios/native/lib
mkdir ${smth}ios/native/lib/ios
cp -R ${smth}ios/lib/net8.0-ios17.2/$NMSC.iOS.resources ${smth}ios/native/lib/ios

rm -rf ${smth}ios/lib/net8.0-ios17.2/$NMSC.iOS.resources
rm -rf ${smth}ios/lib/net7.0-ios16.1/$NMSC.iOS.resources

mkdir ${smth}mac/native
mkdir ${smth}mac/native/lib
mkdir ${smth}mac/native/lib/mac
cp -R ${smth}mac/lib/net8.0-maccatalyst17.2/$NMSC.Mac.resources ${smth}mac/native/lib/mac

rm -rf ${smth}mac/lib/net8.0-maccatalyst17.2/$NMSC.Mac.resources
rm -rf ${smth}mac/lib/net7.0-maccatalyst16.1/$NMSC.Mac.resources

mkdir ${smth}android/native
mkdir ${smth}android/native/lib
mkdir ${smth}android/native/lib/android
cp -R ${smth}android/lib/net8.0-android34.0/*.aar ${smth}android/native/lib/android

rm ${smth}android/lib/net8.0-android34.0/*.aar
rm ${smth}android/lib/net7.0-android33.0/*.aar 


sed -E -i "" "s/<version>([0-9]{1,}\.)+[0-9]{1,}/<version>$ANDROIDVERSION.$BUILD/" $NMSC.Android.nuspec
sed -E -i "" "s/<version>([0-9]{1,}\.)+[0-9]{1,}/<version>$IOSVERSION.$BUILD/" $NMSC.iOS.nuspec
sed -E -i "" "s/<version>([0-9]{1,}\.)+[0-9]{1,}/<version>$MACVERSION.$BUILD/" $NMSC.Mac.nuspec
sed -E -i "" "s/<version>([0-9]{1,}\.)+[0-9]{1,}/<version>$VERSION.$BUILD/" $NMSC.nuspec



nuget pack $NMSC.Android.nuspec
nuget pack $NMSC.iOS.nuspec
nuget pack $NMSC.Mac.nuspec
nuget pack $NMSC.nuspec

rm -rf ${smth}android
rm -rf ${smth}ios
rm -rf ${smth}mac
cd ..
sed -E -i "" "s/$NMSC.Android\" Version=\([0-9]{1,}\.)+[0-9]{1,}/$NMSC.Android\" Version=\$ANDROIDVERSION.$BUILD/" Samples/$NMSC/$NMSC.Android.csproj
sed -E -i "" "s/$NMSC.iOS\" Version=\([0-9]{1,}\.)+[0-9]{1,}/$NMSC.iOS\" Version=\$IOSVERSION.$BUILD/" Samples/$NMSC/$NMSC.iOS.csproj
sed -E -i "" "s/$NMSC.Mac\" Version=\([0-9]{1,}\.)+[0-9]{1,}/$NMSC.Mac\" Version=\$MACVERSION.$BUILD/" Samples/$NMSC/$NMSC.Mac.csproj
sed -E -i "" "s/$NMSC\" Version=\"([0-9]{1,}\.)+[0-9]{1,}/$NMSC\" Version=\$VERSION.$BUILD/" Samples/$NMSC/$NMSC.csproj

cd Samples/$NMSC
rm -rf bin
rm -rf obj
dotnet build $NMSC.csproj -c Release -f net8.0-ios --verbosity quiet --property WarningLevel=0 /clp:ErrorsOnly
rm -rf bin
rm -rf obj
dotnet build $NMSC.csproj -c Release -f net8.0-maccatalyst --verbosity quiet --property WarningLevel=0 /clp:ErrorsOnly
rm -rf bin
rm -rf obj
dotnet build $NMSC.csproj -c Release -f net8.0-android --verbosity quiet --property WarningLevel=0 /clp:ErrorsOnly
rm -rf bin
rm -rf obj
dotnet build $NMSC.iOS.csproj -c Release -f net8.0-ios --verbosity quiet --property WarningLevel=0 /clp:ErrorsOnly
rm -rf bin
rm -rf obj
dotnet build $NMSC.Mac.csproj -c Release -f net8.0-maccatalyst --verbosity quiet --property WarningLevel=0 /clp:ErrorsOnly
rm -rf bin
rm -rf obj
dotnet build $NMSC.Android.csproj -c Release -f net8.0-android --verbosity quiet --property WarningLevel=0 /clp:ErrorsOnly




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