# Derrick's Dynamite (.)Dotfiles

This is meant to be super simple. I may add more functions and shortcuts over
time, but I would also like everything to be documented. If you're a bit new to
the command line, this should be pretty simple to download and use.

## Setup

Fork or clone the repo:  
`git clone https://github.com/derrickshowers/derricks-dynamite-dotfiles.git`

Ensure you don't already have important stuff in .bashrc or .bash_profile
(they'll get overridden with the next command). If you do, copy everything into
a file and call it .extras (which gets called in bash_profile). More on that
later.  

Copy the necessary files to your home directory  
`cp .bashrc .bash_profile ~/`


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


## Dependencies

A few of the included functions have dependencies. You don't need to install,
but then you won't be able to use the dependent function.

* gifify (create animated gifs from a video file)
  * ffmpeg (can be installed easily with [brew](http://brew.sh/))
  * gifsicle (can be installed easily with [brew](http://brew.sh/))


## VIM Awesomeness - spf13

If you really want to take things to the next level and start to utilize VIM a
bit more as your text editor, try out [spf13](http://vim.spf13.com/). Included
in this repo are a couple of extra bundles that I've installed:

* [bufexplorer](https://github.com/jlanzarotta/bufexplorer) - allows you to
  switch back and forth between your buffers with ease

To use, first install spf13
        
    curl http://j.mp/spf13-vim3 -L -o - | sh

Then move the .vimrc.bundles.local to your home directory (make sure you're
still in your home directory)
        
    cp .vimrc.bundles.local .vimrc.local ~/

Finally, install your custom stuff (or my custom stuff in this case)

    vim +BundleInstall! +BundleClean +q

### So what cool stuff can I do with VIM?

Honestly, I'm not too much of a power user myself, but there are some
half the battle is figuring out all of the key combinations. This theme will
definitely get you started, but also go and practice by typing 'vimtutor' into
the command line.

One of the toughest parts for me was figuring out how to switch between files.
My config (in vimrc.local) sets the spacebar as the leader key. What does that
mean? It means you press that before your hotkey (as long as you aren't in
'insert' mode). The hotkeys for switching between buffers (think of them as
tabs) are 'b-e' ('b' followed by 'e', not at the same time). All together now.
Space-b-e. Woo hoo! That's assuming you have more than one file open. To open a
file from inside another, you can press ':e <filename>'. Boom! Now 'space-b-e'
to switch back. Boom!

So that's about the extent of my VIM knowledge. If anyone wants to give me
personal lessons, I'm available. :)

## Extras

Do you have aliases that are specific to certain machines? For instance, maybe
some aliases that you only use on your work machine. Create a new file, call it
'.extras', place it in your home directory, and it will automatically be
included.
