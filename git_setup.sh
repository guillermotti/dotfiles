#!/bin/bash
set -euo pipefail
readonly SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

EMAIL_1="guillermovigilr"
EMAIL_2="gmail.com"

set -x

# author
git config --global user.name "Guille Vigil"
git config --global user.email "${EMAIL_1}@${EMAIL_2}"

# pull strategy
git config --global pull.ff only

# use https remotes and osxkeychain for creds
git config --global credential.helper osxkeychain
git config --global url.git\@github\.com\:.pushInsteadOf https://github.com/
git config --global gpg.format ssh
# change this ssh public key when has been recreated
git config --global user.signingkey 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC71SQcd8BE3buRXFpvaTW8MgjFJ/W8vDwgde/fztweDFrXFEWWwmy51Ki66A4fIrNHIyINPJKqDsLN0wZ3IzVp89tFrWiJiFJvVeLxZWpqoymUf7kgCVcrlboBZ/P3upZ1spSef1RhPCVGaTDDgu3fHdOfJiO2WhFa+exrn4no0TuFwLthWva3aPxKneQlJ1EtrCr1llIZmYN+fLBD8GqhAHXeU1WpR+Tcdna0VTT2zWlh8zRyX2VgnMbdMs7QVpo+N3je2jMZhDOiJyVDoQoTFdZLDERRYOhtT3GRvUAVzG698SgSzP1+Rq00uWNKnC4pijaInKY2Hu1Gw7wrIDi9G1JYyKGoTCje0kAjC4VNY0WlWU82kQYp8hYX0+HqZhQJRum12HhIBmEoKImdrCZbYXeWQ2mPhZHomNK8r44GGOurkqiyUspRhQphnB1EAhSzK2SjeFD0ugZi8+pHbQZul7pqVcfhKY9Gx4aygs+sGej4Xl2zpssoVLD8Tuixtu0= guillermotti@guilles-mbp.lan'
git config --global commit.gpgsign true  # if you want to sign every commit
git config --global tag.gpgsign true  # if you want to sign every tag

# use ssh in hub (commented out since pushInsteadOf)
# git config --global hub.protocol ssh # https://github.com/github/hub/issues/1614

# diff-so-fancy and its color scheme
git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"
git config --global color.ui true
git config --global color.diff-highlight.oldNormal "red bold"
git config --global color.diff-highlight.oldHighlight "red bold 52"
git config --global color.diff-highlight.newNormal "green bold"
git config --global color.diff-highlight.newHighlight "green bold 22"
git config --global color.diff.meta "227"
git config --global color.diff.frag "magenta bold"
git config --global color.diff.commit "227 bold"
git config --global color.diff.old "red bold"
git config --global color.diff.new "green bold"
git config --global color.diff.whitespace "red reverse"

# rebase helper
git config --global sequence.editor interactive-rebase-tool

# install symlink for ssh config
SSH_CONFIG="$HOME/.ssh/config"
if [[ -f "$SSH_CONFIG" ]]; then
  rm "$SSH_CONFIG"
fi
ln -s "$SCRIPT_DIR/ssh_config" "$SSH_CONFIG"

# git config --global core.editor "vim"
git config --global core.excludesfile ~/.gitignore_global

git config --global init.defaultBranch "main"

# use vscode as the editor
git config --global core.editor "code --wait"