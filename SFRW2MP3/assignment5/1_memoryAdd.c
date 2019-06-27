#include <stdio.h>

int main(void)
{
    int num; char character; float floatNum;
    int *numpt; char *charpt; float *floatpt;
    printf("Enter your int , char, float in that order.\n");
    scanf("%d %c %f", &num, &character, &floatNum);
    numpt=&num;
    charpt=&character;
    floatpt=&floatNum;
    printf("Interger\n");
    printf("Address: %p\n", numpt );
    printf("Value: %d\n", *numpt );
    printf("Size: %lu\n\n", sizeof(*numpt) );
    
    printf("Character\n");
    printf("Address: %p\n", charpt);
    printf("Value: %c\n", *charpt );
    printf("Size: %lu\n\n", sizeof(*charpt) );
    
    printf("Float\n");
    printf("Address: %p\n", floatpt );
    printf("Value: %f\n", *floatpt );
    printf("Size: %lu\n\n", sizeof(*floatpt) );
    return 0;
}
