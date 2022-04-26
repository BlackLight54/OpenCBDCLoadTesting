#!/bin/bash 
. ./test.cfg



if [ $customSampler == false ]
then 
    echo "Starting Jmeter test with $threadCount threads on $numOfWallets wallets and $numOfTxs txs" &&
    docker exec opencbdc-tx_client /opt/apache-jmeter-5.4.3/bin/jmeter -t ./load_testing/TransactionTest_remote.jmx -l ./load_testing/$res_folder/results.jtl -j ./load_testing/$res_folder/jmeter.log -n -DtxCount=$numOfTxs -Dthreadcount=$threadCount 
    
else 
    # echo "Compiling sampler" 
    # cd ..
    # cd JmeterCustomSampler
    # mvn package &&
    # echo "copying sampler jar" &&
    # docker cp target/JmeterCustomSampler-1.0-SNAPSHOT.jar opencbdc-tx_client:/opt/apache-jmeter-5.4.3/lib/ext &&
    echo "Starting Jmeter test with $threadCount threads on $numOfWallets wallets and $numOfTxs txs with Java JNI Sampler" &&
    docker exec opencbdc-tx_client /opt/apache-jmeter-5.4.3/bin/jmeter -t ./load_testing/TransactionTest_remote.jmx -l ./load_testing/$res_folder/results.jtl -j ./load_testing/$res_folder/jmeter.log -n -JtxCount=$numOfTxs -JcustomSampler="true" -Dthreadcount=$threadCount 
    
fi 
docker attach opencbdc-tx_client