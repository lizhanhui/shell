#/bin/bash
#Usage Example
#sh block_replace.sh src_file dest_file text_holder_file
TEMP_FILE=_tmp.txt
sed '/<tag>/, /<\/tag>/ {
    /<tag>/n
   /<\/tag>/ !{d}
}' <$1 >$2

TEXT=`cat $3`
LINES=`cat $2`
for line in ${LINES}
do
   echo ${line}>>${TEMP_FILE};
   line="${line##*( )}"; #Remove leading spaces
   line="${line%%*( )}"; #Remove trailing spaces
   if [ ${line} == '<tag>' ]; then
      echo ''>>${TEMP_FILE};
      for text in ${TEXT}
      do
         echo ${text}>>${TEMP_FILE}; 
      done
      echo ''>>${TEMP_FILE};
   fi
done
rm $2
mv ${TEMP_FILE} $2
