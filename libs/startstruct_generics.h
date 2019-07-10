#ifndef __STARSTRUCT_GENERICS_H__
#define __STARSTRUCT_GENERICS_H__

/* Generic */
#define STRUCT_MEMBER(member, type, dummy) type member;

#define SERIALIZE_MEMBER(member, type, obj, buffer) \
  memcpy(buffer, &(obj->member), sizeof(obj->member)); \
  buffer += sizeof(obj->member);

#define DESERIALIZE_MEMBER(member, type, obj, buffer) \
  memcpy(&(obj->member), buffer, sizeof(obj->member)); \
  buffer += sizeof(obj->member);

#define FORMAT_(type) FORMAT_##type
#define FORMAT_int    "%d"
#define FORMAT_double "%f"
#define FORMAT_float  "%2f"
#define FORMAT_char   "%c"
#define FORMAT_string "%s"

/* FORMAT_(type) will be replaced with FORMAT_int or FORMAT_double */
#define PRINT_MEMBER(member, type, obj) \
  printf("%s: " FORMAT_(type) "\n", #member, obj->member);

#endif //__STARSTRUCT_GENERICS_H__