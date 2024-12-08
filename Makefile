# Set the compiler and flags
CC = g++
CFLAGS = -Wall -g

# Define the source directory and the build directory
SRCDIR = src
BUILDDIR = build

# Find all source files and generate corresponding object files
SRC = $(wildcard $(SRCDIR)/*.cpp)
OBJ = $(SRC:$(SRCDIR)/%.c=$(BUILDDIR)/%.o)

# Define the output executable name
TARGET = my_program

# Default target to build the program
all: $(TARGET)

# Rule to link the object files and create the executable
$(TARGET): $(OBJ)
	$(CC) $(OBJ) -o $@

# Rule to build the object files from source files
$(BUILDDIR)/%.o: $(SRCDIR)/%.c
	@mkdir -p $(BUILDDIR)
	$(CC) $(CFLAGS) -c $< -o $@

# Clean up build files
clean:
	rm -rf $(BUILDDIR) $(TARGET)

# Phony targets (do not create actual files)
.PHONY: all clean

