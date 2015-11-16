cd /opt/IBM/MDM/server/BatchProcessor/input
mkdir DeltaDataLoad
cd DeltaDataLoad
mkdir HFJ
mkdir LFJ
cd HFJ
mkdir customer
mkdir paymentsource
mkdir preferences
mkdir serviceprofile
mkdir order
mkdir stack
mkdir ild
cd ../LFJ
mkdir facebook
mkdir analytical

cd /opt/IBM/MDM/server/BatchProcessor/input
mkdir InitialDataLoad
cd InitialDataLoad
mkdir telcel
cd telcel
mkdir customer
mkdir paymentsource
mkdir preferences
mkdir serviceprofile
mkdir order
mkdir facebook
mkdir analytical

cd /opt/IBM/MDM/server/BatchProcessor/
mkdir archive
cd archive
mkdir DeltaDataLoad
cd DeltaDataLoad
mkdir HFJ
mkdir LFJ
cd HFJ
mkdir customer
mkdir paymentsource
mkdir preferences
mkdir serviceprofile
mkdir order
mkdir stack
mkdir ild
cd ../LFJ
mkdir facebook
mkdir analytical

cd /opt/IBM/MDM/server/BatchProcessor/bin/
chmod 755 archivefiles.sh
chmod 755 rundeltaload.sh
chmod 755 rundeltaloadjob.sh
chmod 755 deltaloadconfig.sh
chmod 755 emailnotification.sh
chmod 755 batchreload.sh
