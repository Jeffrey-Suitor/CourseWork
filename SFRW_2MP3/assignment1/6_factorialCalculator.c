#include <stdio.h>

int main(void)
{
	int input;
	int i=0;
	int factorialNumber=1;
	printf("Please input the number you'd like to know the factorial of.\n");
    scanf("%d", &input);
    while(i < input)
	{
		factorialNumber=factorialNumber*(i+1);
		i=i+1;
	}
	printf("The factorial of the number you entered is %d.\n", factorialNumber);

}

