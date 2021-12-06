#include <stdio.h>

struct student {
    char firstName[20];
    char lastName[20];
    int studentNumber;
    char program[20];
    float GPA;
};

void gpaCalculator (struct student *student){
	float input=student->GPA*10;
	float gradeRanges[][3] = {
								{0.0,0.0,0.0},
								{0.1,1.0,2.0},
								{0.2,3.0,3.0},
								{0.3,4.0,5.0},
								{0.4,6.0,6.0},
								{0.5,7.0,8.0},
								{0.6,9.0,9.0},
								{0.7,10.0,12.0},
								{0.8,13.0,15.0},
								{0.9,16.0,17.0},
								{1.0,18.0,21.0},
								{1.1,22.0,24.0},
								{1.2,25.0,27.0},
								{1.3,28.0,30.0},
								{1.4,31.0,33.0},
								{1.5,34.0,36.0},
								{1.6,37.0,39.0},
								{1.7,40.0,42.0},
								{1.8,43.0,45.0},
								{1.9,46.0,48.0},
								{2.0,49.0,51.0},
								{2.1,52.0,54.0},
								{2.2,55.0,57.0},
								{2.3,58.0,60.0},
								{2.4,61.0,63.0},
								{2.5,64.0,66.0},
								{2.6,67.0,69.0},
								{2.7,70.0,72.0},
								{2.8,73.0,75.0},
								{2.9,76.0,78.0},
								{2.0,79.0,81.0},
								{3.1,82.0,84.0},
								{3.2,85.0,87.0},
								{3.3,88.0,90.0},
								{3.4,91.0,93.0},
								{3.5,94.0,96.0},
								{3.6,97.0,99.0},
								{3.7,100.0,102.0},
								{3.8,103.0,105.0},
								{3.9,106.0,108.0},
							};
	int rows = sizeof(gradeRanges)/sizeof(gradeRanges[0]);
	for (int i; i<=rows; i++){
		if ((gradeRanges[i][1] <= input) && (input <= gradeRanges[i][2])){
			printf("\nThe student's GPA is %g.\n",gradeRanges[i][0]);
			break;
			}
		else if (input >= 109){
			printf("\nThe Student's GPA is a 4.0.\n");
			break;
		}
	}
}

void printInformation (struct student *student){
    printf("\nFirst name: %s\n", student->firstName);
    printf("Last name: %s\n", student->lastName);
    printf("Student Number: %d\n", student->studentNumber);
    printf("Program: %s\n", student->program);
    printf("GPA: %g\n", student->GPA);}

int main(void){
    int test;
    struct student Student1;
    struct student *ptrStudent;
    ptrStudent=&Student1;

    do{
    printf("\nPlease enter the first name of the student: ");
    test=scanf(" %[a-zA-Z]", ptrStudent->firstName);
    while(getchar()!= '\n');
    }while(test!=1);

    do{
    printf("Please enter the last name of the student: ");
    test=scanf(" %[a-zA-Z]", ptrStudent->lastName);
    while(getchar()!= '\n');
    }while(test!=1);

    do{
    printf("Please enter the student number of the student: ");
    test=scanf(" %d", &ptrStudent->studentNumber);
    while(getchar()!= '\n');
    }while(test!=1);

    do{
    printf("Please enter the program of the student: ");
    test=scanf(" %[a-zA-Z]", ptrStudent->program);
    while(getchar()!= '\n');
    }while(test!=1);

    do{
    printf("Please enter the GPA of the student: ");
    test=scanf(" %f", &ptrStudent->GPA);
    test=(ptrStudent->GPA<0 || ptrStudent->GPA>12) ? 0 : 1;
    while(getchar()!= '\n');
    }while(test!=1);

    gpaCalculator(ptrStudent);
    printInformation(ptrStudent);
    //Add a way to prevent the user from inputting invalid data

    return 0;
}
