# Mac Setups

## Setup brew, zsh, Iterm2, ohmyzsh

```
brew cask install iterm2
brew cask install visual-studio-code
brew install zsh tmux

```

## Python using pyenv
brew install pyenv

- more configuration
https://github.com/pyenv/pyenv#basic-github-checkout


## Change default mac Shell

```
chsh -s /bin/bash
echo $SHELL
```

## install ohmyzsh

```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
upgrade_oh_my_zsh

```

## Setup Vim-plug

```
# https://github.com/junegunn/vim-plug

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# then put .vimrc at home directory. Refer to template git repo
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


## AWSCLI
https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-mac.html#cliv2-mac-install-cmd-all-users

## AWS SAM
https://docs.aws.amazon.com/serverless-application-model/latest/developerguide/serverless-sam-cli-install-mac.html


## Install Docker
https://hub.docker.com/editions/community/docker-ce-desktop-mac/


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

Debugging steps:

```
# make sure you have the .ssh/config below:
Host github.com
    HostName github.com
    User git
    #AddKeysToAgent yes
    #UseKeychain yes
    #IdentityFile ~/.ssh/id_rsa

Host github.com-yihyap
    HostName github.com
    User git
    IdentityFile ~/.ssh/id_rsa_amazon


# Add rsa id
ssh-add id_rsa
ssh-add id_rsa_amazon

# Do a quick test as follows, and make sure they login into different account name:
ssh github.com
ssh github.com-yihyap

# git clone using the correct host name alias, like github.com-yihyap
git clone git@github.com-yihyap:aws-samples/amazon-sagemaker-audio-classification-pytorch.git


```

## AWSCLI v2

```
curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "AWSCLIV2.pkg"
sudo installer -pkg AWSCLIV2.pkg -target /

# Make sure pyenv /Users/yihyap/.pyenv/shims does not use the old awscli, if yes, rename it to aws_donotuse, so that pyenv will check the PATH
which is /usr/local/bin
```

## AWS SAM Cli

```
brew tap aws/tap
brew install aws-sam-cli
sam --version
brew upgrade sam
```

## Git AWS

```
git config --global credential.helper '!aws codecommit credential-helper $@'
git config --global credential.UseHttpPath true

```

## TMUX configuration

Add .tmux.conf to HOME directory

# Reference

<https://medium.com/@rafavinnce/iterm2-zsh-oh-my-zsh-material-design-the-most-power-full-terminal-on-macos-332b1ee364a5>

# Conda

conda create --name myenv python=3.8

# setup node.js for jupyter lab

```
# This is to handle node.js error
brew upgrade npm
# Make sure no error
npm version
```

# pyenv setup

```
brew update
brew install pyen
```

Add `eval "$(pyenv init -)"` into .zshrc

```
pyenv install 3.8.0
# make versions has 's'
pyenv versions
```

# Update jupyter config

Update ~/.jupyter/jupyter_notebook_config.py for jupyterlab to discover available kernel
New virtual env must have package `ipython` to be discoverable

```
c.NotebookApp.kernel_spec_manager_class = 'environment_kernels.EnvironmentKernelSpecManager'
c.EnvironmentKernelSpecManager.virtualenv_env_dirs=['/Users/yihyap/.pyenv/versions/']
c.EnvironmentKernelSpecManager.find_conda_envs = False
#c.EnvironmentKernelSpecManager.conda_env_dirs=['/opt/miniconda/envs/']

```

# Cloudformation tool - Rain

- <https://github.com/aws-cloudformation/rain>
