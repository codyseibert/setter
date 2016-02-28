files="$(find . -iname '*.js')"
for file in $files;
do
  coffeeName="$(echo $file | sed s/\.js/\.coffee/g)"
  js2coffee $file > $coffeeName
  rm $file
done
