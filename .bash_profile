# -- BASE
if [ -f "${HOME}/bin/global_env" ]; then
    source "${HOME}/bin/global_env"
fi
# -- bin
export PATH=${HOME}/bin:${PATH}
# -- vmware
export vmware_lib="/Applications/VMware Fusion.app/Contents/Library"
export PATH="${vmware_lib}:${PATH}"
# -- composer
export composer_bin="${HOME}/.composer/vendor/bin/laravel"
export PATH="${composer_bin}:${PATH}"
# -- gem
export GEM_HOME=${HOME}/gems
export GEM_BIN=${GEM_HOME}/bin
export PATH="${GEM_BIN}:${PATH}"
# -- xCode
export xcode_plugin="${HOME}/Library/Application Support/Developer/Shared/Xcode/Plug-ins"
export xcode_home="/Applications/Xcode.app"
export xcode_sdks_iphoneos="${xcode_home}/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs"
export xcode_sdks_iphonesimulator="${xcode_home}/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs"
export xcode_sdks_macosx="${xcode_home}/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs"

if [ -f "${HOME}/.bashrc" ]; then
    source "${HOME}/.bashrc"
fi
