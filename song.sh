for var in *.zip
do echo $var | sed 's/.zip//g'
dirName=$(echo $var | sed 's/.zip//g')
mkdir $dirName
mv $var $dirName
echo $dirName is created
cd $dirName
unzip $var
rm $var
cd ..
done
