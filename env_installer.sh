###
# Set zsh as default shell
chsh -s $(which zsh)

###
# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

###
# update .zshrc file paths (home dir etc)
# copy .zshrc file
cp ~/.zshrc ~/.zshrc.old
cp .zshrc ~/.zshrc

###
# auto completing
git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
# verify that in plugins list in the .zshrc file
# modify zsh-autosuggestions.zsh to: ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='bg=white,fg=blue'
#sed "s/ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE=.*/ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='bg=white,fg=blue/'" ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

###
# VIM plugins
cp -r .vim ~/.vim
mkdir ~/.vimundo

cp ~/.vimrc ~/.vimrc.old
cp .vimrc ~/.vimrc

# For linux:
sudo apt install vim-nox-py2
sudo pip install yapf
# install c-tgas for tagbar
sudo apt-get install exuberant-ctags

###
# Tmux/ vim configuration (with vim-tmux-navigator plugin):
# will navigate tmux/vim panes with control + hjkl and resize vim with control+b, hjkl
cp ~/.tmux.conf ~/.tmux.conf.old
cp .tmux.conf ~/.tmux.conf
