#include<iostream>
#include<cmath>
#include<chrono>
#include<vector>

int main()
{
	int  n=600;
	int N=100;
	for(int n:{150,200,250,300,350,400,450,500,550,600,700}){
	for(int m =0 ; m<N;m++){
		 double A[n][n];
		 double B[n][n];
	
		for ( int i=0;i<n; i++){
				for(int j=0;j<n;j++){
					B[i][j] = 0;
					A[i][j] = i*j;}
				}
		auto start = std::chrono::high_resolution_clock::now();
		
		for ( int j=0;j<n; j++){
				for(int i=0;i<n;i++){
					B[j][i] = A[i][j];
				}}
		
	auto end = std::chrono::high_resolution_clock::now();
	 B[1][1] = B[1][1]+1;
	auto duration = std::chrono::duration_cast<std::chrono::nanoseconds>(end-start).count(); //microseconds
	std::cout<<n<<";"<< duration<<std::endl;
	}

	}
	return 0;

}
