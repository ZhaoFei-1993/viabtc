TARGET  := matchengine.exe
#INCS = -I ../network -I ../utils
#LIBS = -L ../utils -lutils -L ../network -lnetwork -Wl,-Bstatic -lev -ljansson -lmpdec -lmysqlclient -lz -lrdkafka -lssl -lcrypto -lhiredis -Wl,-Bdynamic -lm -lpthread -ldl
INCS = -I ../network -I ../utils -I ../depends
LIBS = -L ../utils -lutils -L ../network -lnetwork -L ../depends/hiredis  -Wl,-Bstatic  -lhiredis  -Wl,-Bdynamic -ljansson -lmysqlclient -lrdkafka -lz  -Wl,-Bdynamic -lm -lpthread -ldl -lmpdec -lssl -lcrypto -lev -lcurl
include ../makefile.inc
