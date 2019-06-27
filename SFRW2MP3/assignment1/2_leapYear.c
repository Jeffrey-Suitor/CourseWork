#include <stdio.h>
#include <math.h>

int main(void)
{	
	int inputYear;
	printf("Which year would you like to check to see if it's a leap year?\n");
	scanf("%d", &inputYear);
	if (remainder (inputYear,4) == 0) {
		printf("%d is a leap year.\n", inputYear);
	}
	else {
		printf("%d is not a leap year.\n", inputYear);
	}
}
