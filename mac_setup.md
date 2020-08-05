# Mac Setups

## Setup brew, zsh, Iterm2, ohmyzsh

```
brew cask install iterm2
brew install zsh

```

## Change default mac Shell

```
chsh -s /bin/bash
echo $SHELL
```

## Change default shell on amazonlinux2

```
sudo yum install zsh
sudo yum install util-linux-user
sudo chsh -s $(which zsh)
```

## install ohmyzsh

```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
upgrade_oh_my_zsh
```

## Add plugin and restart zsh

- this is to allow shortcut key like gss => git status
- <https://github.com/ohmyzsh/ohmyzsh>

Include the following plugin in ~/.zshrc file

```
plugins=(
     git
     aws
     tmux
 )

```

## Material design colour schema for iterm2

1. download

```
cd Downloads
curl -O https://raw.githubusercontent.com/MartinSeeler/iterm2-material-design/master/material-design-colors.itermcolors
```

2. Open iTerm2 that we already downloaded at the first section
3. Go to iTerm2 > Preferences > Profiles > Colors Tab
4. Click Color Presets… at the bottom right
5. Click Import…
6. Select the material-design-colors.itermcolors file
7. Select the material-design-colors from Load Presets…

## Setup Vim-plug

```
# https://github.com/junegunn/vim-plug

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# then put .vimrc at home directory
```

## Conda set up

add the folloiwng into .zshrc

```
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/ec2-user/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/ec2-user/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/ec2-user/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/ec2-user/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
```

## Git ssh setups

Each local mac public key can only be associated with one Git account

- <https://medium.com/@xiaolishen/use-multiple-ssh-keys-for-different-github-accounts-on-the-same-computer-7d7103ca8693>

## Git AWS

```
git config --global credential.helper '!aws codecommit credential-helper $@'
git config --global credential.UseHttpPath true

```

## TMUX configuration

Add .tmux.conf to HOME directory

# Reference

<https://medium.com/@rafavinnce/iterm2-zsh-oh-my-zsh-material-design-the-most-power-full-terminal-on-macos-332b1ee364a5>
