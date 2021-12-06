#include <stdio.h>
#include <stdlib.h>

int player1[10][10]={0};
int player2[10][10]={0};
int player=1;
int playingView1[10][10]={0};
int playingView2[10][10]={0};
void displayBoardSetup(void){   
    if (player==1){
        printf("---------------------------------------------\n");
        printf("############## Player 1 Board ###############\n");
        printf("---------------------------------------------\n");
        printf("|   | 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 |\n");
        for (int i = 0; i < 10; ++i) {
            printf("---------------------------------------------\n");
            printf("| %d ",i);
            for (int j = 0; j < 10; j++) {
                switch(player1[i][j]){
                case 0:  // Empty
                    printf("|   ");
                    break;
                case 1:  //Own battleship
                    printf("| B ");
                    break;
                case 2:
                    printf("| X ");  // Hit
                    break;
                case 3:
                    printf("| O ");  // Miss
                    break;
                }
            }
            printf("|\n");
        }
    }
    if (player==2){
        printf("---------------------------------------------\n");
        printf("############## Player 2 Board ###############\n");
        printf("---------------------------------------------\n");
        printf("|   | 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 |\n");
        for (int i = 0; i < 10; ++i) {
            printf("---------------------------------------------\n");
            printf("| %d ",i);
            for (int j = 0; j < 10; j++) {
                switch(player2[i][j]){
                case 0:  // Empty
                    printf("|   ");
                    break;
                case 1:  //Own battleship
                    printf("| B ");
                    break;
                case 2:
                    printf("| X "); //Hit
                    break;
                case 3:
                    printf("| O "); //Miss
                    break;
                case 4:
                    printf("| F "); //Hit and own battleship
                }
            }
            printf("|\n");
        }
    }
}

void displayBoard(void){   
    if (player==1){
        printf("---------------------------------------------\n");
        printf("############## Player 1 Board ###############\n");
        printf("---------------------------------------------\n");
        printf("|   | 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 |\n");
        for (int i = 0; i < 10; ++i) {
            printf("---------------------------------------------\n");
            printf("| %d ",i);
            for (int j = 0; j < 10; j++) {
                switch(playingView1[i][j]){
                case 0:  // Empty
                    printf("|   ");
                    break;
                case 1:  //Own battleship
                    printf("| B ");
                    break;
                case 2:
                    printf("| X ");  // Hit
                    break;
                case 3:
                    printf("| O ");  // Miss
                    break;
                }
            }
            printf("|\n");
        }
    }
    if (player==2){
        printf("---------------------------------------------\n");
        printf("############## Player 2 Board ###############\n");
        printf("---------------------------------------------\n");
        printf("|   | 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 |\n");
        for (int i = 0; i < 10; ++i) {
            printf("---------------------------------------------\n");
            printf("| %d ",i);
            for (int j = 0; j < 10; j++) {
                switch(playingView2[i][j]){
                case 0:  // Empty
                    printf("|   ");
                    break;
                case 1:  //Own battleship
                    printf("| B ");
                    break;
                case 2:
                    printf("| X "); //Hit
                    break;
                case 3:
                    printf("| O "); //Miss
                    break;
                case 4:
                    printf("| F "); //Hit and own battleship
                }
            }
            printf("|\n");
        }
    }
}

int ship(int size){
    int inputx;
    int inputy;
    int rightTest=0;
    int leftTest=0;
    int upTest=0; 
    int downTest=0;
    char option;
    if (player==1){
        printf("Enter the first coordinate for your %d square battleship with a space seperating your values. X then Y.\n", size);
        scanf("%d %d", &inputx, &inputy);

        if (inputx <0 || inputx >9 || inputy <0 || inputy>9){
            printf("That is not a valid option.\n");
            return 1;}

        //Right test
        for (int i = 0; i < size; ++i) {
            if (player1[inputy][inputx+i]!=0){
                rightTest=1;}}
        if (rightTest==0){
            if (inputx+size-1 >=0 && inputx+size-1<=9){
                printf("A. Place right ending at: %d, %d\n", inputx+size-1, inputy);}
            else{
                rightTest=1;}}
        
        //Left test
        for (int i = 0; i < size; ++i) {
            if (player1[inputy][inputx-i]!=0){
                leftTest=1;}}
        if (leftTest==0){
            if (inputx-size-1 >=0 && inputx-size-1<=9){
                printf("B. Place left ending at: %d, %d\n", inputx-size-1, inputy);}
            else{
                leftTest=1;}} 
        
        //Down test
        for (int i = 0; i < size; ++i) {
            if (player1[inputy+i][inputx]!=0){
                downTest=1;}}
        if (downTest==0){
            if (inputy+size-1 >=0 && inputy+size-1<=9){
                printf("C. Place down ending at: %d, %d\n", inputx, inputy+size-1);}
            else{
                downTest=1;}}
        
        //Up test
        for (int i = 0; i < size; ++i) {
            if (player1[inputy-i][inputx]!=0){
                upTest=1;}}
        if (upTest==0){
            if (inputy-size-1 >=0 && inputy-size-1<=9){
                printf("D. Place up ending at: %d, %d\n", inputx, inputy-size-1);}
            else{
                upTest=1;}}
        
        printf("E. Change initial point.\n");
        
        
        while(1){
            option=getchar();
            switch(option){
                case 'A':
                case 'a':
                    if (rightTest==0){
                        for (int i = 0; i < size; ++i) {
                            player1[inputy][inputx+i]=1;}
                        return 0;}
                    else{
                    printf("That is not a valid option.\n");
                    break;}
                case 'B':
                case 'b':
                        if (leftTest==0){
                        for (int i = 0; i < size; ++i) {
                            player1[inputy][inputx-i]=1;}
                        return 0;}
                    else{
                    printf("That is not a valid option.\n");
                    break;}
                case 'C':
                case 'c':
                        if (downTest==0){
                        for (int i = 0; i < size; ++i) {
                            player1[inputy+i][inputx]=1;}
                        return 0;}
                    else{
                    printf("That is not a valid option.\n");
                    break;}
                case 'D':
                case 'd':
                        if (upTest==0){
                        for (int i = 0; i < size; ++i) {
                            player1[inputy-i][inputx]=1;}
                        return 0;}
                    else{
                    printf("That is not a valid option.\n");
                    break;}
                case 'E':
                case 'e':
                    return 1;
            }
        }
    }
    if (player==2){
        printf("Enter the first coordinate for your battleship with a space seperating your values. X then Y.\n");
        scanf("%d %d", &inputx, &inputy);

        if (inputx <0 || inputx >9 || inputy <0 || inputy>9){
            printf("That is not a valid option.\n");
            return 1;}
        
        //Right test
        for (int i = 0; i < size; ++i) {
            if (player2[inputy][inputx+i]!=0){
                rightTest=1;}}
        if (rightTest==0){
            if (inputx+size-1 >=0 && inputx+size-1<=9){
                printf("A. Place right ending at: %d, %d\n", inputx+size-1, inputy);}
            else{
                rightTest=1;}}
        
        //Left test
        for (int i = 0; i < size; ++i) {
            if (player2[inputy][inputx-i]!=0){
                leftTest=1;}}
        if (leftTest==0){
            if (inputx-size-1 >=0 && inputx-size-1<=9){
                printf("B. Place left ending at: %d, %d\n", inputx-size-1, inputy);}
            else{
                leftTest=1;}} 
        
        //Down test
        for (int i = 0; i < size; ++i) {
            if (player2[inputy+i][inputx]!=0){
                downTest=1;}}
        if (downTest==0){
            if (inputy+size-1 >=0 && inputy+size-1<=9){
                printf("C. Place down ending at: %d, %d\n", inputx, inputy+size-1);}
            else{
                downTest=1;}}
        
        //Up test
        for (int i = 0; i < size; ++i) {
            if (player2[inputy-i][inputx]!=0){
                upTest=1;}}
        if (upTest==0){
            if (inputy-size-1 >=0 && inputy-size-1<=9){
                printf("D. Place up ending at: %d, %d\n", inputx, inputy-size-1);}
            else{
                upTest=1;}}
        
        printf("E. Change initial point.\n");
        
        
        while(1){
            option=getchar();
            switch(option){
                case 'A':
                case 'a':
                    if (rightTest==0){
                        for (int i = 0; i < size; ++i) {
                            player2[inputy][inputx+i]=1;}
                        return 0;}
                    else{
                    printf("That is not a valid option.\n");
                    break;}
                case 'B':
                case 'b':
                        if (leftTest==0){
                        for (int i = 0; i < size; ++i) {
                            player2[inputy][inputx-i]=1;}
                        return 0;}
                    else{
                    printf("That is not a valid option.\n");
                    break;}
                case 'C':
                case 'c':
                        if (downTest==0){
                        for (int i = 0; i < size; ++i) {
                            player2[inputy+i][inputx]=1;}
                        return 0;}
                    else{
                    printf("That is not a valid option.\n");
                    break;}
                case 'D':
                case 'd':
                        if (upTest==0){
                        for (int i = 0; i < size; ++i) {
                            player2[inputy-i][inputx]=1;}
                        return 0;}
                    else{
                    printf("That is not a valid option.\n");
                    break;}
                case 'E':
                case 'e':
                    return 1;
            }
        }
    }
}

void switchPlayers(void){
    for (int i = 0; i < 100; ++i) {
        printf("\n");
    }
    if (player==1){
        player=2;}
    else{
        player=1;}
}

void playGame(void){
    int player1Score=0;
    int player2Score=0;
    int attackX;
    int attackY;
    char filler;
    while(1){
        int switchFlag=0;
        if (player1Score==12){
            printf("Player 1 wins!!! You have sunk your opponents battleships.\n");
            exit(0);}    
        
        if (player2Score==12){
            printf("Player 2 wins!!! You have sunk your opponents battleships.\n");
            exit(0);}
        
        printf("It is player %d's turn.\n", player);
        displayBoard();
        printf("Input the X and Y Coordinates you'd like to attack.\n");
        scanf("%d %d", &attackX, &attackY);
        if (player==1){
            if (playingView1[attackY][attackX]==3 || playingView1[attackY][attackX]==2){
                printf("You have already tried this spot please pick another.\n");
                switchFlag=1;}
            else{
                switch(player2[attackY][attackX]){
                case 1:
                    printf("Direct hit! Press a and enter to end your turn.\n");
                    player1Score++;
                    playingView1[attackY][attackX]=2;
                    scanf(" %c",&filler);
                    break;
                default:
                    printf("You missed. Press a and enter to end your turn\n");
                    playingView1[attackY][attackX]=3;
                    scanf(" %c",&filler);
                    break;
                }
            }
        }
        if (player==2){
            if (playingView2[attackY][attackX]==3 || playingView2[attackY][attackX]==2){
                printf("You have already tried this spot please pick another.\n");
                switchFlag=1;}
            else{
                switch(player1[attackY][attackX]){
                case 1:
                    printf("Direct hit! Press a and enter to end your turn.\n");
                    player2Score++;
                    playingView2[attackY][attackX]=2;
                    scanf(" %c",&filler);
                    break;
                default:
                    printf("You missed. Press a and enter to end your turn\n");
                    playingView2[attackY][attackX]=3;
                    scanf(" %c",&filler);
                    break;
                }
            }
        }
        if (switchFlag==0){
            switchPlayers();}
    }
}

int main(void){ 
    int returnCall;
    for (int i = 0; i < 2; ++i) {
        returnCall=1;
        displayBoardSetup();
        while(returnCall){
            returnCall=ship(5);}
        returnCall=1;
        displayBoardSetup();
        while(returnCall){
            returnCall=ship(4);}
        returnCall=1;
        displayBoardSetup();
        while(returnCall){
            returnCall=ship(3);}
        returnCall=1;
        displayBoardSetup();
        switchPlayers();
    }
    playGame();
}
