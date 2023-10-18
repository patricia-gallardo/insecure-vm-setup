#! /bin/bash

# CSV file format: <ip address>,<user name>,<user password>,<root password>

arr_csv=()
while IFS= read -r line
do
    arr_csv+=("$line")
done < input.csv

echo "Displaying the contents of array mapped from csv file:"
index=0

for record in "${arr_csv[@]}"
do
  IFS=',' #setting comma as delimiter
  read -ra ROW <<<"${record}"

  export IP="${ROW[0]}"
  export USER="${ROW[1]}"
  export PASSWORD="${ROW[2]}"
  export ROOT_PASSWORD="${ROW[3]}"

  echo "$index."
  echo "-----------------------------------------"
  echo ""
  echo "Email info"
  echo ""
  echo "IP: $IP"
  echo "User: $USER"
  echo "Password: $PASSWORD"
  echo "Command: ssh $USER@$IP"
  echo ""

  #ssh training@$IP
  #(sshpass -p $ROOT_PASSWORD ssh root@$IP "export USER_PASSWORD=${PASSWORD} && bash <(curl -s https://raw.githubusercontent.com/patricia-gallardo/insecure-vm-setup/main/setup_user.sh)") || true
  (sshpass -p $PASSWORD ssh training@$IP 'df') || true
  echo ""
  echo "Finished $IP"
  echo "-----------------------------------------"
  echo ""

	((index++))
done
