#! /usr/bin/env python2

from distutils.util import strtobool
from distutils.spawn import find_executable
from os import system, abort
from subprocess import check_output

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
if not (find_executable('wget') and find_executable('git') and find_executable('make') and find_executable('cmake')):
    print "\033[31mThis installer depends on git, wget, build-essential, and cmake.\033[m"
    abort()

# Check zsh install
if not find_executable('zsh'):
    print "\033[31mInstall zsh before running this script.\033[m"
    abort()

# Check vim
if not find_executable('vim') or '+python' not in check_output(['vim', '--version']):
    print "\033[31mThe configuration requires vim with python support.\033[m"
    abort()


if strtobool(raw_input('Do you want to install with color_coded? (y/n)')):
    if '+lua' not in check_output(['vim', '--version']):
        print "\033[31mColor_coded requires vim with lua supported.\033[m"
        abort()

    branch = 'with-color_coded'
else:
    branch = 'master'

def run_shell(cmd):
    print cmd
    if system(cmd) != 0:
        print '\033[31m** Error occured. Aborting... **\033[m'
        abort()


print "\n---- [ 1. ] Install Oh My Zsh"
run_shell('git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh')

print "\n---- [ 2. ] Install zsh theme"
run_shell('git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k')

print "\n---- [ 3. ] Install Vundle for vim"
run_shell('mkdir -p ~/.vim/bundle')
run_shell('git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim')

print "\n---- [ 4. ] Install cyliang's configuration files"
run_shell('wget https://raw.githubusercontent.com/cyliang/configurations/master/.zshrc -O ~/.zshrc')
run_shell('wget https://raw.githubusercontent.com/cyliang/configurations/master/.aliases -O ~/.aliases')
run_shell('wget https://raw.githubusercontent.com/cyliang/configurations/%s/.vimrc -O ~/.vimrc' % branch)
run_shell('wget https://raw.githubusercontent.com/cyliang/configurations/master/.screenrc -O ~/.screenrc')

print "\n---- [ 5. ] Install vim's plugins"
run_shell('vim -c "PluginInstall" -c "qa"')

print "\n---- [ 6. ] Install YouCompleteMe for vim"
run_shell('cd ~/.vim/bundle/youcompleteme && ./install.py --clang-completer')
run_shell('wget https://raw.githubusercontent.com/JDevlieghere/dotfiles/master/.vim/.ycm_extra_conf.py -O ~/.vim/.ycm_extra_conf.py')

if branch == 'with-color_coded':
    print "\n\033[33mThe color_coded installation is quite complicated,"
    print "\033[33mplease refer https://github.com/jeaye/color_coded#ubuntudebian\033[m"

print "\n---- Installation Completed! ----"
print "It's time to change your shell... (password may be required)"
run_shell('chsh -s /bin/zsh')
print "Please restart your shell."
