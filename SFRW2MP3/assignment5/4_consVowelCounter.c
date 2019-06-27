#include <stdio.h>

int main(void)
{
    char string[100]; int letters[2]={0}; char vowels[]={'a','e','i','o','u','y'};
    printf("Input your string.\n");
    scanf("%s", string);
    int *consonantptr=&letters[0];
    int *vowelptr=&letters[1];
    char *strptr=string;

    while(*(strptr++)){
        int startValue=*vowelptr;
        for (int i = 0; i < 6; i++) {
            if (*strptr==vowels[i]) {
                *vowelptr=*vowelptr+1;
                break;}
        }
        if (startValue==*vowelptr){
            *consonantptr=*consonantptr+1;}
    }
    printf("The string has %d consonants and %d vowels.\n", *consonantptr, *vowelptr);
    return 0;
}
