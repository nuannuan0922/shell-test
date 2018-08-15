#!/bin/bash

# 遍历文件夹下的文件
folder="./certificate/smile1";
fsuffix="jpg";
str="空列,类型,事业部,部门,姓名,工号,时间\n";
for file in `ls ${folder}`;do
    a=$file;
    OLD_IFS="$IFS"
    IFS="_"
    arr=($a)
    IFS="$OLD_IFS"
    
    echo `文件名是：${file}`


    # 判断最后是否以jpg结尾 --- 开始
    last=${arr[${#arr[@]}-1]};
    dotindex=`expr index "$last" .`
    fileformat=${last:dotindex};

    if [ $fileformat = $fsuffix ]
    then
        timestr=${last:0:dotindex-1};
        echo ${timestr};
        # 长度不一致处理开始 ----- 交换位置
        len=4;
        newarr=();
        if [ ${#arr[@]} -eq $len ]
        then
            
            newarr=(
                ${arr[0]}
                'null'
                ${arr[1]}
                ${arr[2]}
                'null'
                ${timestr}
            );
        else 
            newarr=(
                ${arr[0]}
                ${arr[1]}
                ${arr[2]}
                ${arr[3]}
                ${arr[4]}
                ${timestr}
            )
        fi;
        # 长度不一致处理结束 ----- 交换位置

        # 拼接字符串 --- 开始
        for s in ${newarr[@]}
            do
                if [ $str != '' ] 
                then
                    str=${str}","${s}
                else
                    str=${s}
                fi
            done
        str=${str}'\n';
        # echo $str;
        # 拼接字符串 --- 结束
    else
        echo '结束符不正确！';
    fi;
    # 判断最后是否以jpg结尾 --- 结束
done;
# 写文件 --- 开始
echo -e "$str" > '1.csv';
csvfilename=$folder'/上传汇总.csv';
printf '\xEF\xBB\xBF' > $csvfilename
cat '1.csv' >> $csvfilename
rm -f '1.csv';
# 写文件 --- 结束
