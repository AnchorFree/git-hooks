[![Build Status](https://travis-ci.org/AnchorFree/git-hooks.svg?branch=master)](https://travis-ci.org/AnchorFree/git-hooks)

INSTALL
=======

```
$ git clone git@github.com:AnchorFree/git-hooks.git
$ cd git-hooks
$ ./install.sh ~/Documents/Github
```

USE
===

```
$ git init example
```

TEST
====

```
$ bats bats
 ✓ v1.0.0
 ✓ master
 ✓ build_100500
 ✓ BRANCH BFG-9000-DEPLOYMENT-TIME

4 tests, 0 failures
```

# LINKS

1. https://github.com/pivotal-cf/git-hooks-core
2. https://gist.github.com/jimschubert/9073276
3. https://git-scm.com/book/en/v2/Distributed-Git-Contributing-to-a-Project
4. https://git-scm.com/book/en/v2/Customizing-Git-Git-Hooks
5. https://git-scm.com/docs/git-init#_template_directory
6. https://git-scm.com/docs/githooks
7. https://github.com/sstephenson/bats
