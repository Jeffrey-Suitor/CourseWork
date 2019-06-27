#include <stdio.h>
#include <math.h>

int main(void){
	float input[3]; int decimalValue; float roots[2]; int multiplier; float tmp;
	printf("Input your a value: ");
	scanf("%f", &input[0]);
	printf("Input your b value: ");
	scanf("%f", &input[1]);
	printf("Input your c value: ");
	scanf("%f", &input[2]);
	printf("Input your decimal accuracy: ");
	scanf("%d", &decimalValue);
	multiplier = pow(10, decimalValue);
	roots[0] = ((-1.0* input[1]) - pow((float)pow(input[1],2) - 4 * input[0] * input[2], 0.5))/(2*input[0]);
	roots[1] = ((-1.0* input[1]) + pow((float)pow(input[1],2) - 4 * input[0] * input[2], 0.5))/(2*input[0]);
	roots[0] = roundf(roots[0] * multiplier) / multiplier;
	roots[1] = roundf(roots[1] * multiplier) / multiplier;
	if (roots[0] < roots[1])
	{
		tmp = roots[0];
		roots[0] = roots[1];
		roots[1] = tmp;
	}
	printf("Your two roots are %g and %g.\n", roots[0], roots[1]);
}

