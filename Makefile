HELLTRACER_32_NAME=helltracer32
HELLTRACER_64_NAME=helltracer64

HELLTRACER_SRC=./src
HELLTRACER_INC=./headers
HELLTRACER_OUT=./bin

CC=g++
COMPILE_FLAGS=-std=c++17
COMPILE_32_FLAGS=-m32
COMPILE_64_FLAGS=-m64

HellTracer:	clean compile

compile:
	@mkdir -p $(HELLTRACER_OUT)
	@echo "Compiling 32bit version..."
	@$(CC) $(COMPILE_FLAGS) $(COMPILE_32_FLAGS) $(HELLTRACER_SRC)/*.cpp -I$(HELLTRACER_INC) -o$(HELLTRACER_OUT)/$(HELLTRACER_32_NAME)
	@echo "Compiling 64bit version..."
	@$(CC) $(COMPILE_FLAGS) $(COMPILE_64_FLAGS) $(HELLTRACER_SRC)/*.cpp -I$(HELLTRACER_INC) -o$(HELLTRACER_OUT)/$(HELLTRACER_64_NAME)
			  
clean:
	@echo "Cleaning output directory..."
	@rm -rf $(HELLTRACER_OUT)
	
.PHONY: doc
doc:
ifeq (, $(shell which doxygen))
	@echo "\"doxygen\" could not be found... Please install doxygen package."
else
ifeq (, $(shell which dot))
	@echo "\"dot\" could not be found... Please install graphviz package."
else
	@echo "Generating documentation..."
	@doxygen Doxyfile
endif
endif
