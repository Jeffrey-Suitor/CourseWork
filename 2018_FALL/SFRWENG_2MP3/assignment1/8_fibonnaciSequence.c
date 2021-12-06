#include <stdio.h>

int main(void)
{
	int printArray[300] = {0,1}; //Array for fibonnaci sequence
	int input;
	int fibonnaciNumber;
	int count=2;
	printf("Please input the number for the Fibonnaci sequence.\n");
	scanf("%d", &input);
	for (int i = 0; i < input-2; i++){  // -2 because array already had 2 values
		fibonnaciNumber = printArray[count-2] + printArray[count-1];  //Fibonnaci Sequence
		printArray[count] = fibonnaciNumber;
		count = count + 1;  // Increment cound
	}
	
	for (int i = 0; i < 300; i++){
		if (i == 0){
			printf("%d ", 0);  // Print the first 0
		}
		else if (printArray[i] != 0){ // Ignore all other 0
			printf("%d ", printArray[i]);  // Print the sequence
		}
	}
	printf("\n");
}
