#! /usr/bin/env python2

from distutils.util import strtobool
from distutils.spawn import find_executable
from os import system, abort

print "----------------------------------------"
print "|                                      |"
print "| Installer of cyliang's configuration |"
print "| for zsh, vim, and screen             |"
print "|                                      |"
print "----------------------------------------"
print

print "\033[31mThis installer will override your current settings!\033[m"
print "\033[33mIt may take a long time to install.\033[m"

# Check dependency
if not (find_executable('wget') and find_executable('git')):
    print "\033[31mThis installer depends on git and wget.\033[m"
    abort()


if strtobool(raw_input('Do you want to install with color_coded? (y/n)')):
    branch = 'with-color_coded'
else:
    branch = 'master'

def run_shell(cmd):
    print cmd
    if system(cmd) != 0:
        print '\033[31m** Error occured. Aborting... **\033[m'
        abort()


print "\n---- [ 1. ] Install Oh My Zsh"
run_shell('sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"')

print "\n---- [ 2. ] Install zsh theme"
run_shell('git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k')

print "\n---- [ 3. ] Install Vundle for vim"
run_shell('git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim')

print "\n---- [ 4. ] Install cyliang's configuration files"
run_shell('wget https://raw.githubusercontent.com/cyliang/configurations/%s/.zshrc -O ~/.zshrc' % branch)
run_shell('wget https://raw.githubusercontent.com/cyliang/configurations/%s/.aliases -O ~/.aliases' % branch)
run_shell('wget https://raw.githubusercontent.com/cyliang/configurations/%s/.vimrc -O ~/.vimrc' % branch)

print "\n---- [ 5. ] Install vim's plugins"
run_shell('vim -c "PluginInstall" -c "qa"')

print "\n---- [ 6. ] Install YouCompleteMe for vim"
run_shell('cd ~/.vim/bundle/YouCompleteMe && ./install.py --clang-completer')
run_shell('wget https://raw.githubusercontent.com/JDevlieghere/dotfiles/master/.vim/.ycm_extra_conf.py -O ~/.vim/.ycm_extra_conf.py')

if branch == 'with-color_coded':
    print "\n---- [ 7. ] Install color_coded for vim"
    run_shell('cd ~/.vim/bundle/color_coded && mkdir build && cd build && cmake .. && make && make install && make clean && make clean_clang')

print "\n---- Installation Completed! ----"
print "Please restart your shell."
