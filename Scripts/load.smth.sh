#!/bin/sh

for ARGUMENT in "$@"
do
   KEY=$(echo $ARGUMENT | cut -f1 -d=)

   KEY_LENGTH=${#KEY}
   VALUE="${ARGUMENT:$KEY_LENGTH+1}"

   export "$KEY"="$VALUE"
done


if [ -z "$VERSION" ]
then
echo "load specific version"
else

# android

mkdir -p Downloads/smthandroid
# cd Downloads/smthandroid

# github version
# git clone https://github.com/ant-media/WebRTC-Android-SDK
# curl -L https://github.com/ant-media/WebRTC-Android-SDK/archive/refs/heads/master.zip > Downloads/smthandroid/src.zip

# maven VERSION

# curl -L https://repo1.maven.org/maven2/com/opentok/android/opentok-android-sdk/maven-metadata.xml > Downloads/smthandroid/android.xml
# AndroidVersion=$(cat Downloads/smthandroid/android.xml | grep "<latest>" | grep -Eo '([0-9]{1,}\.)+[0-9]{1,}');
# # curl -L https://repo1.maven.org/maven2/com/opentok/android/opentok-android-sdk/$AndroidVersion/opentok-android-sdk-$AndroidVersion.aar > Downloads/smthandroid/opentok-android-sdk.aar
# # ignore previous row - download from parsed pom file
# curl -L https://repo1.maven.org/maven2/com/opentok/android/opentok-android-sdk/$AndroidVersion/opentok-android-sdk-$AndroidVersion.pom > Downloads/smthandroid/opentok-android-sdk.pom
# 
# sed -E -i "" "s/<ReleaseVersion>([0-9]{1,}\.)+[0-9]{1,}/<ReleaseVersion>${AndroidVersion}.1/" Bindings/NMSC.Android/NMSC.Android.csproj
# 
# groups=$(grep groupId Downloads/smthandroid/opentok-android-sdk.pom | sed -E 's/<.{0,1}groupId>//g' | awk '{print $1}');
# artifacts=$(grep artifactId Downloads/smthandroid/opentok-android-sdk.pom | sed -E 's/<.{0,1}artifactId>//g' | awk '{print $1}');
# versions=$(grep version Downloads/smthandroid/opentok-android-sdk.pom | sed -E 's/<.{0,1}version>//g' | tail -n +2 | awk '{print $1}');
# 
# count=$(grep groupId Downloads/smthandroid/opentok-android-sdk.pom | sed -E 's/<.{0,1}groupId>//g' | awk '{print $1}' | wc -l | awk '{print $1}')
# 
# for i in $(seq "$count")
# do
# currentGroup=$(echo "$groups" | sed -n ''$i' p');
# groupLink=${currentGroup//./\/}
# currentArtifact=$(echo "$artifacts" | sed -n ''$i' p');
# currentVersion=$(echo "$versions" | sed -n ''$i' p');
# 
# if [[ "$currentVersion" != "<?xml" ]]
# then
# if [[ $currentGroup =~ ^"com.google" ]] || [[ $currentGroup =~ ^"androidx" ]]
# then
# echo "Skip download $i of $count android lib, looks like default (google or android): $groupLink/$currentArtifact/$currentVersion"
# else
# echo "Downloading $i of $count android libs: https://repo1.maven.org/maven2/$groupLink/$currentArtifact/$currentVersion/$currentArtifact-$currentVersion.aar"
# curl -L https://repo1.maven.org/maven2/$groupLink/$currentArtifact/$currentVersion/$currentArtifact-$currentVersion.aar > Downloads/smthandroid/$currentArtifact.aar
# fi
# fi
# done
# 
# mv Downloads/smthandroid/*.aar Bindings/NMSC.Android/lib

echo "Android lib downloaded! $AndroidVersion"
# ios

mkdir -p Downloads/smthios
# cd Downloads/smthios
# git clone https://github.com/ant-media/WebRTC-Android-SDK
# curl -L https://github.com/ant-media/WebRTC-Android-SDK/archive/refs/heads/master.zip > Downloads/smthios/src.zip

# cd Downloads/smthios
# git clone https://github.com/opentok/opentok-ios-sdk-samples
# cd opentok-ios-sdk-samples/Basic-Video-Chat-XCFramework
# pod install
# pod update
# cd ../../..

# mv Downloads/opentok-ios-sdk-samples/Basic-Video-Chat-XCFramework/Pods/OTXCFramework/OpenTok.xcframework Bindings/NMSC.iOS/lib
# iOSVersion=$(cat Downloads/opentok-ios-sdk-samples/Basic-Video-Chat-XCFramework/Podfile.lock | grep "OTXCFramework (=" | grep -Eo '([0-9]{1,}\.)+[0-9]{1,}');
# sed -E -i "" "s/<ReleaseVersion>([0-9]{1,}\.)+[0-9]{1,}/<ReleaseVersion>${iOSVersion}/" Bindings/NMSC.iOS/NMSC.iOS.csproj

echo "iOS lib downloaded! $iOSVersion"
# mac

mkdir -p Downloads/smthmac
# cd Downloads/smthmac
# git clone https://github.com/ant-media/WebRTC-Android-SDK
# curl -L https://github.com/ant-media/WebRTC-Android-SDK/archive/refs/heads/master.zip > Downloads/smthmac/src.zip

# cd Downloads/smthmac
# git clone https://github.com/opentok/opentok-ios-sdk-samples
# cd opentok-ios-sdk-samples/Basic-Video-Chat-XCFramework
# pod install
# pod update
# cd ../../..

# mv Downloads/opentok-ios-sdk-samples/Basic-Video-Chat-XCFramework/Pods/OTXCFramework/OpenTok.xcframework Bindings/NMSC.Mac/lib
# MacVersion=$(cat Downloads/opentok-ios-sdk-samples/Basic-Video-Chat-XCFramework/Podfile.lock | grep "OTXCFramework (=" | grep -Eo '([0-9]{1,}\.)+[0-9]{1,}');
# sed -E -i "" "s/<ReleaseVersion>([0-9]{1,}\.)+[0-9]{1,}/<ReleaseVersion>${iOSVersion}/" Bindings/NMSC.Mac/NMSC.Mac.csproj

echo "Mac lib downloaded! $MacVersion"
fi