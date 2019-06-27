#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <math.h>

struct student {
    char firstName[20];
    char lastName[20];
    int studentNumber;
    float courseGrade;
};

void printfInfo (struct student *studentArray, int numStudents){
    for (int i = 0; i < numStudents; i++) {
        printf("\nStudent %d : %s %s \n", i+1, studentArray[i].firstName, studentArray[i].lastName);
        printf("Student Number: %d\n",studentArray[i].studentNumber);
        printf("Course Grade: %g\n",studentArray[i].courseGrade);
    }
}

void meanMedianMode(struct student *studentArray, int numStudents){
    double averageHolder;
    float allGrades[numStudents][2];
    int count=0;
    int modeCount=0;
    int even=0;
    float highestCount[2]={0.00, 0.00}; //highest mode count, the number at that value
    for (int i = 0; i < numStudents; i++) {
        for (int j = 0; j < 2; j++) {
            allGrades[i][j]=0;
        }
    }
    for (int i = 0; i < numStudents; i++) {
        
        //mean
        averageHolder+=studentArray[i].courseGrade;
        
        //mode
        int flag=0;
        for (int j = 0; j < numStudents; j++) {
            if (allGrades[j][0]==studentArray[i].courseGrade){
                allGrades[j][1]++;
                flag=1;
            }
        }
        if (flag==0){
            allGrades[count][0] = studentArray[i].courseGrade;
            count++;
        }
    }
    for (int i = 0; i < numStudents; i++) {
        if (allGrades[i][1] > highestCount[1]){
            highestCount[0]=allGrades[i][0];
            highestCount[1]=allGrades[i][1];
        }
    }

    //median
    even=numStudents % 2 == 0 ? 0 : 1;
    if (even==0){
        printf("\n\nThe median is: %.2f\n", (studentArray[numStudents/2].courseGrade + studentArray[numStudents/2+1].courseGrade)/2/100);
    }
    else{
        printf("\n\nThe median is: %.2f\n", studentArray[numStudents/2+1].courseGrade/100);
    }
    printf("The average is: %.2f\n", averageHolder/numStudents/100);
    printf("The mode is: %.2f which appeared %g times.\n", highestCount[0]/100, highestCount[1]);
}

int main(void)
{   
    int numStudents;
    FILE *FIRSTNAMES;
    FILE *LASTNAMES;
    FIRSTNAMES=fopen("firstNames.txt", "r");;
    LASTNAMES=fopen("lastNames.txt", "r");
    char line[256];
    char firstNameArray[5000][256];
    char lastNameArray[256][256];
    int firstNameCount=0;
    int lastNameCount=0;

    while (fgets(line, sizeof(line), FIRSTNAMES)) {
        int i=0;
        while (line[i]!='\n'){
            firstNameArray[firstNameCount][i]= line[i];
            i++;
        }
        firstNameArray[firstNameCount][i+1]='\n';
        firstNameCount++;
    }
    
    while (fgets(line, sizeof(line), LASTNAMES)) {
        int i=0;
        while (line[i]!='\n'){
            lastNameArray[lastNameCount][i]= line[i];
            i++;
        }
        lastNameArray[lastNameCount][i+1]='\n';
        lastNameCount++;
    }    
    printf("How many students would you like to enter?: ");
    scanf("%d", &numStudents);
    struct student studentList[numStudents];
    for (int i = 0; i < numStudents; i++) {
        strcpy(studentList[i].firstName, firstNameArray[rand() % firstNameCount]);
        strcpy(studentList[i].lastName, lastNameArray[rand() % lastNameCount]);
        studentList[i].studentNumber=(rand() % (500000000- 400000000)) + 400000000;
        studentList[i].courseGrade=(rand() % 10000 );
        }

    printfInfo(studentList, numStudents);
    meanMedianMode(studentList, numStudents);
    return 0;
    }
