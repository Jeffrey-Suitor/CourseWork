#include <stdio.h>
#include <ctype.h>
#include <string.h>

int main(void)
{
	char input[200];

	char* months[12] = {
		"january",
		"febuary",
		"march",
		"april",
		"may",
		"june",
		"july",
		"august",
		"september",
		"october",
		"november",
		"december",
		};
		
	int daysInMonths[12] = {31,28,31,30,31,30,31,31,30,31,30,31};
	int rows = sizeof(daysInMonths)/sizeof(daysInMonths[0]);
	printf("Please input your month.\n");
    scanf("%[^\n]", input);
    
	for(int i = 0; input[i]; i++){
		input[i] = tolower(input[i]);
	}
	
	for (int i; rows; i++){
		if (strcmp(input,months[i]) == 0){
			printf("There is %d days in %s.\n", daysInMonths[i], months[i]);
			break;
		}
	}
}

