if [ -z $1 ]
then
	echo "Input correct field!"
else
	field=$1
	lines=$(cat field.txt | cut -d$'\n' -f 1 )
	i=1
	c=0
	while [ $i -le $lines ]
	do
		infile=$(cat field.txt | cut -d$'\n' -f `expr $i + 1`)
		if [ $field = $infile ]
		then
			c=1
			break
		fi
		i=`expr $i + 1`
	done
	if [ ${#field} -gt 0 -a $c -eq 0 ]
	then
		echo $1 >> field.txt
		num=$(cat field.txt | cut -d$'\n' -f 1)
		new=`expr $num + 1`
		sed -i "1s/$num/$new/" field.txt
		sed -i "s/$/, -/" music.csv
	fi
fi
