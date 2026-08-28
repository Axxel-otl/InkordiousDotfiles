# Inkordious Dotfiles

Howdy, I'm axxel, the creator of the dotfiles in this repository, this dotfiles include:

- zsh configs

- git commands

- fastfetch configs

And I'm planning to add more!

## Guide

- [Inkordious Dotfiles](#inkordious-dotfiles)

- [Guide](guide)

- [Separated Packages](#separated-packages)
  
  - [Bedrock](#bedrock)
  
  - [Arch](#arch)

## Separated Packages

This repository actually supports 2 Linux Distributions, and in the future maybe I'll add more

### Bedrock

This may be the strangest distro, you may think "wth is bedrock, wasn't it from minecraft?" but no, [Bedrock Linux](https://bedrocklinux.org) is a meta-linux distribution in which you can create multiple stratums of diferent distributions or even rootfs.

It is located in `./bedrock` and can be installed this way:

```shell
sudo mkdir -p /opt/dotfiles
sudo chown "$USER:$USER" /opt/dotfiles

git clone https://github.com/Axxel-otl/InkordiousDotfiles.git /opt/dotfiles

cd /opt/dotfiles
stow -d /opt/dotfiles -t "$HOME" bedrock --adopt

exec zsh
ZApply
exec zsh
```

### Arch

This are for the well-known Arch Linux, and are installed this way

```shell
sudo mkdir -p /opt/dotfiles
sudo chown "$USER:$USER" /opt/dotfiles

git clone https://github.com/Axxel-otl/InkordiousDotfiles.git /opt/dotfiles

cd /opt/dotfiles
stow -d /opt/dotfiles -t "$HOME" arch --adopt

exec zsh
ZApply
exec zsh
```
