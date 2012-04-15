cat <<EOS

  start setup dot.files

EOS

if [[ ! -d $HOME/bin ]]; then
  mkdir $HOME/bin
fi

bin_dir=$HOME/dotfiles/bin
for file in `ls $bin_dir`; do
  if [[ ! -e $HOME/bin/$file ]]; then
    ln -s $bin_dir/$file $HOME/bin
  fi
done

dotfiles=(dot.gitconfig dot.gemrc dot.tmux.conf)

for file in ${dotfiles[@]}; do
  deploy_file=$( echo $file | sed -e 's/dot//' )
  if [[ -s ~/$deploy_file ]]; then
    mv ~/$deploy_file ~/$deploy_file.old
    echo "already exists! backup to  ~/"$deploy_file".old"
  fi

  ln -s ~/dotfiles/$file ~/$deploy_file
  echo "set file:" $deploy_file
done

cat <<EOS

  setup end.

EOS

