# Guillermotti's macOS Setup

## Package manager

- Install Homebrew to `$HOME/.homebrew` instead of /usr/local:

      git clone https://github.com/Homebrew/brew.git $HOME/.homebrew

- Run `which brew` to confirm the one in home directory is picked up.
- Run `brew analytics off`

## Installing software via Homebrew

All software installed on the system must be listed in `.Brewfile`. This is
symlinked at `~/.Brewfile` and used by `brew bundle`.

To install all the software, add it to `.Brewfile` and run:

    brew bundle --global

Some stuff will take long, in that case, identify which packages and update
`.Brewfile` to install them with `args: ['force-bottle']` or do a one-off
`brew install --force-bottle [pkg]` install.

Some things that require manual installation after Homebrew:

```sh
# if pip requires sudo, something is wrong, because the
# Homebrew bundle should install a $USER-writable over system-python.
    
pip install virtualenv
pip install virtualenvwrapper
```

## OS Settings

- Run `mac_setup.sh` script.

## Shell

Install oh-my-zsh: https://github.com/robbyrussell/oh-my-zsh

## Installing software manually

- [Leapp](https://www.leapp.cloud/)

## Post-Installation Configuration

- **Rectangle**
  - Security->Accessibility: Give access
  - Launch at Login
- **Clipy**
  - Launch at Login
  - Hide from Menu Bar
  - Set history size to 200
  - Set Clipy key to <kbd>Cmd</kbd>+<kbd>Ñ</kbd>
- **Middleclick** 
  - Launch at Login

## Settings Sync

- Clone this repo and run `install_symlinks.sh`
    - Open a new terminal to take effect.
- iTerm2->Preferences->Load Preferences From: com.googlecode.iterm2.plist directory.
    - Restart iTerm2.

- For GPG instructions, follow [.gnupg/README](.gnupg/README) file.

- VSCode:
  - Install "Settings Sync" extension and reload.
  - Run '> Sync: Download Settings'
  - Enter gist ID in `vscode.sync` file to prompt.
  - Once extensions are installed 'Reload' (or Restart)
  - Run '> Sync: Update/Upload Settings'
  - Create a token with 'gist' permissions and save it to the prompt
  - Wait for the Sync Summary.

## Git Setup

Run:

    ./git_setup.sh

Generate key with a password:

    ssh-keygen -f $HOME/.ssh/github_rsa

(You may want to redact hostname from the public key.)

Add key to the keychain:

    ssh-add $HOME/.ssh/github_rsa          # company-installed
    /usr/bin/ssh-add $HOME/.ssh/github_rsa # system

Upload the key to GitHub. https://github.com/settings/keys :

    cat ~/.ssh/github_rsa.pub| pbcopy

Save this to ~/.ssh/config:

Test connection:

    ssh -T git@github.com -i ~/.ssh/github_rsa

## Sources

- https://github.com/alanzeino/dotfiles
- https://github.com/ahmetb/dotfiles
- https://gist.github.com/MatthewEppelsheimer/2269385