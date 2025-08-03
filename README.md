# efinder

A script using fzf on Gentoo, to search the available packages in your portage
tree and install them. Or search your world file, and pick packages 
to deselect.

***
<br>

  Launced in emerge mode:  
<br>
<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/6ae05839-8473-488e-8b79-132a5b8dba6d" />

<br><br>
  With the preview on the right:
<br><br>
<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/5913d065-a210-46d5-9310-01313f486e25" />

<br><br>
  Launched in deselect mode:
<br>


<img width="1920" height="1080" alt="Jul-Tue-29-04:53" src="https://github.com/user-attachments/assets/e6c8dd45-4152-4ba8-b90c-b61ab1c0d562" />   

# Usage
<br>

When launched by default with no options it will emerge packages, with -u it will deselect them from your world file.  

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

Keybinds:

You can use tab to select multiple packages, then press enter.
To exit without selecting anything to emerge, or deselect press Escape.

Toggle the preview window with alt-p. 

Toggle the preview window position with alt-space.

Change the preview window to show dependencies with alt-d

Change it to show use flags with alt-u.

It shows use flags by default in emerge mode, and dependencies by default
in deselect mode.


***

# fzf tips.

When you have efinder open to change the way fzf searches you can use a few different methods.

By quoting a string you will enable exact-match mode.
Meaning if you quote your search it will search for that exact string instead of fuzzy searching.
like so 
```
$ 'dwm
```
Adding the single quote can be especially useful for short strings like this. 
Because otherwise it might not narrow the results down enough.

In this case it instead of getting results like these.

<br>

<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/58c73399-0487-4cca-8eb6-adfeb5dc885a" />

<br><br>

You narrow down the results to just those directly matching like so:

<br>

<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/ff89f494-f6f2-4c95-974a-d16dd21344d4" />

<br><br>

To add another example of how to modify search results. You can use an exclamation mark to exclude results matching what comes after it.
So if you were to add this, to the search in the above example.


```
$ !sec
```

<br>

<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/30b1e113-dd21-40a2-9200-5aa6f8013072" />

<br><br>
You can see now that line is no longer showing up as a result.

Something else that can be useful is the "or" opperator. Which is this pipe symbol "|"

To show an example we can take the same search as before for dwm. And add this after.F

```
$ 'dwm | i3lock
```
And it will search for i3lock along with our first search like so:

<br>

<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/69365cee-0f00-48ad-9f78-40bf166015dc" />

***
<br><br>
Here are some useful keybinds built into fzf.

If you like using vim like motions you can move up and down with

* control-j : to move down

* control-k : to move up

If you want to scroll up and down in the preview window you can press.

* control-up : To scroll up

* control-down : To scroll down

As mentioned above you can select multiple Items by hitting the tab key. To deselect those  you just move back up and hit tab again.

You can press Escape to exit the script without taking any action.

Or to select something to either emerge or remove from your world file, you can press enter while that item is selected.

Of if you have chosen multiple them pressing enter after you have selected those with tab.

<br><br>
There is a lot more useful information in the man page for fzf. And even more useful information on FZF's github page. And even more
information scattered across the web. I highly recommend at least checking out fzf's repo if not the manpage also.

[The fzf project](https://github.com/junegunn/fzf)


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
