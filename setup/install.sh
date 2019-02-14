dotfiles=( # list of all dotfiles to do simple symlink for
    .oh-my-zsh \
    .shell \
    .bashrc \
    .editorconfig \
    .gitconfig \
    .gitignore_global \
    .tmux.conf \
    .vimrc \
    .zshrc \
);
old_dotfiles=();
already_linked=();
newly_linked=();
timestamp=$(date +%s) # for old_dotfiles folder name

for d in "${dotfiles[@]}"; do
    if [[ $(readlink ~/$d) = $(pwd)/$d ]]; then
        # ignore items already set up as expected
        already_linked+=$d;
    else
        if [ -f ~/$d ] || [ -d ~/$d ]; then
            # backup things that will be overwritten
            mkdir -p ~/.old_dotfiles_$timestamp/;
            mv  ~/$d ~/.old_dotfiles_$timestamp/;
            old_dotfiles+=$d;
        fi
        ln -s "$(pwd)/$d" ~/$d;
        newly_linked+=$d;
    fi;
done;

if [[ ${newly_linked[@]} ]]; then
    echo "the following dotfiles were newly symlinked:";
    echo $newly_linked;
    if [[ ${already_linked[@]} ]]; then
        echo "the following dotfiles were already linked correctly:";
        echo $already_linked;
    fi;
    if [[ ${old_dotfiles[@]} ]]; then
        echo "backed up the following old dotfiles into ~/.old_dotfiles_$timestamp:";
        echo $old_dotfiles;
    fi;
else
    echo "no new symlinks added";
fi;
