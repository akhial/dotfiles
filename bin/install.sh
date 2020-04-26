git clone --bare https://github.com/akhial/dotfiles.git $HOME/.dotfiles
function config {
  /usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $@
}
mkdir -p .config-backup
config checkout
if [ $? = 0 ]; then
  echo "Checked out config.";
  else
    echo "Backing up pre-existing dot files.";
    config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
fi;
config checkout
config config status.showUntrackedFiles no
config update-index --skip-worktree LICENSE
config update-index --skip-worktree README.md
rm LICENSE
rm README.md

