# efinder

A script using fzf on Gentoo, to search the available packages in your portage
tree and install them. Or search your world file, and pick packages 
to deselect.

Launced in emerge mode.
<img width="1920" height="1080" alt="Jul-Tue-29-04:51" src="https://github.com/user-attachments/assets/3d4594d9-4180-4153-9dd2-a7e3d8913368" />
With the preview on the right
<img width="1920" height="1080" alt="Jul-Tue-29-04:56" src="https://github.com/user-attachments/assets/e2ec1291-f049-4466-9db5-d26b1c183202" />
Launched in deselect mode.
<img width="1920" height="1080" alt="Jul-Tue-29-04:53" src="https://github.com/user-attachments/assets/e6c8dd45-4152-4ba8-b90c-b61ab1c0d562" />



Default with no options it will emerge packages, with -d it will deselect them.

You can use tab to select multiple, then press enter.

Toggle the preview window with alt-p. 
Toggle the preview window position with alt-space.
Change the preview window to show dependencies with alt-d
Change it to show use flags with alt-u.

It shows use flags by default in emerge mode, and dependencies by default
in deselect mode.


Usage:
```
efinder
```
for deselect
```
efinder -d
```
for a help message with the extra keybinds
```
efinder -h
```

I will probably add some information about other useful things that are in defaults in fzf that are useful
in this script a bit later. For those not familiar with fzf. For now the fzf repo and man page have a ton
of useful information.

https://github.com/junegunn/fzf

Dependencies:

- fzf (it is a fzf script after all)
- gentoolkit (needed for the use flag preview.)
- eix (used for viewing the world file.)


To install it either git clone the repo
```
git clone https://github.com/blankyblank/efinder.git
```

Or download the efinder file.

If you cloned it, change directories to where you cloned it with 
cd efinder

Make it executable with
```
chmod +x efinder
```
Then add it somewhere on your path. My recommendation is:

If it doesn't already exist
```
mkdir ~/.local/bin
```
Add to your .bash_profile, or .bashrc (or whatever shell you use.)

```
PATH=$PATH/"$HOME"/.local/bin
```

Then move efinder to that directory.
```
mv efinder ~/.local/bin
```
If you git cloned it you can make a symlink to it.
You will use the full path to the efinder script. So if it's currently in
your home direcory in the cloned git repo
```
ln -s ~/efinder/efinder ~/.local/bin/
```
