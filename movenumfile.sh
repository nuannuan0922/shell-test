srcfolder='./certificate'
count=0;
num=1;
folder='folder0';
if [ -e $folder ]
then
    echo '已经存在';
else
    mkdir $folder;
fi;
cishu=0;
for file in `ls $srcfolder`;do
    echo $count;
    if [ $count -ge $num ]
    then
        echo '大于等于50';
        cishu=`expr $cishu + 1`;
        suffix=`expr ${count} \* $cishu`;
        echo suffix;
        folder='folder'$suffix;
        if [ -e $folder ]
        then
            echo '已经存在';
        else
            mkdir $folder;
        fi;
        count=0;
    fi;
    mv $srcfolder'/'$file  $folder'/'$file;
    count=`expr $count + 1` ;
done;