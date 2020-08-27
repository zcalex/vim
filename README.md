# vim

## vundle
mkdir -p ~/.vim/bundle  
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

## vimrc
mv vimrc ~/vimrc  
vim ~/.vimrc && add source vimrc

## plugins
vim  
:PluginInstall

## ycm
cd ~/.vim/bundle/  
git clone https://github.com/Valloric/YouCompleteMe.git  
cd YouCompleteMe  
git submodule update --init --recursive  
./install.py --clang-completer --go-completer
