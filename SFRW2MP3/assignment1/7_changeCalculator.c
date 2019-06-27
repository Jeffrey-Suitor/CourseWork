#include <stdio.h>

int main(void)
{
	double valueArray[4]= {0.25, 0.10, 0.05, 0.01};
	const char* coinNames[4] = {"quarters", "dimes", "nickels", "pennies"};
	double changeValue;
	int combinationArray[] = {0,0,0,0};
	int coin=0;
	double acceptedDiff = 0.001;
	printf("Please input the value of your change.\n");
	scanf("%lf", &changeValue);
	
    while (changeValue >= acceptedDiff){
		if (changeValue >= valueArray[coin]){
			changeValue = changeValue - valueArray[coin];
			combinationArray[coin] = combinationArray[coin]+1;
		 }
		 else if (coin < 3){
			 coin = coin+1;
		 }
		 else if (changeValue > 0.001){
				 changeValue=changeValue-0.01;
				 combinationArray[3]= combinationArray[3]+1;
				 }
		 else{
			 break;
		 }
	}

	
	int rows = sizeof(valueArray)/sizeof(valueArray[0]);
	printf("Your combination of coins is ");
    for (int i = 0; i < rows; i++)
	{
		printf("%d %s ", combinationArray[i], coinNames[i]);
	}
printf("\n");
}

