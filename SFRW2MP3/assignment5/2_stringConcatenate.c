#include <stdio.h>
 
int main()
{
    char str1[100], str2[100];
 
    printf("Enter 1st string: ");
    scanf("%s", str1);
    printf("Enter 2nd string: ");
    scanf("%s", str2);

    char * s1ptr = str1;
    char * s2ptr = str2;
    
    while(*(++s1ptr));
    
    while(*(s1ptr++) = *(s2ptr++));
 
    printf("Concatenated string: %s\n", str1);
 
    return 0;
}
