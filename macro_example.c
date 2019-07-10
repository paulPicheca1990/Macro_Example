#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "./libs/starstruct.h"

int main (int argc, char **argv) {  
  starStruct something = {1, 2.00L, 3L, 4, 'c'};
  print_star(&something);
}