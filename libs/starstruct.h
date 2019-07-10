#ifndef __STARSTRUCT_H__
#define __STARSTRUCT_H__

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "startstruct_generics.h"

/* starStruct */
#define EXPAND_STAR(_, ...) \
  _(x, int, __VA_ARGS__) \
  _(y, int, __VA_ARGS__) \
  _(z, int, __VA_ARGS__) \
  _(radius, double, __VA_ARGS__) \
  _(character, char, __VA_ARGS__)

typedef struct {
  EXPAND_STAR(STRUCT_MEMBER, )
} starStruct;

void serialize_star(const starStruct *const star, unsigned char *buffer) {
  EXPAND_STAR(SERIALIZE_MEMBER, star, buffer)
}

void deserialize_star(starStruct *const star, const unsigned char *buffer) {
  EXPAND_STAR(DESERIALIZE_MEMBER, star, buffer)
}

void print_star(const starStruct *const star) {
  EXPAND_STAR(PRINT_MEMBER, star)
}

#endif //__STARSTRUCT_H__