#!/bin/bash
binfile=ex4.bin

size64mb=0x4000000

rm -f ${binfile} || exit 1

# create a rand 64MB
./bin-create -randhex -size ${size64mb} -file ${binfile} -bs 1024 || exit 1

# copy upper 64MB to bottom 64MB in 128MB binary
./bin-cp -source ${binfile} -dest ${binfile} -source-offset 0x0 -dest-offset ${size64mb} -length ${size64mb} || exit 1

# dump some content for verify
echo "---------- 0x0 to 0x64 ---------- "
hexdump -C -v ${binfile} -s 0x0 -n 64

echo "---------- 0x3FFFFC0 to 0x3FFFFFF ---------- "
hexdump -C -v ${binfile} -s 0x3FFFFC0 -n 64

echo "---------- 0x4000000 to 0x4000064 ---------- "
hexdump -C -v ${binfile} -s 0x4000000 -n 64

echo "---------- 0x7FFFFC0 to 0x7FFFFFF ---------- "
hexdump -C -v ${binfile} -s 0x7FFFFC0 -n 64

echo "-------------------------------------------- "

echo done
