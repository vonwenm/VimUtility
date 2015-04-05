#include <stdio.h>
#include <ctype.h>
#include <string.h>
#include "calc.h"

#define MAXWORD 100

struct key {
    char* word;
    int count;
};
typedef struct key key;

key keytab[] = {
    {"auto", 0},
    {"break", 0},
    {"case", 0},
    {"char", 0},
    {"const", 0},
    {"continue", 0},
    {"default", 0},
};

#define NKEYS (sizeof(keytab) / sizeof(key))

int getword(char*, int);
int binserach(char*, key*, int);

int main(int argc, char const* argv[])
{
    int n;
    char word[MAXWORD];

    while (getword(word, MAXWORD) != EOF) {
        if (isalpha(word[0])) {
            if ((n = binserach(word, keytab, NKEYS)) >= 0) {
                keytab[n].count++;
            }
        }
    }
    for (n = 0; n < NKEYS; n++) {
        if (keytab[n].count > 0) {
            printf("%4d %s\n", keytab[n].count, keytab[n].word);
        }
    }

    return 0;
}

int binserach(char* word, key tab[], int n)
{
    int cond;
    int low;
    int high;
    int mid;

    low = 0;
    high = n - 1;

    while (low <= high) {
        mid = (low + high) / 2;
        cond = strcmp(word, tab[mid].word);
        if (cond < 0) {
            high = mid - 1;
        }
        else if (cond > 0) {
            low = mid + 1;
        }
        else {
            return mid;
        }
    }
    return -1;
}

int getword(char* word, int lim)
{
    int c;
    char* w = word;

    while (isspace(c = getch()))
        ;

    if (c == '/') {
        if ((c = getch()) && c == '*') {
            while (1) {
                while ((c = getch()) != EOF && c != '*')
                    ;
                if (c != EOF) {
                    c = getch();
                    if (c == '/') {
                        c = getch();
                        break;
                    }
                }
                else {
                    ungetch(c);
                }
            }
        }
        else {
            ungetch(c);
            c = '/';
        }
    }
    if (c == '/') {
        if ((c = getch()) && c == '/') {
            while ((c = getch()) != EOF && c != '\n')
                ;
            if (c != EOF) {
                c = getch();
            }
        }
    }
    if (c == '\"') {
        while ((c = getch()) != EOF && c != '\"')
            ;
        if (c != EOF) {
            c = getch();
        }
    }
    if (c != EOF) {
        *w++ = c;
    }
    if (! isalpha(c) && c != '_') {
        *w = '\0';
        return c;
    }
    for (; --lim > 0; w++) {
        if (! isalnum(*w = getch()) && *w != '_') {
            ungetch(*w);
            break;
        }
    }
    *w = '\0';
    return word[0];
}
