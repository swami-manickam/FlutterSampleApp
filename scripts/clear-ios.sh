cd ..
# shellcheck disable=SC2164
cd ios
rm -rf Pods
rm Podfile.lock
cd ..
flutter clean
flutter pub get
# shellcheck disable=SC2164
cd ios
pod install