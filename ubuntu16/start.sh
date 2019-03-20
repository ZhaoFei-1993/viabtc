killall -s SIGQUIT matchengine.exe
sleep 1
matchengine/matchengine.exe matchengine/config.json
echo "matchegine runing......"

killall -s SIGQUIT alertcenter.exe
sleep 1
alertcenter/alertcenter.exe alertcenter/config.json
echo "alertcenter runing......"

killall -s SIGQUIT readhistory.exe
sleep 1
readhistory/readhistory.exe readhistory/config.json
echo "readhistory runing......"

killall -s SIGQUIT accesshttp.exe
sleep 1
accesshttp/accesshttp.exe accesshttp/config.json
echo "accesshttp runing......"

killall -s SIGQUIT accessws.exe
sleep 1
accessws/accessws.exe accessws/config.json
echo "accesshttp runing......"

killall -s SIGQUIT marketprice.exe
sleep 1
marketprice/marketprice.exe marketprice/config.json
echo "marketprice runing......"

exit
