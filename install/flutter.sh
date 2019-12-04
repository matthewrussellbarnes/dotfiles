## TMP DIRS
TMP_DIR=~/install_tmp
mkdir -p "$TMP_DIR" && cd "$TMP_DIR"

flutter_version=$(flutter --version)
if [ -z $flutter_version ]; then
    echo "installing flutter"
    git clone -b beta https://github.com/flutter/flutter.git ~/.flutterSDK
else
    echo "upgrading flutter"
    flutter channel beta
    flutter upgrade
fi

echo "installing libimobiledevice"
brew install --HEAD libimobiledevice
brew install -- HEAD usbmuxd

echo "installing ideviceinstaller"
brew install ideviceinstaller cocoapods ios-deploy

pod setup

# echo "installing cocoapods"
# brew install cocoapods
#
# echo "installing ios-deploy"
# brew install ios-deploy

