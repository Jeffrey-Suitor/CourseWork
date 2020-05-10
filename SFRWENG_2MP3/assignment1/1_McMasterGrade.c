#include <stdio.h>

int main(void)
{
	int input;
	int gradeRanges[13][3] = {
							 {0,0,49},
						     {1,50,52},
						     {2,53,56},
						     {3,57,59},
						     {4,60,62},
						     {5,63-66},
						     {6,67,69},
						     {7,70,72},
						     {8,73,76},
						     {9,77,79},
						     {10,80,84},
						     {11,85,89},
						     {12,90,100}
						     };


	int rows = sizeof(gradeRanges)/sizeof(gradeRanges[0]);
	printf("What is your mark?\n");
	scanf( "%d", &input);
	for (int i; i<=rows; i++){
		if ((gradeRanges[i][1] <= input) && (input <= gradeRanges[i][2])){
			printf("Your mark is %d\n",gradeRanges[i][0]);
			break;
			}
		}
	}
