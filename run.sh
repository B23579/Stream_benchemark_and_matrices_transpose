#! /bin/bash

mkdir result

rm result/no-op-row.csv
rm result/no-o1-row.csv
rm result/no-o2-row.csv
rm result/no-o3-row.csv

touch result/no-op-row.csv
touch result/no-o1-row.csv
touch result/no-o2-row.csv
touch result/no-o3-row.csv

g++ transpose.cpp -O0 -o trans-n0-op
g++ transpose.cpp -O1 -o trans-n1-op
g++ transpose.cpp -O2 -o trans-n2-op
g++ transpose.cpp -O3 -o trans-n3-op


./trans-n0-op >> result/no-op-row.csv
./trans-n1-op >> result/no-o1-row.csv
./trans-n2-op >> result/no-o2-row.csv
./trans-n3-op >> result/no-o3-row.csv
