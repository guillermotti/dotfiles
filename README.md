# Guillermotti's macOS Setup

## Package manager

- Install Homebrew 

      /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

- Run `which brew` to confirm the one in home directory is picked up.
- Run `brew analytics off`

## Shell

- Install oh-my-zsh: https://github.com/robbyrussell/oh-my-zsh
- Install powerlevel10k theme: https://github.com/romkatv/powerlevel10k
- Install plugins:

```sh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

## Moving config files to ~/

- Run `chmod +x install_symlinks.sh` to be able to run the script.
- Run `./install_symlinks.sh`

## Installing software via Homebrew

All software installed on the system must be listed in `.Brewfile`. This is
symlinked at `~/.Brewfile` and used by `brew bundle`.

To install all the software, add it to `.Brewfile` and run:

    brew bundle --global

## OS Settings

- Run `mac_setup.sh` script.
- Restart the laptop to apply changes.


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
- **Open In Code**
  - Press and hold CMD meanwhile add the icon from Applications to the Finder tab

## Settings Sync

- iTerm2->Profiles->Open Profiles->Edit Profiles...->Add `default-profile-iterm2.json`.
    - Restart iTerm2.

- VSCode:
  - Install "Settings Sync" extension and reload.
  - Run '> Sync: Download Settings'
  - Enter gist ID in `vscode.sync` file to prompt.
  - Once extensions are installed 'Reload' (or Restart)
  - Run '> Sync: Update/Upload Settings'
  - Create a token with 'gist' permissions and save it to the prompt
  - Wait for the Sync Summary.

- For GPG instructions, follow [.gnupg/README](.gnupg/README) file.

## Git Setup

- Run:

    ```sh
    chmod +x git_setup.sh
    ./git_setup.sh
    ```

- Generate key with a password:

    ssh-keygen -f $HOME/.ssh/github_rsa

- Add key to the keychain:

    ssh-add $HOME/.ssh/github_rsa          # company-installed
    /usr/bin/ssh-add $HOME/.ssh/github_rsa # system

- Upload the key to GitHub. https://github.com/settings/keys :

    cat ~/.ssh/github_rsa.pub| pbcopy

- Test connection:

    ssh -T git@github.com -i ~/.ssh/github_rsa

## Sources

- https://github.com/alanzeino/dotfiles
- https://github.com/ahmetb/dotfiles
- https://gist.github.com/MatthewEppelsheimer/2269385