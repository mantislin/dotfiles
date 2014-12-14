#!/bin/sh

echo>1.txt
echo>2.txt

# git submodule add --force "git@github.com:/lilydjwg/colorizer.git" "colorizer_lilydjwg"
# git submodule add --force "git@github.com:/vim-scripts/jsbeautify.git" "jsbeautify"
git submodule add --force "git@github.com:chrisbra/Colorizer.git" "Colorizer_chrisbra"
git submodule add --force "git@github.com:vim-scripts/bash-support.vim.git" "bash-support.vim"
git submodule add --force "git@github.com:/msanders/cocoa.vim.git" "cocoa.vim"
git submodule add --force "git@github.com:/beautify-web/js-beautify.git" "js-beautify"
git submodule add --force "git@github.com:/fholgado/minibufexpl.vim.git" "minibufexpl.vim"
git submodule add --force "git@github.com:Shougo/neocomplcache.vim.git" "neocomplcache.vim"
git submodule add --force "git@github.com:scrooloose/nerdtree.git" "nerdtree"
git submodule add --force "git@github.com:/luochen1990/rainbow.git" "rainbow"
git submodule add --force "git@github.com:/kien/rainbow_parentheses.vim.git" "rainbow_parentheses.vim"
git submodule add --force "git@github.com:/vim-scripts/taglist.vim.git" "taglist.vim"
git submodule add --force "git@github.com:jvirtanen/vim-cocoapods.git" "vim-cocoapods"
git submodule add --force "git@github.com:altercation/vim-colors-solarized.git" "vim-colors-solarized"
git submodule add --force "git@github.com:/maksimr/vim-jsbeautify.git" "vim-jsbeautify"
git submodule add --force "git@github.com:/Shougo/vimshell.vim.git" "vimshell.vim"
