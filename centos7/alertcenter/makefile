TARGET  := alertcenter.exe
#INCS = -I ../network -I ../utils
#LIBS = -L ../utils -lutils -L ../network -lnetwork -Wl,-Bstatic -lev -lhiredis -ljansson -lmpdec -lcurl -lssl -lcrypto -Wl,-Bdynamic -lm
INCS = -I ../network -I ../utils -I ../depends
LIBS = -L ../utils -lutils -L ../network -lnetwork -L  ../depends/hiredis  -Wl,-Bstatic  -lhiredis  -Wl,-Bdynamic -ljansson -lrdkafka -lz  -Wl,-Bdynamic -lm -lpthread -ldl -lmpdec -lssl -lcrypto -lev -lcurl
include ../makefile.inc

