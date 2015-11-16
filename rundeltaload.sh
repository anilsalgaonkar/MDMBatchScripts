source /opt/IBM/MDM/server/BatchProcessor/bin/deltaloadconfig.sh

sessionid=$RANDOM
sessionfile=../$sessionid
touch $sessionfile

find $customerfilepath -type f -name "*.xml"  >> $sessionfile
find $paymentsourcefilepath -type f -name "*.xml"  >> $sessionfile
find $preferencesfilepath -type f -name "*.xml"  >> $sessionfile
find $serviceprofilefilepath -type f -name "*.xml"  >> $sessionfile
find $ildfilepath -type f -name "*.xml"  >> $sessionfile
find $stackfilepath -type f -name "*.xml"  >> $sessionfile
find $orderfilepath -type f -name "*.xml"  >> $sessionfile
find $facebookfilepath -type f -name "*.xml"  >> $sessionfile




./rundeltaloadjob.sh $sessionfile
./emailnotification.sh $sessionfile
./archivefiles.sh $sessionfile