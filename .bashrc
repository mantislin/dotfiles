# -- BASE
source "${HOME}/bin/global_env"
# -- bin
export PATH=${HOME}/bin:${PATH}
# -- vmware
vmware_lib="/Applications/VMware Fusion.app/Contents/Library"
export PATH="${vmware_lib}:${PATH}"
# -- composer
composer_bin="${HOME}/.composer/vendor/bin/laravel"
export PATH="${composer_bin}:${PATH}"
# -- gem
GEM_HOME=${HOME}/gems
GEM_BIN=${GEM_HOME}/bin
export PATH="${GEM_BIN}:${PATH}"
# -- xCode
xcode_plugin="${HOME}/Library/Application Support/Developer/Shared/Xcode/Plug-ins"
xcode_home="/Applications/Xcode.app"
xcode_sdks_iphoneos="${xcode_home}/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs"
xcode_sdks_iphonesimulator="${xcode_home}/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs"
xcode_sdks_macosx="${xcode_home}/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs"
