This repo contains zsh, vim, tmux configurations

# dot_files
configuration files

Clone with `--recursive` for bundles:

`git clone --recursive https://github.com/TalSchuster/dot_files.git`

# Good configuration for mac:
* Install Rectangle for window alignments
* Install brew and tmux: http://macappstore.org/tmux/
* Install conda: https://www.anaconda.com/download/#macos (optional)
* Make caps lock switch language: [link](https://support.apple.com/guide/mac-help/write-in-another-language-on-mac-mchlp1406/mac)
* Install iterm2 https://www.iterm2.com/
* Configure iterm2: go to `Preferences -> profile -> keys`. Load preset `Natural Text Editing`. Make sure that the option keys are sending `Esc+` (bottom right radio bottons on the same screen). That should let you modify up/down pane size inside tmux using `control+b, option+up/down`

we don't want to modify width of panes with arrows because that will override the useful navigation between words using `option + left/right`. Instead we will use bindings that will allow vimlike navigtaion and resizing. Note: It will override the clear screen `ctrl+l`

* Follow instructions on `env_installer.sh` 
* This will allow navigating smoothly between vim/tmux panes using `control+h/j/k/l` and resizing using `control+b, h/j/k/l` (can easily configure to anything else)
* Go over `.vimrc` file to learn about the bindings and check the plugins.

# Issues
* If getting `vim-yapf-format requires vim compiled with python support`:

Install `vim-nox-py2`: `sudo apt install vim-nox-py2`
(for python 2)

* vim compiled with python3 might not compile the F6/F7 shorcuts for ipdb at the end of the `.vimrc` file. Alternatively, remove those lines and instead use:
```
func! s:SetBreakpoint()
    cal append('.', repeat(' ', strlen(matchstr(getline('.'), '^\s*'))) . 'import ipdb; ipdb.set_trace()')
endf

func! s:RemoveBreakpoint()
    exe 'silent! g/^\s*import\sipdb\;\?\n*\s*ipdb.set_trace()/d'
endf

func! s:ToggleBreakpoint()
    if getline('.')=~#'^\s*import\sipdb' | cal s:RemoveBreakpoint() | el | cal s:SetBreakpoint() | en
endf
nnoremap <F6> :call <SID>ToggleBreakpoint()<CR>
```
This would allow using F6 to toggle an ipdb breakpoint

## Install vim with python3 on Mac

```
brew reinstall python3
brew install vim
```

Then add to `.zshrc`:
```
export VIM_HOME=/opt/homebrew/bin/vim
export PATH=$PATH:$VIM_HOME/bin
```

## TODO

mapping for fugitive (git) commands
