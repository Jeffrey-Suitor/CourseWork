#include <stdio.h>
#include <string.h>
#include <stdlib.h>

int main(void)
{	
	char input[200];
	int count=0;
	int numberArray[3];
	printf("Please input your intergers with a space seperating them.\n");
    scanf("%[^\n]", input);
    char* token=strtok(input, " ");
    while (token != NULL) {
		numberArray[count]= atoi(token);
        token = strtok(NULL, " "); 
        count=count+1;
	}
	int rows = sizeof(numberArray)/sizeof(numberArray[0]);
	
	for (int i = 0; i < rows; i++){
		for (int j = 0; j < rows; j++){
			if (numberArray[j] < numberArray[i]){
				int tmp = numberArray[i];
				numberArray[i]=numberArray[j];
				numberArray[j]=tmp;
			}
		}
	}
	printf("The descending order of your numbers is: ");
	for (int i = 0; i < rows; i++){
		printf("%d ", numberArray[i]);
	}
	printf("\n");
}

