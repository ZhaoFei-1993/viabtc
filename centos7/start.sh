killall -s SIGQUIT matchengine.exe
sleep 1
matchengine/matchengine.exe matchengine/config.json
echo "matchengine start process......"

killall -s SIGQUIT alertcenter.exe
sleep 1
alertcenter/alertcenter.exe alertcenter/config.json
echo "alertcenter start process......"

killall -s SIGQUIT readhistory.exe
sleep 1
readhistory/readhistory.exe readhistory/config.json
echo "readhistory start process......"

killall -s SIGQUIT accesshttp.exe
sleep 1
accesshttp/accesshttp.exe accesshttp/config.json
echo "accesshttp start process......"

killall -s SIGQUIT accessws.exe
sleep 1
accessws/accessws.exe accessws/config.json
echo "accessws start process......"

killall -s SIGQUIT marketprice.exe
sleep 1
marketprice/marketprice.exe marketprice/config.json
echo "marketprice start process......"

sleep 1
echo "all runing......"