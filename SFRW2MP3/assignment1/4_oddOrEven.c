#include <stdio.h>

int main(void)
{
	int input;
	printf("What integer would you like to input?\n");
	scanf("%d", &input);
	if ( input % 2 == 0 ){
		printf("%d is an even number.\n", input);
		}
	else{
		printf("%d is an odd number.\n", input);
		}
	
}
