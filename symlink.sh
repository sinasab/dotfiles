declare -a FILES_TO_SYMLINK=(
  '.bashrc'
  '.bash_profile'
  '.extra'
  '.bash_prompt'
  '.aliases'
  '.bash_tweaks'
  '.editorconfig'
  '.hyper.js'
)
sourceFile=''
targetFile=''
for i in ${FILES_TO_SYMLINK[@]}; do
  sourceFile="$(pwd)/$i"
  targetFile="$HOME/$i"
  rm "$targetFile"
  ln -fs $sourceFile $targetFile
  echo "linked $i"
done
unset sourceFile
unset targetFile
unset i
