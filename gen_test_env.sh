#!/bin/bash
. ./load_testing/colors
. ./load_testing/test.cfg

[ $remote == true ] && echo -ne "${CYAN}remote mode${NC}" && cd "$(dirname "$0")"
echo ""
./gen_wallets.sh -w $wallet_csv -n $numOfWallets &&
./gen_transfers.sh -w $wallet_csv -t $transaction_csv -n $numOfTxs 