# dot_files
configuration files

Clone with `--recursive` for bundles:

`git clone --recursive git@github.com:TalSchuster/dot_files.git`

# Good configuration for mac:
* Install brew and tmux: http://macappstore.org/tmux/
* Install conda: https://www.anaconda.com/download/#macos
* Install iterm2 https://www.iterm2.com/
* Configure iterm2: go to `Preferences -> profile -> keys`. Load preset `Natural Text Editing`. Make sure that the option keys are sending `Esc+` (bottom right radio bottons on the same screen). That should let you modify up/down pane size inside tmux using `control+b, option+up/down`


# Issues
If getting `vim-yapf-format requires vim compiled with python support`:

Install `vim-nox-py2`: `sudo apt install vim-nox-py2`
(for python 2)

## TODO
Better tmux integration

mapping for fugitive (git) commands
