# Configurations
This is a repository for my personal configurations for zsh, vim, and screen.

## Included Packages
### For zsh
- [bhilburn/powerlevel9k](//github.com/bhilburn/powerlevel9k)

### For vim
- [VundleVim/Vundle.vim](//github.com/VundleVim/Vundle.vim)
- [scrooloose/nerdtree](//github.com/scrooloose/nerdtree)
- [Xuyuanp/nerdtree-git-plugin](//github.com/Xuyuanp/nerdtree-git-plugin)
- [vim-airline/vim-airline](//github.com/vim-airline/vim-airline)
- [airblade/vim-gitgutter](//github.com/airblade/vim-gitgutter)
- [tpope/vim-fugitive](//github.com/tpope/vim-fugitive)
- [rdnetto/YCM-Generator](//github.com/rdnetto/YCM-Generator)
- [valloric/youcompleteme](//github.com/valloric/youcompleteme)
- [cyliang/vim-vendetta](//github.com/cyliang/vim-vendetta)
- [nathanaelkane/vim-indent-guides](//github.com/nathanaelkane/vim-indent-guides)
- [majutsushi/tagbar](//github.com/majutsushi/tagbar)

## Installation Steps
1. Install one of [Powerline patched font](//github.com/powerline/fonts).
2. Install [Oh My Zsh][oh-my-zsh].
3. Install zsh theme: powerlevel9k.
4. Install Vundle for vim.
5. Install `.zshrc`, `.aliases`, and `.vimrc`.
6. Install vim plugins.

### Install zsh Theme
```
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
```

### Install Vundle for Vim
```
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

### Install Configuration Files
```sh
wget https://raw.githubusercontent.com/cyliang/configurations/master/.zshrc -O ~/.zshrc
wget https://raw.githubusercontent.com/cyliang/configurations/master/.aliases -O ~/.aliases
wget https://raw.githubusercontent.com/cyliang/configurations/master/.vimrc -O ~/.vimrc
```

### Install Vim Plugins
#### Install most plugins
1. Open vim.
2. Type `:PluginInstall` and wait for the installation until `done` is printed.

#### Install YouCompleteMe
Please refer https://github.com/Valloric/YouCompleteMe#ubuntu-linux-x64.

For example:
```sh
cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer
```

##### Install Extra Configuration File
```sh
wget https://raw.githubusercontent.com/JDevlieghere/dotfiles/master/.vim/.ycm_extra_conf.py -O ~/.vim/.ycm_extra_conf.py
```

## Usage
### Vim
#### To Update Packages
Type `:PluginUpdate` to automatically update packages from GitHub.

#### Key Mappings
- `Ctrl-c`: Toggle **Tagbar**
- `Ctrl-n`: Toggle **Nerd Tree**
- `Ctrl-e`: Trigger **YCM** to show hints.
- `Ctrl-]`: Goto **declaration**.
- `Ctrl-\`: Goto **definition**.
- `Tab`: Navigate to next buffer.
- `Shift-Tab`: Navigate to previous buffer.

[oh-my-zsh]: http://ohmyz.sh/
[vim]: https://github.com/vim/vim
