# Configurations
This is a repository for my personal configurations for zsh, vim, global gitignore, and screen.
Check branch [with-color_coded](//github.com/cyliang/configurations/tree/with-color_coded) for semantic C-family code highlight support.

## Quick Install
```sh
python2 -c "$(wget -O - 'http://cyliang.github.io/configurations/install.py')"
```

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
- [jeaye/color_coded](//github.com/jeaye/color_coded)
- [cyliang/vim-vendetta](//github.com/cyliang/vim-vendetta)
- [nathanaelkane/vim-indent-guides](//github.com/nathanaelkane/vim-indent-guides)
- [majutsushi/tagbar](//github.com/majutsushi/tagbar)
- [editorconfig/editorconfig-vim](//github.com/editorconfig/editorconfig-vim)

## Installation Steps
1. Install one of [Powerline patched font](//github.com/powerline/fonts).
2. Install [Oh My Zsh][oh-my-zsh].
3. Install zsh theme: powerlevel9k.
4. Install Vundle for vim.
5. Install `.zshrc`, `.aliases`, `.screenrc`, `.gitignore_global`, and `.vimrc`.
6. Install vim plugins.
7. Install global gitignore.

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
wget https://raw.githubusercontent.com/cyliang/configurations/with-color_coded/.vimrc -O ~/.vimrc
wget https://raw.githubusercontent.com/cyliang/configurations/master/.screenrc -O ~/.screenrc
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

#### Install color_coded
Please refer https://github.com/jeaye/color_coded#all.

For example:
```sh
cd ~/.vim/bundle/color_coded
mkdir build && cd build
cmake ..
make && make install # Compiling with GCC is preferred, ironically
# Clang works on OS X, but has mixed success on Linux and the BSDs

# Cleanup afterward; frees several hundred megabytes
make clean && make clean_clang
```

### Install Global Gitignore
```sh
git config --global core.excludesfile ~/.gitignore_global
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
