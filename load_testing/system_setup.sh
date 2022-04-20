#!/bin/bash

numOfTxs=500
numOfWallets=50
threadCount=5
res_folder="./res"
wallet_csv=${wallet_csv:-./load_testing/$res_folder/wallets.csv}
transaction_csv=${transaction_csv:-./load_testing/$res_folder/transactions.csv}
customSampler=true

cd "$(dirname "$0")"
mkdir -p $res_folder &&
rm -f $res_folder/*  &&
./system_launch.sh -r &&
docker exec opencbdc-tx_client ./load_testing/gen_test_env.sh -w $wallet_csv -t $transaction_csv -n $numOfTxs -c $numOfWallets 

if [ $customSampler == false ]
then 
    echo "Starting Jmeter test with $threadCount threads on $numOfWallets wallets and $numOfTxs txs" &&
    docker exec opencbdc-tx_client /opt/apache-jmeter-5.4.3/bin/jmeter -t ./load_testing/TransactionTest_remote.jmx -l ./load_testing/$res_folder/results.jtl -j ./load_testing/$res_folder/jmeter.log -n -DtxCount=$numOfTxs -Dthreadcount=$threadCount 
    
else 
     echo "Starting Jmeter test with $threadCount threads on $numOfWallets wallets and $numOfTxs txs with Java JNI Sampler" &&
    docker exec opencbdc-tx_client /opt/apache-jmeter-5.4.3/bin/jmeter -t ./load_testing/TransactionTest_remote_w_CustomSampler.jmx -l ./load_testing/$res_folder/results.jtl -j ./load_testing/$res_folder/jmeter.log -n -DtxCount=$numOfTxs -Dthreadcount=$threadCount 
    
fi 