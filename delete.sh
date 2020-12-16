c=0
for file in *
do
	if [ $file = "music.csv" ]
	then
		c=1
	fi
done
if [ $c -eq 0 ]
then
	echo "No MUSIC file found!"
else
	lines=$( cat music.csv | wc -l )
	c=0
	echo -n "Enter the ID of the song you want to delete : "
	read songid
	if [ -z $songid ]
	then
		echo "No input given!"
	else
		for ((i=1;i<=$lines;i++))
		do
			sid=$( cat music.csv | cut -d$'\n' -f $i | cut -d "," -f 1 )
			if [ $songid = $sid ]
			then
				delete=$i
				c=1
				break
			fi
		done
		if [ $c -eq 1 ]
		then
			sed -i "${delete}d" music.csv
		fi
	fi
fi
