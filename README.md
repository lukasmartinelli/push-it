Push it to the Limit
====================

Pushes you to the limit while code: Listen to an encouraging sound
when you do a `git push`.

Clone the repository:

```bash
git clone https://github.com/lukasmartinelli/push-it-to-the-limit.git
```

Install the pre-push hook into any repository:

```bash
./install.sh ~/Projects/push-it-to-the-limit
```

The `install.sh` script will create a git pre-push hook for the specified
repository. The pre-push hook will play the `push-it.wav` file with `aplay`.

