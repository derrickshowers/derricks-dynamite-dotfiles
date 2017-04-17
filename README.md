# Derrick's Dynamite (.)Dotfiles

Repo for what dotfiles I use (those files you can't see in your home directory unless you do `ls -a`). No fancy install scripts, just copy the file (and make sure to add a `.` before the file name) to your home directory for anything you want to use. If you're a bit new to the command line interface, the `/base` files should get you started (see setup).

## Setup

There used to be a fancy install script, but I realized that might be a bit overkill. To use any of these files, just `cp` them into your home directory. Remember to add a `.` prior to the filename, which I removed from the files in this repo so nothing is hidden by default.

The `/base` directory is the common stuff. Let's say you want to copy the basic stuff, that would look something like this (just make sure you make a copy of your current `.bash_profile` and `.bashrc` files before running these commands).

```bash
# Make sure you're in this repo's directory
cp base/bash_profile ~/.bash_profile
cp base/bashrc ~/.bashrc
```

Other directories in this repo are application specific. See "Applications" section below.

## Assumptions

I have tried to make this as generic as possible, so that anyone who uses it
doesn't have to go through the code and make a whole bunch of changes so that
it works for his/her local environment. However, that comes with a few
assumptions about directory structure and what not. Below are a list of items
that must be the same in order for all aliases/function/settings to work
correctly. If you don't set your environment up the same, nothing will *break*,
you just may have a few things that crap out on you.

* **Development Directory**: I keep all of my projects in a 'Development'
  directory, within my home folder. There are a few aliases that refer to this
  directory (`mkdir ~/Development`).


## Applications

Some application specific dotfiles, and what they're being used for.

### Coding Standards

Not really an application, but preference files to improve code quality and make everything consistent. If a project wants to do things different, the config file in the root of the project normally takes priority. These are settings that should be followed when a project does not dictate coding standards.

There are plugins for common text editors (so these files are picked-up by the editor):

* [EditorConfig](http://editorconfig.org/#download)
* [ESLint](http://eslint.org/docs/user-guide/integrations#editors)

### GIT

Do you use GIT? Hopefully!

`gitconfig` is my preferred config, including some helpful aliases like `git code-review` that compares all committed and working changes on your current branch with what's on master.

`gitignore_global` is a file configured by `gitconfig` to be a place for everything which should be ignored by all of your repos. Maybe that pesky `.DS_Store` file that MacOS puts everywhere. Aye? Aye? 😱

### VIM

To use my VIM config, do the following:

```bash
# Make sure you're in this repo's directory
cp vim/vimrc ~/.vimrc
vim +PluginInstall +qall
```

### Zsh

Zsh (or Z Shell) allows more configuration. The default on MacOS is Bash. Learn more about the differences between Bash and Z Shell [here](http://stackabuse.com/zsh-vs-bash/). [Oh My Zsh](http://ohmyz.sh/) is a layer on top that gives you helpful functions and what not to make your command line life more enjoyable. To install, read the docs, or just follow these steps:

```bash
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Make sure you're in this repo's directory
cp zsh/zshrc ~/.zshrc
cp zsh/custom/themes/* ~/.oh-my-zsh/custom/themes/
```

*Make sure to read the prereqs [here](https://github.com/robbyrussell/oh-my-zsh) (if you are currently using a bash shell, which you probably are, you need to install and change your default shell using [this instructions](https://github.com/robbyrussell/oh-my-zsh/wiki/Installing-ZSH))*

## Extras

Do you have aliases that are specific to certain machines? For instance, maybe
some aliases that you only use on your work machine. Create a new file, call it
`.extras`, place it in your home directory, and it will automatically be
included.
