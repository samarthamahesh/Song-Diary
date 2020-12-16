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
	elements=$(cat field.txt | cut -d$'\n' -f 1)
	for ((i=1;i<=$elements;i++))
	do
		arg[$i]=$(cat field.txt | cut -d$'\n' -f `expr $i + 1`)
		len[$i]=${#arg[$i]}
	done
	lines=$(cat music.csv | wc -l)
	for ((i=1;i<=$lines;i++))
	do
		for ((j=1;j<=$elements;j++))
		do
			arg[$j]=$(cat music.csv | cut -d$'\n' -f $i | cut -d "," -f $j )
			l=${#arg[$j]}
			if [ $l -gt ${len[$j]} ]
			then
				len[$j]=${#arg[$j]}
			fi
		done
	done
	sum=0
	for ((i=1;i<=$elements;i++))
	do
		sum=`expr $sum + ${len[$i]}`
	done
	echo -n " "
	for ((i=1;i<`expr $sum + $elements + $elements + $elements - 1`;i++))
	do
		echo -n "_"
	done
	echo "_"
	echo -n "|"
	for ((i=1;i<=$elements;i++))
	do
		arg[$i]=$(cat field.txt | cut -d$'\n' -f `expr $i + 1`)
		printf " %-${len[$i]}s |" ${arg[$i]}
	done
	printf "\n"
	echo -n "|"
	for ((j=1;j<=$elements;j++))
	do
		for ((i=1;i<=`expr ${len[$j]} + 2`;i++))
		do
			echo -n "_"
		done
		echo -n "|"
	done
	echo
	for ((j=1;j<=$lines;j++))
	do
		echo -n "|"
		for ((i=1;i<=$elements;i++))
		do
			arg[$i]=$(cat music.csv | cut -d$'\n' -f $j | cut -d ',' -f $i )
			printf " %-${len[$i]}s |" ${arg[$i]}
		done
		printf "\n"
	done
	echo -n "|"
	for ((j=1;j<=$elements;j++))
	do
		for ((i=1;i<=`expr ${len[$j]} + 2`;i++))
		do
			echo -n "_"
		done
		echo -n "|"
	done
	echo
fi
