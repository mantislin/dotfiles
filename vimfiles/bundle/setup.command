#!/bin/sh

echo>1.txt
echo>2.txt

# git submodule add --force "git@github.com:/lilydjwg/colorizer.git" "colorizer_lilydjwg"
# git submodule add --force "git@github.com:/vim-scripts/jsbeautify.git"
git submodule add --force "git@github.com:chrisbra/Colorizer.git" "Colorizer_chrisbra"
git submodule add --force "git@github.com:vim-scripts/bash-support.vim.git"
git submodule add --force "git@github.com:/msanders/cocoa.vim.git"
git submodule add --force "git@github.com:/beautify-web/js-beautify.git"
git submodule add --force "git@github.com:/fholgado/minibufexpl.vim.git"
git submodule add --force "git@github.com:Shougo/neocomplcache.vim.git"
git submodule add --force "git@github.com:scrooloose/nerdtree.git"
git submodule add --force "git@github.com:/luochen1990/rainbow.git"
git submodule add --force "git@github.com:/kien/rainbow_parentheses.vim.git"
git submodule add --force "git@github.com:/vim-scripts/taglist.vim.git"
git submodule add --force "git@github.com:jvirtanen/vim-cocoapods.git"
git submodule add --force "git@github.com:altercation/vim-colors-solarized.git"
git submodule add --force "git@github.com:/maksimr/vim-jsbeautify.git"
git submodule add --force "git@github.com:/Shougo/vimshell.vim.git"
