EXPERIMENT 1
#include <stdio.h>
#include <ctype.h>

int main() {
    int k = 0, i = 0;
    char a[25];
    char b[25]; // Declare b with sufficient size
    printf("Enter expression: ");
    fgets(a, 25, stdin);
    
    while(a[i] != '\0') {
        if (isalpha(a[i])) {
            printf("%c - identifier\n", a[i]);
        } else if (a[i] == '+' || a[i] == '-' || a[i] == '*' || a[i] == '/') {
            printf("%c - arithmetic operator\n", a[i]);
        } else if (a[i] == '=') {
            printf("%c - assignment operator\n", a[i]);
        } else if (isdigit(a[i])) {
            k = 0; // Reset k for new digit sequence
            while (isdigit(a[i]) && a[i] != '\0') {
                b[k++] = a[i];
                i++;
            }
            b[k] = '\0'; // Null-terminate the digit string
            printf("%s - digit\n", b);
            i--; // Adjust i because it will be incremented in the next loop iteration
        }
        i++;
    }
    
    return 0;
}
