#!/bin/bash
for file in `ls ./folder`;do
    a=$file;
    OLD_IFS="$IFS"
    IFS="_"
    arr=($a)
    IFS="$OLD_IFS"
    tmp=${arr[1]};
    arr[1]=${arr[2]};
    arr[2]=${tmp};
    echo ${file};
    old_file='';
    for s in ${arr[@]}
        do
            if [ $old_file != '' ] 
            then
                old_file=${old_file}'_'${s}
            else
                old_file=${s}
            fi
        done
    echo ${old_file};
    mv './folder/'$file $old_file
done;
# echo $file;
# echo $old_file;
# echo "------------------";
# a="one,two,three,four"
# #要将$a分割开，可以这样：
# OLD_IFS="$IFS"
# IFS=","
# arr=($a)
# IFS="$OLD_IFS"
# for s in ${arr[@]}
# do
# echo "$s"
# done
# echo "------------------";
# echo "Hello World !"
# abc="hello world! abc";
# echo ${abc};
# for file in `ls ./folder`;do
#     oldstr=$file;
#     arr=(
#         ${file:0:`expr index "$file" _` - 1}
#     );
#     echo ${arr};
#     echo $file;
# done;