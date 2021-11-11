# Guillermotti's macOS Setup

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

- Upload the key to GitHub. https://github.com/settings/keys:

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
- Run `git_setup.sh` script.
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

- [Leapp](https://www.leapp.cloud/)
- [nvm](https://github.com/nvm-sh/nvm)

```sh  
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
```

## Post-Installation Configuration

- **Raycast**
  - Import config from *.rayconfig
  - Set directory to script commands
- **Middleclick** 
  - Launch at Login
- **Open In Code**
  - Press and hold CMD meanwhile add the icon from Applications to the Finder tab
- **VSCode**
  - Install "Settings Sync" extension and reload.
  - Run '> Sync: Download Settings'
  - Enter gist ID in `vscode.sync` file to prompt.
  - Once extensions are installed 'Reload' (or Restart)
  - Run '> Sync: Update/Upload Settings'
  - Create a token with 'gist' permissions and save it to the prompt
  - Wait for the Sync Summary.

## GPG key

1. Generate keys:

```sh
keybase pgp gen --multi
```

2. Run `gpg --list-signatures` and copy the serial numbernext to "sig" (it's 3B9A89CAE5009078 below):
   
```sh
...
sig          3B9A89CAE5009078 2021-01-31  Guille Vigil
```

3. Configure git to automatically gpgsign commits. This consists of pointing git to your signing key ID, and then enabling commit automatic signing.

```sh
git config --global user.signingkey <PUB-ID>
git config --global commit.gpgsign true
```

4. Copy the publickey into your clipboard:

```sh
keybase pgp export -q <PUB-ID> | pbcopy
```

5. Open https://github.com/settings/keys and paste the public key there.

## Copy files from last Mac

- .zsh_history
- .npmrc
- .yarnrc
- .aws/config

## Symlinks

- Run `symlinks.sh` script.

## Sources

- https://github.com/alanzeino/dotfiles
- https://github.com/ahmetb/dotfiles
- https://gist.github.com/MatthewEppelsheimer/2269385
