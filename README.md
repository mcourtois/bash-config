bash-config
===========

Custom bash config for loading aliases, functions, prompt setup, etc.

This is mostly for persomal uses and has only been tested on OSX but feel free to use and modify it!


Features
--------

* Some useful aliases
* Basic VCS status prompt
 * git
 * mercurial
 * svn

Usage
-----

Simply clone the project to ~/.bash and add the following line to your .bash_profile

```bash
source ~/.bash/system
```

Every executable bash scripts in *~/.bash/aliases.d/* and *~/.bash/profile.d/* will be sourced to be used in your shell.

Also, by default if you want to add custom aliases and profiles without changing the project, it will also look in 
*~/.bash.aliases.d/* and *~/.bash.profile.d/* if the folders exist.

If you want to enable/disable aliases sets from your shell, you can use the following commands:

```bash
enable-aliases <set name>
disable-aliases <set name>
```

Known issues
------------

* Prompt display glitch when in a VCS directory
