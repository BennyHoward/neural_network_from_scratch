# Neural Network From Scratch

<hr>

**WARNING**: This is a work in progress.  Once this is complete this warning will be removed.  Thank you for your patience.  See the [.todo](./.todo) file more details.  

<hr>

## License

![Creative Commons License](./by-sa.svg)  
This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/">Creative Commons Attribution-ShareAlike 4.0 International License</a>.  

## Requirements

To run this project you'll need the following:

- A (mostly) up to date Mac (Windows PCs will soon be supported)
- A (mostly) up to date modern browser.  [Chrome](https://www.google.com/chrome/) or something [Chrome-like](https://brave.com/) or [Firefox](https://www.mozilla.org/en-US/firefox/) or any other major browser should be good enough.  
- Some familiarity with [Jupyter Notebook](https://jupyter.org/).  
- Some familiarity with the command line terminal.  
- The command-line package manager [Homebrew](https://brew.sh/).  
- The runtime agnostic version management tool [ASDF VM](https://asdf-vm.com/) and it's plugins for [Python](https://github.com/danhper/asdf-python).  
- A code editor.  It doesn't matter which one because a well structured project should be agnostic to which code editor the developer chooses.  However, in this case we'll recommend [Visual Studio Code](https://code.visualstudio.com/) (not to be confused with Visual Studio).  
- A GUI for `git`.  While not strictly needed because you can just use `git` directly on the command line, it does provide a convenient interface if you're not familiar or new to `git`.  

## Setup Development Environment (Mac)

The following steps will show you how to setup a development environment for the Mac.  
This step only needs to be done once per machine and will only need to be occasionally revisited to update the development environment.  
Meaning that once you set up your machine for Python, you can run other Python projects without worrying about this step again (barring occasional updates or if you need to install a different version on the runtime).  

### 1. Install Xcode Select

Not to be mistaken for [Xcode](https://developer.apple.com/xcode/) itself, a full IDE for the Mac, Xcode Select is a collection of standard developer tools (mostly command-line, such as `git`) from Apple for the Mac (and other Apple products).  Xcode Select is used by Xcode, but Xcode Select can be used independently of Xcode.  

Install Xcode Select with the following command:  

```sh
xcode-select --install
```

**NOTE**: You may get a series of prompts to install additional things and license agreements.  

### 2. Install Homebrew

Homebrew is a command line tool and package manager for Mac.  

Install it with the following command:  

```sh
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

**NOTE**: You'll be prompted for your password because the installer needs access to certain protected directories.  

### 3. Use Homebrew to Install ASDF VM

Install via Homebrew with the following command:

```sh
brew install asdf
```

Update the `.bashrc` and `.zshrc` files:

```sh
echo '# Adding asdf-vm (via Homebrew) paths' >> ${HOME}/.bashrc
echo 'source $(brew --prefix)/opt/asdf/asdf.sh' >> ${HOME}/.bashrc
echo '# Adding asdf-vm (via Homebrew) paths' >> ${HOME}/.zshrc
echo 'source $(brew --prefix)/opt/asdf/asdf.sh' >> ${HOME}/.zshrc
```

**NOTE**: It may be necessary to run `source ${HOME}/.bashrc` or `source ${HOME}/.zshrc`, depending on the shell, in order run use the runtimes and developer tools installed by ASDF VM.  

### 4. Install ASDF VM Python Plugin

To install the Python plugin run the following command:  

```sh
asdf plugin-add python
```

In the event that you may already have these plugins installed, you may need to update them to ensure that you'll be able to install the runtimes properly.  

Update them with the following command:  

```sh
asdf plugin-update --all
```

### 5. Install Visual Studio Code and Github Desktop using Homebrew (Optional)

While not needed for this project, it's recommended that you have some kind of IDE and a GUI for Git for it's convenience in visualizing changes in your code (also it works directly with GitHub).  

Install those programs via Homebrew with the following command:  

```sh
brew cask install visual-studio-code github
```

### 6. Clone or Download the Project

It's recommended that you clone this project with [Git](https://git-scm.com/), however if you're not familiar with Git, you can download the zip file of this project and unzip it or use [Github Desktop](https://desktop.github.com/) (which you can install via Homebrew).  

To clone with `git` run the following command:  

```sh
git clone https://github.com/BennyHoward/neural_network_from_scratch.git
```

**NOTE**: You'll need to do this before you run the next steps.  

### 7. Install the Runtimes

Before you run the commands for this step, you'll need to enter the directory of this project.  

Run the following command to install the needed runtimes via ASDF VM:  

```sh
asdf install
```

**NOTE**: This command will install the runtimes and versions defined in the `.tool-versions` file in this project.  So be sure to be in this project's directory when running `asdf install`.  

Then install global packages and modules for the installed runtimes.  

You should upgrade the `pip` package manager for Python3 and globally install the `virtualenv` module for Python3.  

Run the following command to update the package manager and install the global module:

```sh
pip3 install --upgrade pip
pip3 install virtualenv
```

**NOTE**: Notice how we didn't have `pip3` this time.  This is because the virtual environment was created with Python3, so we're running in a Python3 environment with no risk of accidentally using Python2.  
**NOTE**: To be certain you're targeting the exact runtime specified in this project's `.tool-versions` file, be sure to run this command when in this project's directory.  

## Setup Development Environment (Windows)

### 1. Enable the [Windows Subsystem for Linux](https://docs.microsoft.com/en-us/windows/wsl/about) Feature

Windows Subsystem for Linux is a virtual machine to run Linux inside Windows.  

Enable it with the following PowerShell command (in Administrator mode):  

```ps1
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux -norestart
Restart-Computer
```

**NOTE**: You'll need to restart your system or else you cannot move on to the next steps.  

### 2. Download and Install the Linux Distro on WSL (Debian 9 Stretch)

Download the Debian installer with the following PowerShell command:  

```ps1
Invoke-WebRequest -Uri https://aka.ms/wsl-debian-gnulinux -OutFile $env:USERPROFILE\Debian.appx -UseBasicParsing
Expand-Archive $env:USERPROFILE\Debian.zip $env:USERPROFILE\Debian
```

**NOTE**: The `Debian.appx` file is a very large file and it may take some time to download.  

Install the Debian on WSL by running the installer with the following PowerShell command:  

```ps1
& $env:USERPROFILE\Debian\debian.exe
```

**NOTE**: You'll be prompted to enter a new UNIX username and password.  You can choose whatever you want, it needs not match your Windows username and password.  
**NOTE**: You can invoke the WSL linux terminal with the following powershell command: `wsl`.  

### 3. Install all the needed tools in WSL

Activate the `wsl` linux terminal if you have not done so, then run the following Linux shell command.  

```ps1
wsl
```

#### 3.1 Update the Debian Package Metadata

Before you can install additional software on WSL/Debian, you'll need to download the package metadata.  

Run the following command to update the Debian package manager:  

```sh
sudo apt update
```

**NOTE**: Whenever you run a `sudo` command in Linux you'll usually be prompted to enter you UNIX password that you set during installation on Linux on WSL.  

#### 3.2 Install Linuxbrew

Linux brew is another command line package manager similar to Homebrew on Mac.  

Run the following commands to install Linuxbrew and update the `.profile` file for Linuxbrew:

```sh
sudo apt install -y curl git build-essential
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)" < /dev/null
echo '# Adding Linuxbrew path' >> ${HOME}/.profile
echo 'eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)' >> ${HOME}/.profile
```

**NOTE**:  You may need to resource the `.profile` file in order to run the `brew` command.  If the `brew` command isn't available run `source ${HOME}/.profile`.  
**NOTE**: Windows firewall may prompt you to allow certain dependencies to communicate on networks.  

#### 3.3 Install ASDF VM using Linuxbrew

Run the following commands to install ASDF VM and update the `.profile` file for ASDF VM:  

```sh
brew install asdf
echo '# Adding asdf-vm (via Homebrew) paths' >> ${HOME}/.profile
echo 'source $(brew --prefix)/opt/asdf/asdf.sh' >> ${HOME}/.profile
```

**NOTE**: This step may take a while to complete.  
**NOTE**: You may need to resource the `.profile` file in order to run the `brew` command.  If the `brew` command isn't available run `source ${HOME}/.profile`.  
**NOTE**: Windows firewall may prompt you to allow certain dependencies to communicate on networks.  

#### 3.4 Install ASDF VM Python Plugin

To install the Python plugin run the following command:  

```sh
sudo apt install -y build-essential python-dev libncursesw5-dev libgdbm-dev libc6-dev zlib1g-dev libbz2-dev readline-common libreadline-dev libsqlite3-dev tk-dev libssl-dev libffi-dev xz-utils
asdf plugin-add python
```

**NOTE**: You may get the following message: `WARNING: The Python readline extension was not compiled. Missing the GNU readline lib?`, this is ok.  You won't be needing this `readline` extension.  

In the event that you may already have these plugins installed, you may need to update them to ensure that you'll be able to install the runtimes properly.  

Update them with the following command:  

```sh
asdf plugin-update --all
```

### 4. Clone or Download the Project and Install the Runtimes

Run the following PowerShell commands to clone enter into the project's directory:  

```ps1
wsl git clone https://github.com/BennyHoward/neural_network_from_scratch.git
chdir neural_network_from_scratch
```

Run the following in the WSL terminal, to install all the runtimes needed by the project:  

```sh
asdf install
```

**NOTE**: This will take a while, you'll need to be patient for this step.  
**NOTE**: This command will install the runtimes and versions defined in the `.tool-versions` file in this project.  So be sure to be in this project's directory when running `asdf install`.  

Then install global packages and modules for the installed runtimes.  

You should upgrade the `pip` package manager for Python3 and globally install the `virtualenv` module for Python3.  

Run the following command to update the package manager and install the global module:

```sh
pip3 install --upgrade pip
pip3 install virtualenv
```

**NOTE**: Notice how we didn't have `pip3` this time.  This is because the virtual environment was created with Python3, so we're running in a Python3 environment with no risk of accidentally using Python2.  
**NOTE**: To be certain you're targeting the exact runtime specified in this project's `.tool-versions` file, be sure to run this command when in this project's directory.  

### 5. Install [Chocolatey](https://chocolatey.org/packages) Package Manager and use it to install Visual Studio Code and Github Desktop (Optionals)

#### 5.1 Install Chocolatey

Chocolaty is a command line tool and package manager for Windows.  

Install with the following PowerShell command (in Administrator mode):  

```ps1
Set-ExecutionPolicy RemoteSigned -scope Process -Force
iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
```

**NOTE**: The `Set-ExecutionPolicy ...` command allows the Chocolaty installation script to run.  

#### 5.2 Install Visual Studio Code and GitHub Desktop with Chocolatey

```ps1
choco install -y vscode github-desktop
```

## Bootstrapping the Project

<hr>

**NOTE**: If you're running Windows, remember ALL of the following commands MUST be run in WSL.  Nothing in this section uses PowerShell or any other Windows specific command lines.  

<hr>

The following steps will show you how to bootstrap the project.  

Simply downloading the project isn't sufficient, you need to perform a series of steps to initialize it, such as ensuring the proper runtimes are installed and are in use, ensuring that dependencies are installed, the project builds the application, etc.  

However, this step only needs to be done once per project.  Meaning that if you make changes to the source code you don't need to re-run this step (except maybe the build step).  

### 1. Create and Activate Python Virtual Environment

```sh
python3 -m virtualenv venv
source ./venv/bin/activate
```

When you want to deactivate the Python virtual environment run the following command: `deactivate`

When you want to come back to this environment, you'll need to re-activate the Python virtual environment to re-run this project.  

### 2. Install the Python Dependencies

Run the following command **AFTER AND ONLY AFTER** you've created and activated the Python virtual environment:  

```sh
pip install -r requirements.txt
```

## Usage

<hr>

**NOTE**: If you're running Windows, remember ALL of the following commands MUST be run in WSL.  Nothing in this section uses PowerShell or any other Windows specific command lines.  

<hr>

### 1. Activate Python Virtual Environment, If You Haven't Done So Already

```sh
source ./venv/bin/activate
```

**NOTE**: You'll know if it's activated because the name of the virtual environment (`venv` in this case) will usually appear in the terminal prompt.  But you can always check if the environment variable `$VIRTUAL_ENV` has been set: `[[ $VIRTUAL_ENV != '' ]] && echo 'You are in a Python virtual environment.' || echo 'You are NOT in a Python virtual environment.'`

### 2. Run the Jupyter Notebook

```sh
jupyter notebook --port 8889
```

Server will be running on [http://localhost:8889/](http://localhost:8889/).  
The actual tutorial is in this notebook: [neural_network.ipynb](http://localhost:8889/notebooks/neural_network.ipynb)  
