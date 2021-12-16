#!/bin/bash
$1 <(echo -e ">A\n$2") <(echo -e ">B\n$3") -filter -data $4 -gapopen $5 -gapextend $6 -aformat markx3
