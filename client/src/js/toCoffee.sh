files="$(find . -iname '*.js')"
for file in $files;
do
  rm $file
  #coffeeName="$(echo $file | sed s/\.js/\.coffee/g)"
  #js2coffee $file > $coffeeName
done
