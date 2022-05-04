cat topics.401-450.txt|grep "^<title>"|sed "s/[[:punct:]]//g"|sed "s/title/<query>\n/g"|sed "/^<query>/!s/$/\n<\/query>/g"|sed "/^</!s/^/   /g"|sed "s/^/    /g">query_title.txt
sed -i "1i<parameters>" query_title.txt
echo "</parameters>">>query_title.txt
