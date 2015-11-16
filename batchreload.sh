#!/bin/ksh
####################### {COPYRIGHT-TOP} ###########################
# Licensed Materials - Property of CTS
# Restricted Materials of CTS
# 
# Created By: Sandeep Malagar (430928)
# Created Date: 18/08/2015
####################### {COPYRIGHT-TOP} ###########################
####################### DESCRIPTION ###############################
# 1. Get all the request xml that has failed for a specific error code from the "batchLoadFail.out" file.
# 2. Write the xml's into a separate file.
# 3. This script will be executed with two input parameters as:
#    ./batchReload.sh failedouputfile '1001418|1001420' 'batchinput.xml' 
#
# 4. The second input parameter represents the error reason codes with pipe delimiter
# 5. The third input parameter represents the file name in which the xml's will be written
#
# Note:
# The "batchLoadFail.out" location will be different for the DEV/QA env.
# 
#

cat $1 | egrep -s 'ReasonCode|/TCRMService' | sed -e 's/<\/TCRMService>,//g' | sed ':a;N;$!ba;s/\n/ /g' | sed 's/<ReasonCode>/\n/g' | sed '/^\s*$/d' | egrep -s $2 | sed -e 's/.*<TCRMService/<TCRMService/g'  > $3