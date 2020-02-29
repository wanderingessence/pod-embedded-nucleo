
NUCLEO_VERSION 	:= L432KC
TARGET         	:= NUCLEO_$(NUCLEO_VERSION)
NUCLEO_PATH    	:= /run/media/$(USERNAME)/NODE_$(NUCLEO_VERSION)
COMPILER       	:= GCC_ARM
BUILD_DST		:= pod-src/BUILD
BIN				:= pod-src.bin

.PHONY: all build flash open

all: build flash

flash: 
	@echo "-----------------"
	@echo "Copying to board"
	@echo "-----------------"
	cp $(BUILD_DST)/$(BIN) $(NUCLEO_PATH)

open:
	screen /dev/ttyACM0

build:
	mbed compile -v -t $(COMPILER) -m $(TARGET) --source pod-src/ --source mbed-os/ --build $(BUILD_DST)

