#include<iostream>
#include<cmath>
#include<chrono>
#include<vector>

int main()
{
	 int const n=5000;
	 static double A[n][n];
	 static double B[n][n];

	for ( int i=0;i<n; i++){
			for(int j=0;j<n;j++){
				B[i][j] = 0;
				A[i][j] = i*j;}
			}
	auto start = std::chrono::high_resolution_clock::now();
	
	for ( int i=0;i<n; i++){
			for(int j=0;j<n;j++){
				B[j][i] = A[i][j];
			}}
	
	auto end = std::chrono::high_resolution_clock::now();
	B[1][1] = B[1][1]+1;
	auto duration = std::chrono::duration_cast<std::chrono::microseconds>(end-start).count(); //microseconds
	std::cout<<n<<";"<< duration<<std::endl;
	return 0;

}
