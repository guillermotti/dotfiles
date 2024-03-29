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
git config --global user.signingkey 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCqodkVeDz0W02ExJzMWJoYDFNM9EltfL7BfVaYtkIPzdBrTGMY2NeEenRYUOdliDxEOdKn813T9AjX3n++pbeo2eh30J6HssIij4SAUh5qczhkaGdBU2EEFaL7WGTEf75XdMT0CONEzV3m/w2z/w+UM6yEdIscLp6WHHL6VCsOJLlhBQYOM8ps5OGYKOJEKdJOYm2Iq/prkWXVLcaZOk1UbKfch86TMpbTdMdvikfZ2nT4+2XEgIkwXngAQWN24gPR1DjJRnUuJHXxJ582BVwo5WYyz837DDaNB3udYM1ld+fR4VJCsg6Dtrr1Y8IsPxWwni0ZjIQi+A7rQwjnslw2G7LNXG74rszFdk90WAcEq6TM82Qdj6FMqqVnaQlJLtmEs/xhYKJ8LpY+demTl4nQJvjNQVSi4Ps5FXYUoBt4CP/N/BOGmdG62dNFNXBmxfhhz80FnKMdCVwpHM5JQiQM08jaP2iE6A+9++I4t1N1V0YeN6NY2arYX1TWmydEvkU= guillermotti@GuilleVigil-MacBookPro'
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
