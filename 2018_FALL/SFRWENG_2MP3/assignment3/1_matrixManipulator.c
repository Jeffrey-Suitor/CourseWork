#include <stdio.h>
#include <string.h>
#include <stdlib.h>
//Global variables
int Acolumns, Arows, Bcolumns, Brows;
int Afilled=1; int Bfilled=1;

void insertValues(int matrixA[Arows][Acolumns], int matrixB[Brows][Bcolumns]){
	while (1){
        char choice;
        char format[8];
        printf("What matrix would you like to edit A or B?\n");
        scanf(" %c", &choice);
        if (choice=='a'|| choice=='A') {
            sprintf(format, "%%%dd", Acolumns);
            for (int i = 0; i < Arows; ++i) {
                printf("\nEnter your %d row with spaces seperating your %d values for matrix A.\n",i+1,Acolumns);
                for (int j = 0; j < Acolumns; j++) {
                    int input;
                    scanf(format, &input);
                    matrixA[i][j]=input;
                }
            }
            Afilled=0;
            break;
        }
        else if (choice=='b' || choice=='B') {
            sprintf(format, "%%%dd", Bcolumns);
            for (int i = 0; i < Brows; ++i) {
                printf("\nEnter your %d row with spaces seperating your %d values for matrix B.\n",i+1,Bcolumns);
                for (int j = 0; j < Bcolumns; j++) {
                    int input;
                    scanf(format, &input);
                    matrixB[i][j]=input;
                }
            }
            Bfilled=0;
            break;
        }
        else {
            printf ("That is not a valid option please try again\n");
            break;
        }        
    }
}
int subtractMatrices(int matrixA[Arows][Acolumns], int matrixB[Brows][Bcolumns]){
    while (1){
        if (Arows != Brows || Acolumns != Bcolumns){
            printf("You cannot subtract matrix A and B because they are not of the same size.\n");
            break;}
        int choice;
        int matrixC[Arows][Acolumns];
        printf("What matrix would you like to subtract 1.(A-B) or 2.(B-A)?\n");
        scanf("%d", &choice);
        if (choice==1) {
            printf("A-B is equal to:");
            for (int i = 0; i < Arows; ++i) {
                printf("\n");
                for (int j = 0; j < Acolumns; j++) {
                    matrixC[i][j]=matrixA[i][j]-matrixB[i][j];
                    printf("%d ", matrixC[i][j]);
                }
            }
            printf("\n");
            return 0;
        }
        else if (choice==2) {
            printf("B-A is equal to:");
            for (int i = 0; i < Arows; ++i) {
                printf("\n");
                for (int j = 0; j < Acolumns; j++) {
                    matrixC[i][j]=matrixB[i][j]-matrixA[i][j];
                    printf("%d ", matrixC[i][j]);
                }
            }
            printf("\n");
            return 0;
        }
        else {
            printf ("That is not a valid option please try again\n");
        }
    }
}
int printMatrix(int matrixA[Arows][Acolumns], int matrixB[Brows][Bcolumns]){
    while (1){
        char choice;
        int matrixC[Arows][Acolumns];
        printf("Would you like to print matrix A or B?\n");
        scanf(" %c", &choice);
        if (choice=='a' || choice=='A') {
            if (Afilled==1) {
                printf("Matrix A is unfilled please fill before proceeding.\n");
                return 1;
            }
            printf("\nMatrix A is:\n");
            for (int i = 0; i < Arows; ++i) {
                printf("\n");
                for (int j = 0; j < Acolumns; j++) {
                    printf("%d ", matrixA[i][j]);
                }
            }
            printf("\n");
            return 1;
        }
        else if (choice=='b' || choice=='B') {
            if (Bfilled==1) {
                printf("Matrix B is unfilled please fill before proceeding.\n");
                return 1;
            }
            printf("\nMatrix B is:\n");
            for (int i = 0; i < Brows; ++i) {
                printf("\n");
                for (int j = 0; j < Bcolumns; j++) {
                    printf("%d ", matrixB[i][j]);
                }
            }
            printf("\n");
            return 1;
        }
        else {
            printf ("That is not a valid option please try again\n");
            break;
        }
    }
}

int transposeMatrix(int matrixA[Arows][Acolumns], int matrixB[Brows][Bcolumns]){
    while (1){
        char choice;
        int matrixC[Arows][Acolumns];
        printf("Which would you like to transpose matrix A or B?\n");
        scanf(" %c", &choice);
        if (choice=='a' || choice=='A') {
            if (Afilled==1) {
                printf("Matrix A is unfilled please fill before proceeding.\n");
                return 1;
            }
            printf("Tranpose A equal to:\n"); 
            for (int j = 0; j < Acolumns; j++) {
                printf("\n");
                for (int i = 0; i < Arows; ++i) {
                    printf("%d ", matrixA[i][j]);
                }
            }
            printf("\n");
            return 1;
        }
        else if (choice=='b' || choice=='B') {
            if (Bfilled==1) {
                printf("Matrix B is unfilled please fill before proceeding.\n");
                return 1;
            }
            printf("Tranpose B equal to:\n"); 
            for (int j = 0; j < Bcolumns; j++) {
                printf("\n");
                for (int i = 0; i < Brows; ++i) {
                    printf("%d ", matrixB[i][j]);
                }
            }
            printf("\n");
            return 1;
        }
        else {
            printf ("That is not a valid option please try again\n");
            break;
        }
    }
}

int rowReducedMatrix(int matrixA[Arows][Acolumns], int matrixB[Brows][Bcolumns]){
    while (1){
        char choice;
        int matrixC[Arows][Acolumns];
        printf("Which would you like to transpose matrix A or B?\n");
        scanf(" %c", &choice);
        if (choice=='a' || choice=='A') {
            if (Afilled==1) {
                printf("Matrix A is unfilled please fill before proceeding.\n");
                return 1;
            }
            if (Arows==2 && Acolumns==2){
                if(matrixA[0][0]*matrixA[1][1]-matrixA[0][1]*matrixA[1][0]==0){
                    printf("The rank of matrix A is one.\n");
                    return 0;}
                else{
                    printf("The rank of matrix A is two.\n");
                    return 0;}
            }
            else{
                printf("Matrix A is not a valid 2x2 matrix\n.");
                return 0;}
        }
        
        else if (choice=='b' || choice=='B') {
            if (Bfilled==1) {
                printf("Matrix B is unfilled please fill before proceeding.\n");
                return 1;
            }
            if (Brows==2 && Bcolumns==2){
                if(matrixB[0][0]*matrixB[1][1]-matrixB[0][1]*matrixB[1][0]==0){
                    printf("The rank of matrix B is one.\n");
                    return 0;}
                else{
                    printf("The rank of matrix B is two.\n");
                    return 0;}
            }
            else{
                printf("Matrix B is not a valid 2x2 matrix.\n");
                return 0;}
        }
        else{
            printf("This is not a valid choice please try again.\n");}
    } 
}
int main(void){
	char input[200];
	int count=0;
	int matrixSize[4]; // 0=Arows 1=Acolumns 2=Brows 3=Bcolumns
	int numberInput;
	int quit;
	printf("Please input the N by M size of matrix A followed by B with a space seperating them.\n\n");
    scanf("%[^\n]", input);
    char* token=strtok(input, " ");
    while (token != NULL) {
		matrixSize[count]= atoi(token);
        token = strtok(NULL, " "); 
        count=count+1;
	}
    Arows=matrixSize[0];
    Acolumns=matrixSize[1];
    Brows=matrixSize[2];
    Bcolumns=matrixSize[3];
    int matrixB[Brows][Bcolumns];
    int matrixA[Arows][Acolumns];
    while (1){
		printf("\nWhat would you like to do with your matrices.\n"
				"1. Load Values in the Matrix (A or B)\n"
				"2. Subtract matrices (A-B or B-A)\n"
				"3. Print matrix (A or B)\n"
				"4. Transpose matrix (A or B)\n"
				"5. Rank of matrix (A or B)\n"
				"6. Exit\n\n");
		scanf("%d", &numberInput);
		switch(numberInput){
			case 1:
                insertValues(matrixA,matrixB);
                break;
			case 2:
                if (Afilled==1 && Bfilled==1) {
                    printf("You have not filled any matrices. Please fill them before proceeding.\n");}
                else if (Afilled==1) {
                    printf("Matrix A is unfilled. Please fill before proceeding.\n");}
                else if (Bfilled==1) {
                    printf("Matrix B is unfilled. Please fill before proceeding.\n");}
                else{
                subtractMatrices(matrixA,matrixB);}
				break;
			case 3:
				printMatrix(matrixA,matrixB);
                break;
			case 4:
				transposeMatrix(matrixA,matrixB);
				break;
			case 5:
				rowReducedMatrix(matrixA,matrixB);
				break;
			case 6:
				printf("\nAre you sure you want to quit?\n1. Yes\n2. No\n\n");
				scanf("%d",&quit);
				if (quit == 1){
					exit(0);}
				else{
					break;}
		}
	}
	return 0;
}

