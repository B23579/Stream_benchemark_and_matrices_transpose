# Stream_benchemark_and_matrices_transpose
To run measure the running time of the large matrix size, compile and run this [code](https://github.com/B23579/Stream_benchemark_and_matrices_transpose/blob/main/caches_miss_check.cpp)

To run the cachegrind simulation, compile the previous code with a specific matrix size, and run the following command :


``
valgrind --tool=cachegrind ./sta
``


To measure the transposition running time for different matrix size less than 7001, run the following script:


``
run.sh
run_col.sh
``


For the stream benchmark, submit the job to the cluster. 

![plot](https://github.com/B23579/Stream_benchemark_and_matrices_transpose/blob/main/plot/run.png)

# Reference
(https://www.cs.virginia.edu/stream/ref.html#runrules)
