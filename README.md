This repo contains zsh, vim, tmux configurations

# dot_files
configuration files

Clone with `--recursive` for bundles:

`git clone --recursive https://github.com/TalSchuster/dot_files.git`

# Good configuration for mac:
* Install brew and tmux: http://macappstore.org/tmux/
* Install conda: https://www.anaconda.com/download/#macos
* Install iterm2 https://www.iterm2.com/
* Configure iterm2: go to `Preferences -> profile -> keys`. Load preset `Natural Text Editing`. Make sure that the option keys are sending `Esc+` (bottom right radio bottons on the same screen). That should let you modify up/down pane size inside tmux using `control+b, option+up/down`

we don't want to modify width of panes with arrows because that will override the useful navigation between words using `option + left/right`. Instead we will use bindings that will allow vimlike navigtaion and resizing. Note: It will override the clear screen `ctrl+l`

* Follow the instructions in `env_installer.sh` file 
* This will allow navigating between vim/tmux panes using `control+h/j/k/l` and resizing using `control+b, h/j/k/l`
* Go over .vimrc file to check more of the vim bindings

# Issues
If getting `vim-yapf-format requires vim compiled with python support`:

Install `vim-nox-py2`: `sudo apt install vim-nox-py2`
(for python 2)

## TODO

mapping for fugitive (git) commands
