Push it to the Limits
=====================

Pushes you to the limits while coding: listen to an encouraging sound
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

