#! /bin/bash

mkdir result

rm result/no-op-col.csv
rm result/no-o1-col.csv
rm result/no-o2-col.csv
rm result/no-o3-col.csv

touch result/no-op-col.csv
touch result/no-o1-col.csv
touch result/no-o2-col.csv
touch result/no-o3-col.csv

g++ transpose.cpp -O0 -o trans-n0-op
g++ transpose.cpp -O1 -o trans-n1-op
g++ transpose.cpp -O2 -o trans-n2-op
g++ transpose.cpp -O3 -o trans-n3-op


./trans-n0-op >> result/no-op-col.csv
./trans-n1-op >> result/no-o1-col.csv
./trans-n2-op >> result/no-o2-col.csv
./trans-n3-op >> result/no-o3-col.csv
