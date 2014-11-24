#!/bin/sh

[ -z "${dotfiles}" -o ! -d "${dotfiles}" ] && dotfiles="${PWD}"

function myln() { # source, target, nobackup
    if [ -d ${1} -o -f ${1} ]; then
        if [ ! -L "${2}" -a -d "${2}" ]; then
            if [ "${3}" = "1" ]; then
                rm -rfv ${2}
            else
                mv -v "${2}" "${2}_backup"
            fi
        fi
        ln -s -h -f -F -v "${1}" "${2}"
    else
        echo "\"${1}\" not found."
    fi
}

pushd "${dotfiles}"

echo "basename="$(basename $0)

for file in * .*; do
    if [ "" != "${file}" \
        -a "$(basename $0)" != "${file}" \
        -a "." != "${file}" \
        -a ".." != "${file}" \
        -a ".DS_Store" != "${file}" \
        -a "Thumbs.db" != "${file}" \
        ]; then

        if [ "vimfiles" = "${file}" ]; then
            myln "${dotfiles}/${file}" "${HOME}/.vim"
            # [ -d "${HOME}/.vim" ] && mv "${HOME}/.vim" "${HOME}/.vim_backup"
            # [ -d "${HOME}/.vim" ] || ln -s -f -F "${dotfiles}/${file}" "${HOME}/.vim"
        elif [ "vimrc" = "${file}" ]; then
            myln "${dotfiles}/${file}" "${HOME}/.vimrc"
            # [ -f "${HOME}/.vimrc" ] && mv "${HOME}/.vimrc" "${HOME}/.vimrc_backup"
            # [ -f "${HOME}/.vimrc" ] || ln -s -f -F "${dotfiles}/${file}" "${HOME}/.vimrc"
        else
            myln "${dotfiles}/${file}" "${HOME}/${file}"
            # mv "${HOME}/${file}" "${HOME}/${file}_backup"
            # ln -s "${dotfiles}/${file}" "${HOME}"
        fi

    fi
done

popd
