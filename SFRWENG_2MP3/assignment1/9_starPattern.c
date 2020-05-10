#include <stdio.h>

int main(void){
	int input; 
	printf("Enter your start pattern size.\n");
	scanf("%d", &input);
	for (int i = 0; i < input; i++){  // Print all rows
		printf("\n");
		for (int j = 0; j < input; j++){  // Fill columns with *
			printf("*");
		}
	}
	printf("\n");
}
