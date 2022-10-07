echo "Theo doi bao nhieu coins:"
  read index
i=0
while [ $i -lt $index ]
  do
    echo "Nhap coin can theo doi:"
    read coin[i]
    i=`expr $i + 1`
  done
i=0
while [ $i -lt $index ]
  do
echo "Nhap gia can thong bao ${coin[i]} :"
  read gia[i]
      i=`expr $i + 1`
  done
while echo
  do
  i=0
  while [ $i -lt $index ]
    do
      price[i]=`curl -XGET 'https://api.coingecko.com/api/v3/simple/price?ids='${coin[i]}'&vs_currencies=usd'|grep -oE "[^:]+$" | sed 's/\./a/' | sed 's/}}/z/'`
      price[i]=`echo ${price[i]%%a*z} | sed 's/z//'`
      i=`expr $i + 1`
    done
  i=0
    while [ $i -lt $index ]
      do
      if [ ${price[i]} -ge $gia ]
      then
       echo "Gia ${coin[i]} lon hon gia dat"
       fi
      i=`expr $i + 1`
    done
    sleep 10
  done
echo "finished!"