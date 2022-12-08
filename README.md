# Guillermotti's macOS Setup

## Before formatting

- Upload to drive existing files
- Sync VSCode settings
- Update important files in gist (.npmrc, .yarnrc, .aws/config, .zsh_history, .kube/config)

## Package manager

- Install Homebrew:

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

- Run `which brew` to confirm the one in home directory is picked up.
- Run `brew analytics off`.

## GitHub SSH key

- Generate key with a password:

```sh
ssh-keygen -f $HOME/.ssh/github_rsa
```

- Add key to the keychain:

```sh
ssh-add $HOME/.ssh/github_rsa # company-installed
/usr/bin/ssh-add $HOME/.ssh/github_rsa # system
```

- Upload the key to GitHub as authentication key & as signing key. https://github.com/settings/keys:

```sh
cat ~/.ssh/github_rsa.pub| pbcopy
```

- Test connection:

```sh
ssh -T git@github.com -i ~/.ssh/github_rsa
```

- Clone this repo:

```sh
git clone git@github.com:guillermotti/dotfiles.git
```

## OS Settings

- Run `mac_setup.sh` script.
- Modify `git config --global user.signingkey` value with the public SSH key and run `git_setup.sh` script.
- Restart the laptop to apply changes.

## Installing software via Homebrew

All software installed on the system must be listed in `.Brewfile`. This is
symlinked at `~/.Brewfile` and used by `brew bundle`.

To install all the software, add it to `.Brewfile` and run:

```sh
brew bundle --global
```

## Shell

- iTerm2->Profiles->Open Profiles->Edit Profiles...->Add `iterm.json`.
    - Restart iTerm2.
- Install oh-my-zsh: https://github.com/robbyrussell/oh-my-zsh
- Install powerlevel10k theme: https://github.com/romkatv/powerlevel10k
- Install plugins:

```sh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

## Installing software manually

- [nvm](https://github.com/nvm-sh/nvm)

```sh  
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
```

- [krew](https://krew.sigs.k8s.io/docs/user-guide/setup/install/)

## Post installation configuration

- **Raycast**
  - Import config from *.rayconfig
  - Set directory to script commands
- **VSCode**
  - Install "Settings Sync" extension and reload.
  - Run '> Sync: Download Settings'
  - Enter gist ID in `vscode.sync` file to prompt.
  - Once extensions are installed 'Reload' (or Restart)
  - Run '> Sync: Update/Upload Settings'
  - Create a token with 'gist' permissions and save it to the prompt
  - Wait for the Sync Summary.

## Pass Configuration

1. Import GPG key from the repository:

```sh
gpg --import private.asc
```

2. Init pass following (this guide)[https://git.zx2c4.com/password-store/about/#EXTENDED%20GIT%20EXAMPLE]. Take into account:

- The argument following `pass init` should be the name of the imported key (guillermotti).
- The git remote should be set with the existing repo and a `pass git pull` and `pass git reset --hard origin/main` point to the existing HEAD.

3. Use the tool and check everything is working.


## Copy files from Gist

- .zsh_history
- .npmrc
- .yarnrc
- .aws/config
- .kube/config

## Symlinks

- Run `symlinks.sh` script.

