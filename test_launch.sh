#!/bin/bash 
. ./test.cfg
. ./colors


if [ $customSampler == false ]
then 
    echo -e "Starting ${RED}Jmeter test${NC} with ${YELLOW}$threadCount${NC} threads on ${YELLOW}$numOfWallets${NC} wallets and ${YELLOW}$numOfTxs${NC} txs" &&
    docker exec opencbdc-tx_client /opt/apache-jmeter-5.4.3/bin/jmeter -t ./load_testing/TransactionTest_remote.jmx -l ./load_testing/$res_folder/results.jtl -j ./load_testing/$res_folder/jmeter.log -n -DtxCount=$numOfTxs -Dthreadcount=$threadCount 
    
else 
    # echo "Compiling sampler" 
    # cd ..
    # cd JmeterCustomSampler
    # mvn package &&
    # echo "copying sampler jar" &&
    # docker cp target/JmeterCustomSampler-1.0-SNAPSHOT.jar opencbdc-tx_client:/opt/apache-jmeter-5.4.3/lib/ext &&
    echo -e "Starting ${RED}Jmeter${NC} test with ${YELLOW}$threadCount${NC} threads on ${YELLOW}$numOfWallets${NC} wallets and ${YELLOW}$numOfTxs${NC} txs with Java JNI Sampler" &&
    docker exec opencbdc-tx_client /opt/apache-jmeter-5.4.3/bin/jmeter -t ./load_testing/TransactionTest_remote.jmx -l ./load_testing/$res_folder/results.jtl -j ./load_testing/$res_folder/jmeter.log -n -JtxCount=$numOfTxs -JcustomSampler="true" -Dthreadcount=$threadCount  
    # && docker attach opencbdc-tx_client
fi 