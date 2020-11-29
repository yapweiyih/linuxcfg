# Mac Setups

## Setup brew, zsh, Iterm2, ohmyzsh, nodejs, rain

```
brew update
brew cask install iterm2
brew cask install visual-studio-code
brew install zsh tmux
brew install npm
brew install rain

git config --global user.name yapweiyih
git config --global user.email yapweiyih
git config --global alias.lola "log --graph --all --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(bold white)— %an%C(reset)%C(bold yellow)%d%C(reset)' --abbrev-commit --date=relative"


```

## Python using pyenv

brew install pyenv
Add `eval "$(pyenv init -)"` into .zshrc

- more configuration
<https://github.com/pyenv/pyenv#basic-github-checkout>

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

<https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-mac.html#cliv2-mac-install-cmd-all-users>

## AWS SAM

<https://docs.aws.amazon.com/serverless-application-model/latest/developerguide/serverless-sam-cli-install-mac.html>

## Install Docker

<https://hub.docker.com/editions/community/docker-ce-desktop-mac/>

## Conda set up (optional)

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

Reference:

- <https://medium.com/@xiaolishen/use-multiple-ssh-keys-for-different-github-accounts-on-the-same-computer-7d7103ca8693>

Create ssh key:
ssh-keygen -t rsa -b 4096 -C "heavenode@gmail.com"
copy /Users/yihyap/.ssh/id_rsa.pub into github ssh key

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


# Add rsa id (this is required when adding a second rsa key)
ssh-add new-mac-aws-samples-id-rsa

# Do a quick test as follows, and make sure they login into different account name:
ssh github.com
ssh github.com-yihyap

# git clone using the correct host name alias, like github.com-yihyap
git clone git@github.com-yihyap:aws-samples/amazon-sagemaker-audio-classification-pytorch.git


```

## TMUX configuration

Add .tmux.conf to HOME directory

# setup node.js for jupyter lab

```
# This is to handle node.js error
brew upgrade npm
# Make sure no error
npm version
```

# Update jupyter config

pip install environment_kernels

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

## Git AWS (deprecated)

```
git config --global credential.helper '!aws codecommit credential-helper $@'
git config --global credential.UseHttpPath true

```
