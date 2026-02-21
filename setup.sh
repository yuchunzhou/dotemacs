#! /bin/bash

current_go_version=""

function golang_() {
    g=$(command -v g || true)
    if [[ $g == "" ]]; then
        curl -sSL https://raw.githubusercontent.com/voidint/g/master/install.sh | bash
    else
        g self update
    fi

    latest_version=$(g ls-remote stable | tail -n 1 | grep -oP '\**\s+\K\d\.\d{1,2}\.\d{1,2}')
    go=$(command -v go || true)
    if [[ $go == "" ]]; then
        current_go_version=$latest_version
    else
        current_go_version=$(go version | grep -oP '\d\.\d{1,2}\.\d{1,2}')
    fi

    g install "$latest_version"
    g use "$latest_version"

    go install -v golang.org/x/tools/gopls@latest

    go install -v golang.org/x/tools/cmd/goimports@latest

    go install -v github.com/fatih/gomodifytags@latest

    go install -v github.com/ajmesa9891/impl/goimpl@latest

    go install -v honnef.co/go/tools/cmd/staticcheck@latest

    go install -v github.com/golangci/golangci-lint/v2/cmd/golangci-lint@latest

    go install -v github.com/cweill/gotests/gotests@latest

    go install -v github.com/go-delve/delve/cmd/dlv@latest

    go install -v github.com/zyedidia/eget@latest
}

function haskell_() {
    eget haskell/ghcup-hs --to ~/.local/bin/ghcup --upgrade-only
    eget tweag/ormolu --to ~/.local/bin/ --upgrade-only
}

function python_() {
    pyenv=$(command -v pyenv || true)
    if [[ $pyenv == "" ]]; then
        curl -fsSL https://pyenv.run | bash
    else
        pyenv update
    fi

    sudo apt install -y libreadline-dev
    sudo apt install -y libssl-dev
    sudo apt install -y tk-dev

    pyenv doctor

    export PYTHON_CONFIGURE_OPTS="--enable-optimizations --with-lto"

    latest_version=$(pyenv install --list | grep -oP '^\s+\K\d\.\d{1,2}\.\d{1,2}$' | tail -n 1)
    pyenv install -s -v "$latest_version"
    pyenv global "$latest_version"

    eget astral-sh/uv --to ~/.local/bin --upgrade-only

    uv tool install --upgrade pyright

    uv tool install --upgrade autoflake

    uv tool install --upgrade isort

    uv tool install --upgrade black
}

function rust_() {
    rustup=$(command -v rustup || true)
    if [[ $rustup == "" ]]; then
        curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

        rustup component add rust-src
        rustup component add rust-analyzer
        rustup component add clippy

        rustup toolchain install nightly
        rustup component add --toolchain nightly miri
    else
        rustup update
    fi

    cargo +nightly miri setup
}

function bash_() {
    uv tool install --upgrade nodeenv

    nodeenv ~/.local/ --force

    eget oven-sh/bun --to ~/.local/bin --upgrade-only

    bun add -f -g bash-language-server

    go install -v mvdan.cc/sh/v3/cmd/shfmt@latest

    eget koalaman/shellcheck --to ~/.local/bin --upgrade-only
}

function c_() {
    eget clangd/clangd --to ~/.local/bin --upgrade-only

    sudo apt install -y bear

    sudo apt install -y indent
}

function init() {
    sudo apt update
    sudo apt upgrade -y

    sudo apt install -y git

    sudo apt install -y curl

    sudo apt install -y wget

    lang_list=("golang" "haskell" "python" "rust" "bash" "c")
    for lang in "${lang_list[@]}"; do
        eval "${lang}_"
    done

    sudo apt install -y xsel

    sudo apt install -y xclip

    sudo apt install -y terminator

    cargo install --git https://github.com/sharkdp/fd.git

    cargo install --git https://github.com/BurntSushi/ripgrep.git ripgrep

    uv tool install --upgrade autotools-language-server

    uv tool install --upgrade mbake

    if [[ -d ~/.pymake ]]; then
        (
            cd ~/.pymake || exit
            git pull --depth 1
        )
    else
        git clone https://github.com/Melinysh/PyMake.git ~/.pymake --depth 1
    fi

    go install -v github.com/reteps/dockerfmt@latest

    bun add -f -g dockerfile-language-server-nodejs

    eget hadolint/hadolint --to ~/.local/bin --upgrade-only

    bun add -f -g yaml-language-server

    uv tool install --upgrade sqlfluff

    go install -v github.com/lasorda/protobuf-language-server@master

    cargo install --git https://github.com/tombi-toml/tombi.git tombi-cli

    sudo apt autoremove -y --purge
    sudo apt autoclean

    g use "$current_go_version"
}

function build() {
    if [[ ! -d $target_version ]]; then
        wget https://github.com/emacs-mirror/emacs/archive/refs/tags/emacs-"$target_version".tar.gz
        tar xvf emacs-"$target_version".tar.gz
        mv emacs-emacs-"$target_version" "$target_version"
        rm emacs-"$target_version".tar.gz
    fi

    (
        sudo apt update
        sudo apt upgrade -y

        sudo apt install -y autoconf
        sudo apt install -y texinfo
        sudo apt install -y zlib1g zlib1g-dev
        sudo apt install -y libgccjit-13-dev libgccjit-13-doc
        sudo apt install -y libncurses-dev
        sudo apt install -y libgnutls28-dev
        sudo apt install -y libgtk-3-dev libx11-dev

        (
            wget https://github.com/tree-sitter/tree-sitter/archive/refs/tags/v0.25.10.tar.gz
            tar xvf v0.25.10.tar.gz

            cd tree-sitter-0.25.10 || exit

            make -j"$(nproc)" || exit
            sudo make install
        )

        rm -rf tree-sitter-0.25.10
        rm v0.25.10.tar.gz

        export LD_LIBRARY_PATH=/usr/local/lib
        sudo ldconfig

        cd "$target_version" || exit

        sudo make clean
        sudo make distclean

        ./autogen.sh
        ./configure --with-mailutils --with-tree-sitter --with-native-compilation=aot || exit

        make -j"$(nproc)" || exit
        sudo make install
    )
}

function uninstall() {
    (
        cd "$target_version" || exit
        sudo make uninstall
    )
}

function update() {
    (
        cd straight/repos || exit

        for package in *; do
            echo "$package"
            cd "$package" || exit
            git pull --depth 1
            cd .. || exit
        done
    )
}

target_version="30.2"

case $1 in
init)
    init
    ;;
build)
    build
    ;;
uninstall)
    uninstall
    ;;
update)
    init
    update
    ;;
*) ;;
esac
