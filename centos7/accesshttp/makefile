TARGET  := accesshttp.exe
#INCS = -I ../network -I ../utils
INCS = -I ../network -I ../utils -I ../depends
#LIBS = -L ../utils -lutils -L ../network -lnetwork -Wl,-Bstatic -lev -ljansson -lmpdec -lrdkafka -lz -lssl -lcrypto -lhiredis -Wl,-Bdynamic -lm -lpthread -ldl
LIBS = -L ../utils -lutils -L ../network -lnetwork -L ../depends/hiredis  -Wl,-Bstatic  -lhiredis  -Wl,-Bdynamic -ljansson -lrdkafka -lz -Wl,-Bdynamic -lm -lpthread -ldl -lmpdec -lssl -lcrypto -lev -lcurl
include ../makefile.inc
