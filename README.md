Push it to the Limits
=====================

Pushes you to the limits while coding: listen to an embarassing sound
when you do a `git push`.

Clone the repository:

```bash
git clone https://github.com/lukasmartinelli/push-it.git
```

Install the pre-push hook into any repository:

```bash
./install.sh /path/to/any/git/repository
```

The `install.sh` script will create a git pre-push hook for the specified
repository. The pre-push hook will play one of the `wav` files in the repositories with either `aplay` or `afplay`.

You can add your own sound files. Add it to the 'sounds' directory.

If you want set concretely sound, use sound's filename like second parameter
```bash
./install.sh /path/to/any/git/repository wubalubadubdub
```
Video Demo
----------

[![Video Demo](http://img.youtube.com/vi/AYiWFHeyE9w/0.jpg)](https://www.youtube.com/watch?v=AYiWFHeyE9w&feature=youtu.be)
