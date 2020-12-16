chmod +x add.sh
chmod +x delete.sh
chmod +x edit.sh
chmod +x viewall.sh
chmod +x viewselect.sh
chmod +x addcustom.sh
chmod +x removecustom.sh
for i in *
do
	if [ $i = "music.csv" ]
	then
		c=1
	fi
	if [ $i = "field.txt" ]
	then
		d=1
	fi
done
if [ $c -eq 0 ]
then
	touch music.csv
fi
if [ $d -eq 0 ]
then
	touch field.txt 
	echo "4" > field.txt
	echo "SongName" >> field.txt
	echo "Artist" >> field.txt
	echo "Genre" >> field.txt
	echo "YoutubeLink" >> field.txt
fi
