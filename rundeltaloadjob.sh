source /opt/IBM/MDM/server/BatchProcessor/bin/deltaloadconfig.sh
echo "Starting Delta High Frequency Job ..... .. " 

# Takes 3 parameters
# $1 - full path of the file which needs to be run
# $2 - full path of the log directory
# $3 - Name of the data entity 
runFile(){

echo ==========================
echo Load $3 data

if [ -f $1 ] ;
then 
echo Loading file $1;
./runbatch.sh $1 $2

fn=`basename $1 | cut -f1 -d'.'`
mv $2/batchLoadFail.out $2/"$fn"_batchLoadFail.out
mv $2/batchLoadSuccess.out $2/"$fn"_batchLoadSuccess.out
mv $2/batchLoadStatistics.out $2/"$fn"_batchLoadStatistics.out
echo Loading $3 data finished;
else 
echo NO file available for $3 Data
fi 
echo ==========================
echo

}


while read file; do
folderpath=`dirname $file`
echo $folderpath
name=`basename $folderpath`
echo $name
runFile $file $folderpath $name </dev/null
done <$1

 
echo Delta High Frequency Job Finished.

