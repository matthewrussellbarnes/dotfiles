# .files

These are my dotfiles. Take anything you want, but at your own risk.

It works with OSX and Ubuntu on Windows (WSL). It installs a bunch of software that I use, so if you fork this you will probably want to drop things that you don't use.

## Install

On a sparkling fresh installation of OS X:

    sudo softwareupdate -i -a
    xcode-select --install

Install the dotfiles with either Git or curl:

### Clone with Git

    git clone https://github.com/<username>/dotfiles.git
    source dotfiles/install.sh

### Remotely install using curl

Alternatively, you can install this into `~/.dotfiles` remotely without Git using curl:

    sh -c "`curl -fsSL https://raw.github.com/<username>/dotfiles/master/remote-install.sh`"

Or, using wget:

    sh -c "`wget -O - --no-check-certificate https://raw.githubusercontent.com/<username>/dotfiles/master/remote-install.sh`"

## The `dotfiles` command

    $ dotfiles help
    Usage: dotfiles <command>

    Commands:
       help               This help message
       edit               Open dotfiles in default editor (vim) and Git GUI (stree)
       reload             Reload dotfiles
       update             Update packages and pkg managers: OS X Applications, Homebrew/Cask, npm, Ruby, and pip
       osx                Apply OS X system defaults

## Custom settings

You can put your custom settings, such as Git credentials in the `system/.custom` file which will be sourced from `.bash_profile` automatically. This file is in `.gitignore`.

## Some installed packages

* Core
    * Bash + [coreutils](http://en.wikipedia.org/wiki/GNU_Core_Utilities) + bash-completion
    * gnu-sed, grep, psgrep, tree, wget
    * Git
    * Node.js + npm
    * Python
* Graphics
    * [ffmpeg](https://www.ffmpeg.org)
    * [gifsicle](http://www.lcdf.org/gifsicle)
    * [imagemagick](http://www.imagemagick.org)
    * [svgo](https://github.com/svg/svgo)
* Dev
    * [http-server](https://github.com/nodeapps/http-server)
    * [jq](http://stedolan.github.io/jq/)
    * [peco](http://peco.github.io/)
* Misc.
    * [lunchy](https://github.com/eddiezane/lunchy)
    * [spot](https://github.com/guille/spot)
    * [tldr](https://github.com/tldr-pages/tldr)
    * [vtop](https://github.com/MrRio/vtop)
* OSX
    * [dockutil](https://github.com/kcrawford/dockutil)
    * [Mackup](https://github.com/lra/mackup)
    * [Quick Look plugins](https://github.com/sindresorhus/quick-look-plugins)

## Not or barely installable from CLI

* [Downloads for Apple Developers](https://developer.apple.com/downloads), including:
    * Command Line Tools for XCode
    * Hardware IO Tools for XCode (includes Network Link Conditioner)

## Additional resources

* [Awesome Dotfiles](https://github.com/webpro/awesome-dotfiles)
* [Homebrew](http://brew.sh/) ([FAQ](https://github.com/Homebrew/homebrew/wiki/FAQ))
* [homebrew-cask](http://caskroom.io/) ([usage](https://github.com/phinze/homebrew-cask/blob/master/USAGE.md))
* [Bash prompt](http://wiki.archlinux.org/index.php/Color_Bash_Prompt)

## Credits

This dotfiles repo was originally forked from https://github.com/webpro/dotfiles.
Many thanks to the [dotfiles community](http://dotfiles.github.io/) and the creators of the incredibly useful tools.
