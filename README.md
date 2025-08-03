# efinder

A script using fzf on Gentoo, to search the available packages in your portage
tree and install them. Or search your world file, and pick packages 
to deselect.

***
  Launced in emerge mode:  


<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/6ae05839-8473-488e-8b79-132a5b8dba6d" />


***
  With the preview on the right:   

<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/5913d065-a210-46d5-9310-01313f486e25" />

***
  Launched in deselect mode:


<img width="1920" height="1080" alt="Jul-Tue-29-04:53" src="https://github.com/user-attachments/assets/e6c8dd45-4152-4ba8-b90c-b61ab1c0d562" />   

# Usage

***

Default with no options it will emerge packages, with -d it will deselect them.  

You can use tab to select multiple, then press enter.
To exit without selecting anything to emerge, or deselect press Escape.

Toggle the preview window with alt-p. 
Toggle the preview window position with alt-space.
Change the preview window to show dependencies with alt-d
Change it to show use flags with alt-u.

It shows use flags by default in emerge mode, and dependencies by default
in deselect mode.


Usage:
To search through the packages available in your portage tree.
```
$ efinder
```
To search through the packages available in your portage tree, searching by description.
```
$ efinder -d
```
To look through your world file for packages to deselect 
(or just search through your world file if you press escape it exits)
```
$ efinder -u
```
for a help message with the extra keybinds
```
$ efinder -h
```

I will probably add some information about other useful things that are in defaults in fzf that are useful
in this script a bit later. For those not familiar with fzf. For now the fzf repo and man page have a ton
of useful information.

[The fzf project](https://github.com/junegunn/fzf)

# Useful fzf tips.


***


# Installation

Dependencies:

- fzf (it is a fzf script after all)
- gentoolkit (needed for the use flag preview.)
- eix (used to show packages in the portage tree, and world file.)

Using the install.sh for installation.

***

First git clone the repo wherever you would like to my suggestion is ~/.local/src
```
$ git clone https://github.com/blankyblank/efinder.git
```
```
$ cd efinder
```
to install it as a normal user.
```
$ ./install.sh -i
```
then add .local/bin to your path, in your shell config file like so
~/.bashrc
```
PATH=$PATH:"$HOME"/.local/bin
```
To install it system wide you just need to use sudo and it will be placed in /usr/local/bin
```
$ sudo ./install.sh -i
```
To uninstall 
```
$ ./install.sh -u
```
or systemwide
```
$ sudo ./install.sh -u
```

Manual installation

***

To install it either git clone the repo
```
$ git clone https://github.com/blankyblank/efinder.git
```

Or download the efinder file.

If you cloned it, change directories to where you cloned it with

```
$ cd efinder
```

Make it executable with
```
$ chmod +x efinder
```
Then add it somewhere on your path. My recommendation is:

If it doesn't already exist
```
$ mkdir ~/.local/bin
```
Add to your .bash_profile, or .bashrc (or whatever shell you use.)

```
PATH=$PATH:"$HOME"/.local/bin
```

Then move efinder to that directory.
```
$ mv efinder ~/.local/bin
```
If you git cloned it you can make a symlink to it.
You will use the full path to the efinder script. So if it's currently in
your home direcory in the cloned git repo
```
$ ln -s ~/efinder/efinder ~/.local/bin/
```
