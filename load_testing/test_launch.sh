#!/bin/bash 

threadCount=${threadCount:-5}
numOfWallets=${numOfWallets-50}
numOfTxs=${numOfTxs:-500}
res_folder=${res_folder:-"./res"}
wallet_csv=${wallet_csv:-./load_testing/$res_folder/wallets.csv}
transaction_csv=${transaction_csv:-./load_testing/$res_folder/transactions.csv}
customSampler=${customSampler:-true}


if [ $customSampler == false ]
then 
    echo "Starting Jmeter test with $threadCount threads on $numOfWallets wallets and $numOfTxs txs" &&
    docker exec opencbdc-tx_client /opt/apache-jmeter-5.4.3/bin/jmeter -t ./load_testing/TransactionTest_remote.jmx -l ./load_testing/$res_folder/results.jtl -j ./load_testing/$res_folder/jmeter.log -n -DtxCount=$numOfTxs -Dthreadcount=$threadCount 
    
else 
    echo "Compiling sampler" 
    cd ..
    cd JmeterCustomSampler
    mvn 
     echo "Starting Jmeter test with $threadCount threads on $numOfWallets wallets and $numOfTxs txs with Java JNI Sampler" &&
    docker exec opencbdc-tx_client /opt/apache-jmeter-5.4.3/bin/jmeter -t ./load_testing/TransactionTest_remote_w_CustomSampler.jmx -l ./load_testing/$res_folder/results.jtl -j ./load_testing/$res_folder/jmeter.log -n -DtxCount=$numOfTxs -Dthreadcount=$threadCount 
    
fi 