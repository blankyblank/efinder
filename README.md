# efinder

A script using fzf on Gentoo, to search the available packages in your portage
tree and install them. Or search your world file, and pick packages 
to deselect.

Default with no options it will emerge packages, with -d it will deselect them.

You can use tab to select multiple, then press enter.

Toggle the preview window with alt-p. 
Toggle the preview window position with alt-space.
Change the preview window to show dependencies with alt-d
Change it to show use flags with alt-u.

It shows use flags by default in emerge mode, and dependencies by default
in deselect mode.


Dependencies:

- fzf (it is a fzf script after all)
- gentoolkit needed for the use flag preview.
- eix used for viewing the world file.


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
