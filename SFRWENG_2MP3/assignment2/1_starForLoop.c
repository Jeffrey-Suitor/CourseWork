#include <stdio.h>

int main(void)
{
	int input; int starNumber; int spaces;
	printf("What size diamond would you like to make?\n");
	scanf("%d", &input);
	int maxSpaces = input*2-1;
	
	for (int i = 0; i < input; i++){
		starNumber = 1 + 2*i;
		spaces = (maxSpaces-starNumber)/2;
		printf("\n");
		for (int j = 0; j < maxSpaces; j++){
			if ((spaces <= j) && (j < maxSpaces - spaces)){
				printf("*");
			}
			else{
				printf(" ");
			}
		}
	}
	for (int i = input-2; i >= 0; i--){
		starNumber = 1 + 2*i;
		spaces = (maxSpaces-starNumber)/2;
		printf("\n");
		for (int j = 0; j < maxSpaces; j++){
			if ((spaces <= j) && (j < maxSpaces - spaces)){
				printf("*");}
			else{
				printf(" ");}
			}
	}
	printf("\n");
	
}
