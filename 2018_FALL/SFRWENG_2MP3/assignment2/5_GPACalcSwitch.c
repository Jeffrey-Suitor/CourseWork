#include <stdio.h>
#include <math.h>

int main(void){
	float input;
	printf("What is your mark?\n");
	scanf( "%f", &input);
	input = input*10;
	switch((int)input){
		case 0 ... 0:
			printf("Your GPA is 0");
			break;
		case 1 ... 2:
			printf("Your GPA is 0.1");
			break;
		case 3 ... 3:
			printf("Your GPA is 0.2");
			break;
		case 4 ... 5:
			printf("Your GPA is 0.3");
			break;
		case 6 ... 6:
			printf("Your GPA is 0.4");
			break;
		case 7 ... 8:
			printf("Your GPA is 0.5");
			break;
		case 9 ... 9:
			printf("Your GPA is 0.6");
			break;
		case 10 ... 12:
			printf("Your GPA is 0.7");
			break;
		case 13 ... 15:
			printf("Your GPA is 0.8");
			break;
		case 16 ... 17:
			printf("Your GPA is 0.9");
			break;
		case 18 ... 21:
			printf("Your GPA is 1");
			break;
		case 22 ... 24:
			printf("Your GPA is 1.1");
			break;
		case 25 ... 27:
			printf("Your GPA is 1.2");
			break;
		case 28 ... 30:
			printf("Your GPA is 1.3");
			break;
		case 31 ... 33:
			printf("Your GPA is 1.4");
			break;
		case 34 ... 36:
			printf("Your GPA is 1.5");
			break;
		case 37 ... 39:
			printf("Your GPA is 1.6");
			break;
		case 40 ... 42:
			printf("Your GPA is 1.7");
			break;
		case 43 ... 45:
			printf("Your GPA is 1.8");
			break;
		case 46 ... 48:
			printf("Your GPA is 1.9");
			break;
		case 49 ... 51:
			printf("Your GPA is 2");
			break;
		case 52 ... 54:
			printf("Your GPA is 2.1");
			break;
		case 55 ... 57:
			printf("Your GPA is 2.2");
			break;
		case 58 ... 60:
			printf("Your GPA is 2.3");
			break;
		case 61 ... 63:
			printf("Your GPA is 2.4");
			break;
		case 64 ... 66:
			printf("Your GPA is 2.5");
			break;
		case 67 ... 69:
			printf("Your GPA is 2.6");
			break;
		case 70 ... 72:
			printf("Your GPA is 2.7");
			break;
		case 73 ... 75:
			printf("Your GPA is 2.8");
			break;
		case 76 ... 78:
			printf("Your GPA is 2.9");
			break;
		case 79 ... 81:
			printf("Your GPA is 3");
			break;
		case 82 ... 84:
			printf("Your GPA is 3.1");
			break;
		case 85 ... 87:
			printf("Your GPA is 3.2");
			break;
		case 88 ... 90:
			printf("Your GPA is 3.3");
			break;
		case 91 ... 93:
			printf("Your GPA is 3.4");
			break;
		case 94 ... 96:
			printf("Your GPA is 3.5");
			break;
		case 97 ... 99:
			printf("Your GPA is 3.6");
			break;
		case 100 ... 102:
			printf("Your GPA is 3.7");
			break;
		case 103 ... 105:
			printf("Your GPA is 3.8");
			break;
		case 106 ... 108:
			printf("Your GPA is 3.9");
			break;
		case 109 ... 120:
			printf("Your GPA is 4.0");
			break;
	}
	printf("\n");
}

