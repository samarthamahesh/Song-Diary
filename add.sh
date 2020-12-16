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
	touch music.csv
else
	lines=$(cat music.csv | wc -l )
	fields=$(cat field.txt | cut -d$'\n' -f 1)
	for ((i=2;i<=$fields;i++))
	do
		arg[$i]=$(cat field.txt | cut -d$'\n' -f `expr $i + 1`)
		echo "${arg[$i]}"
		read "argument[$i]"
		if [ -z ${argument[$i]} ]
		then
			argument[$i]="-"
		fi
	done
	id=$(cat music.csv | cut -d$'\n' -f $lines | cut -d "," -f 1 )
	echo $id
	id=`expr $id + 1`
	echo -n "$id, " >> music.csv
	for ((i=2;i<$fields;i++))
	do
		echo -n "${argument[$i]}, " >> music.csv
	done
	echo "${argument[$fields]}" >> music.csv
fi
