#/bin/bash
#Usage Example
#sh block_replace.sh src_file dest_file text_holder_file
sed '/<tag>/, /<\/tag>/ {
    /<tag>/n
   /<\/tag>/ !{d}
}' <$1 >$2

TEXT=`cat $3`
LINES=`cat $2`
rm $2
for line in ${LINES}
do
   echo ${line}>>$2
   line="${line##*( )}"; #Remove leading spaces
   line="${line%%*( )}"; #Remove trailing spaces
   if [ ${line} == '<tag>' ]; then
      echo ''>>$2
      for text in ${TEXT}
      do
         echo ${text}>>$2
      done
      echo ''>>$2
   fi
done
