#include <stdio.h>

int main(void)
{
    char string[100]; int count=0;
    printf("Enter your string.\n");
    scanf("%s", string);
    char * strptr=string;
    while(*(++strptr));
    printf("The reverse string is: ");
    while(*(--strptr)){
        printf("%c", *strptr);}
    printf("\n");
    return 0;
}
