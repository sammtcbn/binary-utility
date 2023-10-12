#!/bin/bash
fn=output-64mb-77.bin
let fsize="64*1024*1024"
rm -f ${fn}
./bin-create -hex 77 -size ${fsize} -file ${fn}
