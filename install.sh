nvim(){
    echo "Installing vim-plug ..."
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    echo "Done."
    echo "copying configs"
    mv ~/.config/nvim/init.vim ~/.config/nvim/init.vim.old
    cp configs/init.vim ~/.config/nvim/init.vim
    echo "Open neovim and :PlugInstall for changes to take effect.."
}

alacritty(){
    echo "copying configs"
    mkdir -p ~/.config/alacritty
    cp configs/alacritty.yml ~/.config/alacritty/alacritty.yml
    echo "Done."
}

zsh(){
    echo "copying configs"
    cp configs/.zsrc ~/.zshrc
    echo "Done."
}

echo "Configure and setup nvim config ? (y/n) : "
read n
if [[ n == 'y' ]];then
    nvim;
fi

echo "Configure and setup alacritty config ? (y/n) : "
read n
if [[ n == 'y' ]];then
    alacritty;
fi
echo "Configure and setup zsh config ? (y/n) : "
read n
if [[ n == 'y' ]];then
    zsh;
fi
