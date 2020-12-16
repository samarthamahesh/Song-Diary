remove=$1
if [ -z $remove ]
then
	echo "No input given!"
elif [ $remove = "ID" ]
then
	echo "ID can't be removed!"
else
	if [ ${#remove} -gt 0 ]
	then
		i=1
		c=0
		lines=$(cat field.txt | cut -d$'\n' -f 1)
		while [ $i -le $lines ]
		do
			field=$(cat field.txt | cut -d$'\n' -f `expr $i + 1`)
			if [ $1 = $field ]
			then
				line=`expr $i + 1`
				c=1
			fi
			i=`expr $i + 1`
		done
		if [ $c -eq 1 ]
		then
			sed -i "${line}d" field.txt
			num=$(cat field.txt | cut -d$'\n' -f 1)
			new=`expr $num - 1`
			sed -i "1s/$num/$new/" field.txt
			cat music.csv | cut -d "," -f `expr $line - 1` --complement > music.csv
		fi
	fi
fi
