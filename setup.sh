cat <<EOS

  start setup dot.files

EOS

dotfiles=(dot.gitconfig dot.gemrc)

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

