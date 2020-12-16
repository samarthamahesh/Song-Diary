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
	echo -n "Field : "
	read field
	if [ -z $field ]
	then
		echo "Input correct field!"
	else
		c=0
		elements=$(cat field.txt | cut -d$'\n' -f 1)
		for ((i=2;i<=`expr $elements + 1`;i++))
		do
			infield=$(cat field.txt | cut -d$'\n' -f $i)
			if [ $field = $infield ]
			then
				col=`expr $i - 1`
				c=1
				break
			fi
		done
		if [ $c -eq 0 ]
		then
			echo "No field found!"
		else
			echo -n "$field : "
			read arg
			if [ -z $arg ]
			then
				echo "Input correct argument!"
			else
				d=0
				k=1
				lines=$(cat music.csv | wc -l)
				for ((i=1;i<=$lines;i++))
				do
					infile=$(cat music.csv | cut -d$'\n' -f $i | cut -d "," -f $col)
					song=$(cat music.csv | cut -d$'\n' -f $i | cut -d "," -f 2)
					if [ -z $infile ]
					then
						continue
					elif [ $arg = $infile ]
					then
						echo "$k. $song"
						k=`expr $k + 1`
						d=1
					fi
				done
				if [ $d -eq 0 ]
				then
					echo "No songs found!"
				fi
			fi
		fi
	fi
fi
