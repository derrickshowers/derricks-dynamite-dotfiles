# Derrick's Dynamite (.)Dotfiles

## Assumptions

I have tried to make this as generic as possible, so that anyone who uses it doesn't have to go through the code and make a whole bunch of changes so that it works for his/her local environment. However, that comes with a few assumptions about directory structure and what not. Below are a list of items that must be the same in order for all aliases/function/settings to work correctly. If you don't set your environment up the same, nothing will *break*, you just may have a few things that crap out on you.

* Development Directory: I keep all of my projects in a 'Development' directory, within my home folder. There are a few aliases that refer to this directory. (`mkdir ~/Development`).

## Dependencies

A few of the included functions have dependencies. You don't need to install, but then you won't be able to use the dependent function.

* gifify (create animated gifs from a video file)
  * ffmpeg (can be installed easily with [brew](http://brew.sh/))
  * gifsicle (can be installed easily with [brew](http://brew.sh/))

## TODO
* Document functions