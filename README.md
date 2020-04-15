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

### 4. Install ASDF Python Plugin

To install the Python plugin run the following command:  

```sh
asdf plugin-add python
```

**Troubleshooting**: In the event that you may already have these plugins installed, you may need to update them to ensure that you'll be able to install the runtimes properly.  

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

***Coming Soon**: As of now this project doesn't support windows, but it shall soon.*

## Bootstrapping the Project

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

### 1. Activate Python Virtual Environment, If You Haven't Done So Already

```sh
source ./venv/bin/activate
```

**NOTE**: You'll know if it's activated because the name of the virtual environment (`venv` in this case) will usually appear in the terminal prompt.  But you can always check if the environment variable `$VIRTUAL_ENV` has been set: `[[ $VIRTUAL_ENV != '' ]] && echo 'You are in a Python virtual environment.' || echo 'You are NOT in a Python virtual environment.'`

### 2. Run the Jupyter Notebook

```sh
jupyter notebook
```

Server will be running on [http://localhost:8889/](http://localhost:8889/).  
The actual tutorial is in this notebook: [neural_network.ipynb](http://localhost:8889/notebooks/neural_network.ipynb)  
