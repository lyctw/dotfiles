1. Command:

`GIT_SSH='./proxy_jump.sh' git push`

* `git push`
* `git pull`
* `git clone`

> You can add alias in your `.bashrc` or `.zshrc`

2. In `.git/config`:

Change to your `USER_NAME` and `REPO_NAME`.

```
[core]
  repositoryformatversion = 0
  filemode = true
  bare = false
  logallrefupdates = true
[remote "origin"]
  url = ssh+git://git@github.com/<USER_NAME>/<REPO_NAME>.git
  fetch = +refs/heads/*:refs/remotes/origin/*
[branch "master"]
  remote = origin
  merge = refs/heads/master
```
