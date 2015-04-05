#ifndef PREPROCESSOR_H
#define PREPROCESSOR_H


typedef struct nlist {  /* table entry: */
    struct nlist* next; /* next entry in chain */
    char* name;         /* defined name */
    char* defn;         /* replacement text */
} nlist;

nlist* install(char* name, char* defn);
void undef(char* name);

#define DEF_KEYWORD "define"

int getmagic(char* word, int lim);

#endif
