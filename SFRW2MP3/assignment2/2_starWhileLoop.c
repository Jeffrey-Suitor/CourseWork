#include <stdio.h>

int main(void)
{
	int input; int starNumber; int spaces; int i=0;
	printf("What size diamond would you like to make?\n");
	scanf("%d", &input);
	int maxSpaces = input*2-1;
	do{
		starNumber = 1 + 2*i;
		spaces = (maxSpaces-starNumber)/2;
		printf("\n");
		i = i+1;
		int j=0;
		do{
			if ((spaces <= j) && (j < maxSpaces - spaces)){
				printf("*");
			}
			else{
				printf(" ");
			}
			j = j+1;
		}while (j < maxSpaces);
	}while (i < input);
	i = input - 2;
	while (i >= 0){
		starNumber = 1 + 2*i;
		spaces = (maxSpaces-starNumber)/2;
		printf("\n");
		i = i-1;
		int j=0;
		while (j < maxSpaces){
			if ((spaces <= j) && (j < maxSpaces - spaces)){
				printf("*");
			}
			else{
				printf(" ");
			}
			j = j+1;
		}
	}
	printf("\n\n");
}



