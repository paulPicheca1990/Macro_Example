# *__Makefile__*
CC 			:= gcc
CFLAGS 	:= -Wall -g -std=c99
INCLUDE := -I ./libs
LIBS    := -l m

SRC_DIR := src
OBJ_DIR := obj
BIN_DIR := bin
LIB_DIR := libs

TARGET := macro_example.exe

MAIN_SRC 	:= $(wildcard *.c)
MAIN_OBJ 	:= $(patsubst %,$(OBJ_DIR)/%,$(MAIN_SRC:.c=.o))
MAIN_DEPS := $(MAIN_OBJ:.o=.d)

SRCS := $(wildcard */*.c) 
OBJS := $(patsubst $(SRC_DIR)/%,$(OBJ_DIR)/%,$(SRCS:.c=.o)) 
HDRS := $(patsubst $(SRC_DIR)/%,$(LIB_DIR)/%,$(SRCS:.c=.h))
DEPS := $(OBJS:.o=.d)

-include $(DEPS) $(MAIN_DEPS)

# -MM -MF $(patsubst %.o,%.d,$@)

all: dirinit $(TARGET)

$(TARGET): $(OBJS) $(MAIN_OBJ) 
	@echo "Linking Objects..."
	$(CC) -o $(BIN_DIR)/$@ $^ $(LIBS)	

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	@echo "Compiling Objects..."
	$(CC) $(CFLAGS) $(INCLUDE) -MM -MF $(patsubst %.o,%.d,$@) -c $<
	$(CC) $(CFLAGS) $(INCLUDE) -o $@ -c $< 	
	@echo ""

$(OBJ_DIR)/%.o: %.c	
	@echo "Compiling Objects..."
	$(CC) $(CFLAGS) $(INCLUDE) -MM -MF $(patsubst %.o,%.d,$@) -c $<
	$(CC) $(CFLAGS) $(INCLUDE) -o $@ -c $<
	@echo ""

%.o: %.c
	@echo "Compiling Objects..."
	$(CC) $(CFLAGS) $(INCLUDE) -MM -MF $(patsubst %.o,%.d,$@) -c $<
	$(CC) $(CFLAGS) $(INCLUDE) -o $(OBJ_DIR)/$@ -c $<
	@echo ""

.PHONY: clean dir_init main

clean:
	@echo "Removing old files..."
	@rm -rf $(OBJ_DIR) $(BIN_DIR) *.o *.exe
	@echo ""

dirinit:
	@echo "Creating Directories..."
	@mkdir -p $(OBJ_DIR) | true
	@mkdir -p $(BIN_DIR)  | true 
	@echo ""