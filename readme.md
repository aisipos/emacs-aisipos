# My Emacs Config

Here is my Emacs environment, borrowing heavily from

* [Emacs Starter kit](http://github.com/technomancy/emacs-starter-kit)
* [Alex Payne's emacs config](http://github.com/al3x/emacs)
* [EnigmaCurry's emacs config](http://github.com/EnigmaCurry/emacs)

## Features
* smex
* smart tab
* ido-mode
* ibuffer
* smooth scrolling
* magit
* auto-complete

##Installation
* Use git clone to clone this to your ~/.emacs.d directory
* Before first use, update the "submodules",
** cd .emacs.d
** git submodule init
** git submodule update
* You'll need a script called ~/bin/emacs_ipython that reads like:
`#!/bin/bash
source $VIRTUAL_ENV/bin/postactivate
env python /usr/bin/ipython
`
