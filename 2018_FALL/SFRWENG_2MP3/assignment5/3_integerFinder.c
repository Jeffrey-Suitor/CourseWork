#include <stdio.h>

int main(void)
{
    int value; int input[100]; int largestValue[2]={0,0}; int count=0; int i=0;
    printf("Input your intergers. When you are done enter x.\n");
    
    while (scanf("%d",&value)>0){
        input[i]=value;
        i++;}
    
    int * listptr=input;

    while(*(listptr++)){
        count++;
        if (largestValue[0] < *listptr){
            largestValue[0]=*listptr;
            largestValue[1]=count;}
    }
    printf("The largest integer is the %d which is the %d value entered.\n", largestValue[0],largestValue[1]+1);
    return 0;
}
