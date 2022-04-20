#!/bin/bash

numOfTxs=500
numOfWallets=50
threadCount=5
res_folder="./res"
wallet_csv=${wallet_csv:-./load_testing/$res_folder/wallets.csv}
transaction_csv=${transaction_csv:-./load_testing/$res_folder/transactions.csv}
customSampler=true

cd "$(dirname "$0")"
# ls && exit 0;
mkdir -p $res_folder &&
rm -f $res_folder/*  &&
./system_launch.sh -r &&
docker exec opencbdc-tx_client ./load_testing/gen_test_env.sh -w $wallet_csv -t $transaction_csv -n $numOfTxs -c $numOfWallets &&
./test_launch.sh

