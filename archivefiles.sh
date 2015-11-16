source /opt/IBM/MDM/server/BatchProcessor/bin/deltaloadconfig.sh
echo "Archiving file started ..... .. " 


archiveFile(){
#echo ==========================
statfile=$1/$2_batchLoadStatistics.out
echo $statfile
successfile=$1/$2_batchLoadSuccess.out
failfile=$1/$2_batchLoadFail.out
if [ -f $statfile ] ;
then
echo archive $3 and related files 
mv $statfile $4
mv $successfile $4
mv $failfile $4
mv $3 $4
else 
echo Files not available for archive
fi 
#echo ==========================
echo 

}





while read file; do
folderpath=`dirname $file`
archivefolderpath=${folderpath//input/archive}
fn=`basename $file | cut -f1 -d'.'`
archiveFile $folderpath $fn $file $archivefolderpath </dev/null
done <$1



echo "Archiving file finished" 




