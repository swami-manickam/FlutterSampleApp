flutter clean
flutter build apk --release
cd..
# shellcheck disable=SC2164
cd "(pwd)/build/app/outputs/flutter-apk/"
mv app-release.apk FirstFlutter.apk
open .