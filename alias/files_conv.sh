
#sql


#changes all lines ending with linux in all files in current directory
alias crlftolf_recur="find . -type f -exec grep -qIP '\r\n' {} ';' -exec perl -pi -e 's/\r\n/\n/g' {} '+'"

#use force_utf8 orginalfile convertedfile
force_utf8() {
    CHARSET="$(file -bi "$1"|awk -F "=" '{print $2}')"
    echo "Founded Charset: $CHARSET use command > iconv -c -f $CHARSET -t utf8//IGNORE $1 > $2"
    iconv -c -f $CHARSET -t utf8//IGNORE $1 > $2
}