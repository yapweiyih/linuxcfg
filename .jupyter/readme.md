# Install new notebook kernel locally using

```
conda activate smv2
ipython kernel install --user --name smv2
```

# Remove existing notebook kernal

```
jupyter-kernelspec list
jupyter-kernelspec remove <kernel_id>

```

# On jupyter-env

$ pip install environment_kernels

# Configure to scans only virtualenvs  (in my case)

$ cat ~/.jupyter/jupyter_notebook_config.py
c.NotebookApp.kernel_spec_manager_class = 'environment_kernels.EnvironmentKernelSpecManager'
c.EnvironmentKernelSpecManager.find_conda_envs = True
c.EnvironmentKernelSpecManager.virtualenv_env_dirs = ['/Users/yihyap/.pyenv/versions/']

# Notebook startup settings

```
%load_ext autoreload
%autoreload 2
%matploblib inline
%config InlineBackend.figure_format='retina'
sns.set_style('white')
sns.set_context('talk')
```
