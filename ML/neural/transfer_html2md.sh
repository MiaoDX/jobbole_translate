filelist=`ls`
for file in $filelist
do 

 if [[ "$file" == *html ]]; then
 	echo $file
 	pandoc -s $file -o $file.md
 fi

done