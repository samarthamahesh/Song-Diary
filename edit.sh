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
	echo -n "Enter the ID of the song you want to edit : "
	read songid
	if [ -z $songid ]
	then
		echo "No song ID given!"
	else
		i=1
		a=0
		while [ $i -le $lines ]
		do
			sid=$( cat music.csv | cut -d$'\n' -f $i | cut -d "," -f 1 )
			if [ $songid = $sid ]
			then
				linenumber=$i
				a=1
			fi
			i=`expr $i + 1`
		done
		if [ $a -eq 0 ]
		then
			echo "No song found!"
		else
			echo -n "Field : "
			read field
			if [ -z $field ]
			then
				echo "No field given!"
			elif [ $field = "ID" ]
			then
				echo "ID can't be changed!"
			else
				elements=$(cat field.txt | cut -d$'\n' -f 1)
				b=0
				for ((i=2;i<=$elements;i++))
				do
					element=$(cat field.txt | cut -d$'\n' -f `expr $i + 1`)
					if [ $element = $field ]
					then
						line=`expr $i`
						b=1
					fi
				done
				if [ $b -eq 0 ]
				then
					echo "No field found!"
				else
					oldvalue=$( cat music.csv | cut -d$'\n' -f $linenumber | cut -d "," -f $line)
					echo -n "New Value : "
					read newvalue
					if [ -z $newvalue ]
					then
						newvalue="-"
					else
						sed -i -e "${linenumber}s/$oldvalue/$newvalue/" music.csv
					fi
				fi
			fi
		fi
	fi
fi
