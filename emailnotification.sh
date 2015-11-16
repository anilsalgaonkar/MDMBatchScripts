source /opt/IBM/MDM/server/BatchProcessor/bin/deltaloadconfig.sh
echo "Starting Notification ..... .. " 

if [ -f $emailtmpfile ] ;
then
rm $emailtmpfile
else
touch $emailtmpfile
fi


isStatsAvailable="false";
dt="$(date +'%m-%d-%Y')"
time="$(date +'%H:%M:%S')"
echo $dt $time

echo ======================================= >> $emailtmpfile
echo "MDM Delta Load HFJ Run Report " >> $emailtmpfile
echo ======================================= >> $emailtmpfile

printf '\n' >> $emailtmpfile
echo "Date: $dt" >> $emailtmpfile
echo "Time: $time" >> $emailtmpfile
printf '\n' >> $emailtmpfile


getStats(){

echo ==========================
statfile=$1/$3_batchLoadStatistics.out
if [ -f $statfile ] ;
then 
echo reading file $statfile
echo "=====$4=====" >> $emailtmpfile
cat $1/*batchLoadStatistics.out >> $emailtmpfile
printf '\n' >> $emailtmpfile
isStatsAvailable="true";
else 
echo NO file available for $2 statistics
fi 
echo ==========================
echo 

}


while read file; do
folderpath=`dirname $file`
name=`basename $folderpath`
fn=`basename $file | cut -f1 -d'.'`
echo $fn
getStats $folderpath $name $fn $file </dev/null
done <$1


echo $isStatsAvailable;

if [ "$isStatsAvailable" = "true" ];
then
echo Stats Available
echo sending email notification
cat -v $emailtmpfile | mail -s "MDM Delta Load HFJ Run Report " $emailidhfj
#cat -v $emailtmpfile | mail -s "MDM Delta Load HFJ Run Report " "asalgaonkar@tracfone.com, arios@tracfone.com, clindner@tracfone.com"
echo "Notification sent to $emailidhfj"
else
echo No stats available to report and notify
fi


rm $emailtmpfile




