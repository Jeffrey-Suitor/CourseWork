#include <stdio.h>
#include <stdlib.h>
#include <string.h>

struct item{
    char name[30];
    int quantity;
    float cost;
} Produce[100], Deli[100], Bakery[100], frozenFoods[100];

int produceCount=0, deliCount=0, bakeryCount=0, frozenFoodsCount=0;

void addItem(struct item *itemList, int *counter){
    int test;
    
    do{
    printf("\nPlease enter the item name: ");
    test=scanf(" %[a-zA-Z ]", itemList[*counter].name);
    while(getchar()!= '\n');
    }while(test!=1);
   
    do{
    printf("\nPlease enter the item quantity: ");
    test=scanf(" %d", &itemList[*counter].quantity);
    while(getchar()!= '\n');
    }while(test!=1);
   
    do{
    printf("\nPlease enter the item cost: ");
    test=scanf(" %f", &itemList[*counter].cost);
    while(getchar()!= '\n');
    }while(test!=1);
    *counter+=1;
}

void addItemMenu(void){
    int input;
    while (1){
        printf("\nADD ITEM MENU\nWould you like to:\n1. Add an item to produce inventory\n2. Add an item to deli inventory\n3. Add an item to bakery inventory\n4. Add an item to frozen foods inventory\n5. Return to main menu\n");
        scanf("%d",&input);
        while(getchar()!='\n');
        switch(input){
            case 1:
                addItem(Produce, &produceCount);
                return;
            case 2:
                addItem(Deli, &deliCount);
                return;
            case 3:
                addItem(Bakery, &bakeryCount);
                return;
            case 4:
                addItem(frozenFoods, &frozenFoodsCount);
                return;
            case 5:
                printf("Returning to main menu.\n");
                return;
            default: 
                printf("Invalid option please try again.\n");
                break;
        }
    }
}

void editCost(struct item *itemList, int *counter){
    int selection;
    float cost;
    if (*counter==0){
        printf("There are no items in this category.\n");
        return;}

    for (int i = 0; i < *counter; i++) {
        printf("%d. %s\n", i+1, itemList[i].name);}
    
    printf("Select your item: ");
    while(1){
        int test =scanf("%d",&selection);
        printf("\n");
        while(getchar()!='\n');
        selection=selection-1;
        if (test!=1 || selection >= *counter){
            printf("Invalid option please try again.\n");}
        else{
            while(1){
                printf("Current cost for %s is %.2f\n", itemList[selection].name, itemList[selection].cost);
                printf("Set the new cost to: ");
                int test =scanf(" %f",&cost);
                while(getchar()!='\n');
                if (test!=1){
                    printf("Invalid option please try again.\n");}
                else{
                    itemList[selection].cost=cost;
                    break;
                }
            }
            break;
        }
    }
}

void editCostMenu(void){
    int input;
    while (1){
        printf("\nCOST MENU\nWould you like to:\n1. Change the cost of an item in the produce inventory\n2. Change the cost of an item in the deli inventory\n3. Change the cost of an item in the bakery inventory\n4. Change the cost of an item in the frozen foods inventory\n5. Return to main menu\n");
        int test =scanf("%d",&input);
        while(getchar()!='\n');
        if (test!=1){
            printf("Invalid option please try again.\n");}
        else{
            switch(input){
                case 1:
                    editCost(Produce, &produceCount);
                    return;
                case 2:
                    editCost(Deli, &deliCount);
                    return;
                case 3:
                    editCost(Bakery, &bakeryCount);
                    return;
                case 4:
                    editCost(frozenFoods, &frozenFoodsCount);
                    return;
                case 5:
                    printf("Returning to main menu.\n");
                    return;
                default: 
                    printf("Invalid option please try again.\n");
                    break;
            }
        }
    }
}

void editQuantity(struct item *itemList, int *counter){
    int selection, quantity;
    if (*counter==0){
        printf("There are no items in this category.\n");
        return;}

    for (int i = 0; i < *counter; i++) {
        printf("%d. %s\n", i+1, itemList[i].name);}
        
    printf("Select your item: ");
    while(1){
        int test =scanf("%d",&selection);
        printf("%d", test);
        printf("\n");
        selection=selection-1;
        while(getchar()!='\n');
        if (test!=1 || selection >= *counter){ 
            printf("Invalid option please try again.\n");}
        else{
            while(1){
                printf("Current quantity for %s is %d\n", itemList[selection].name, itemList[selection].quantity);
                printf("Set the new quantity to: ");
                int test =scanf(" %d",&quantity);
                while(getchar()!='\n');
                if (test!=1){
                    printf("Invalid option please try again.\n");}
                else{
                    itemList[selection].quantity=quantity;
                    break;
                }
            }
            break;
        }
    }
}

void editQuantityMenu(void){
    int input;
    while (1){
        printf("\nQUANTITY MENU\nWould you like to:\n1. Change the quantity of an item in the produce inventory\n2. Change the quantity of an item in the deli inventory\n3. Change the quantity of an item in the bakery inventory\n4. Change the quantity of an item in the frozen foods inventory\n5. Return to main menu\n");
        int test =scanf("%d",&input);
        while(getchar()!='\n');
        if (test!=1){
            printf("Invalid option please try again.\n");}
        else{
            switch(input){
                case 1:
                    editQuantity(Produce, &produceCount);
                    return;
                case 2:
                    editQuantity(Deli, &deliCount);
                    return;
                case 3:
                    editQuantity(Bakery, &bakeryCount);
                    return;
                case 4:
                    editQuantity(frozenFoods, &frozenFoodsCount);
                    return;
                case 5:
                    printf("Returning to main menu.\n");
                    return;
                default: 
                    printf("Invalid option please try again.\n");
                    break;
            }
        }
    }
}

void printToFile(void){
    FILE *filePTR;
    filePTR = fopen("InventoryFile.txt", "w+");

    for (int i = 0; i < produceCount; i++) {
        if (i==0){ fprintf(filePTR, "\n\n\t\t#######\t\tPRODUCE\t\t#######\n\n");}
        fprintf(filePTR, "Name : %-20sQuantity : %-20dCost : %-20.2f\n", Produce[i].name, Produce[i].quantity, Produce[i].cost);
    }

    for (int i = 0; i < deliCount; i++) {
        if (i==0){ fprintf(filePTR, "\n\n\t\t#######\t\tDELI\t\t#######\n\n");}
        fprintf(filePTR, "Name : %-20sQuantity : %-20dCost : %-20.2f\n", Deli[i].name, Deli[i].quantity, Deli[i].cost);
    }
    
    for (int i = 0; i < bakeryCount; i++) {
        if (i==0){ fprintf(filePTR, "\n\n\t\t#######\t\tBAKERY\t\t#######\n\n");}
        fprintf(filePTR, "Name : %-20sQuantity : %-20dCost : %-20.2f\n", Bakery[i].name, Bakery[i].quantity, Bakery[i].cost);
    }

    for (int i = 0; i < frozenFoodsCount; i++) {
        if (i==0){ fprintf(filePTR, "\n\n\t\t#######\t\tFROZEN FOODS\t\t#######\n\n");}
        fprintf(filePTR, "Name : %-20sQuantity : %-20dCost : %-20.2f\n", frozenFoods[i].name, frozenFoods[i].quantity, frozenFoods[i].cost);
    }
    printf("File printed\n");
}

int main(void)
{   int input;
    while (1){
        printf("\nMAIN MENU\nWould you like to:\n1. Add an item to inventory\n2. Change the quantity of an item\n3. Change the cost of an item in inventory\n4. Ouput inventory to file\n5. Exit program\n");
        int test =scanf("%d",&input);
        while(getchar()!='\n');
        if (test!=1){
            printf("Invalid option please try again.\n");}
        else{
            switch(input){
                case 1:
                    addItemMenu();
                    break;
                case 2:
                    editQuantityMenu();
                    break;
                case 3:
                    editCostMenu();
                    break;
                case 4:
                    printToFile();
                    break;
                case 5:
                    printf("Exiting program.\n");
                    exit(0);
                default: 
                    printf("Invalid option please try again.\n");
                    break;
            }
        }
    }
}
