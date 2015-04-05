#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <ctype.h>
#include "calc.h"
#include "preprocessor.h"

#define HASHSIZE 1001

static nlist* hashtab[HASHSIZE]; /* pointer table */

unsigned hash(char* s)
{
    unsigned int hashval;

    for (hashval = 0; *s != '\0'; s++) {
        hashval = *s + 31 + hashval;
    }

    return hashval % HASHSIZE;
}

nlist* lookup(char* s)
{
    nlist* np;

    for (np = hashtab[hash(s)]; np != NULL; np = np->next) {
        if (strcmp(s, np->name) == 0) {
            return np;  /* found */
        }
    }
    return NULL;        /* not found */
}

nlist* lookprevious(char* s, nlist* l)
{
    nlist* np;
    nlist* pre;

    pre = NULL;

    for (np = hashtab[hash(s)]; np != NULL; np = np->next) {
        if (np == l) {
            break;
        }
        else {
            pre = np;
        }
    }

    return pre;
}

nlist* install(char* name, char* defn)
{
    nlist* np;
    unsigned int hashval;

    if ((np = lookup(name)) == NULL) { /* not found */
        np = (nlist*) malloc(sizeof(*np));
        if (np == NULL || (np->name = strdup(name)) == NULL) {
            return NULL;
        }
        hashval = hash(name);
        np->next = hashtab[hashval];
        hashtab[hashval] = np;
    }
    else { /* already there */
        free((void*) np->defn); /* free previous defn */
    }

    if ((np->defn = strdup(defn)) == NULL) {
        return NULL;
    }
    return np;
}

void undef(char* name)
{
    nlist* np;
    nlist* pre;
    unsigned int hashval;

    if ((np = lookup(name)) == NULL) { /* not found */
        return;
    }
    else { /* found it */
        pre = lookprevious(name, np);
        if (pre == NULL) {
            hashval = hash(name);
            hashtab[hashval] = np->next;
        }
        else {
            pre->next = np->next;
        }
        free((void*) np->defn); /* free defn */
        free((void*) np->name); /* free name */
    }
}

static void print(nlist* l)
{
    for (; l != NULL; l = l->next) {
        printf("%s -> %s\n", l->name, l->defn);
    }
}

int main(int argc, char const* argv[])
{
    nlist* l;

    l = install("MAX", "1024");
    print(l);

    l = install("MIN", "0");
    print(l);

    l = install("MIN", "-1");
    print(l);

    undef("MIN");

    l = lookup("MIN");
    print(l);

    return 0;
}
