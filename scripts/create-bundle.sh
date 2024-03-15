flutter clean
flutter build appbundle --release
cd ..
# shellcheck disable=SC2164
cd "(pwd)/build/app/outputs/bundle/release/"
mv app-release.aab FirstFlutterBundle.aab
open .