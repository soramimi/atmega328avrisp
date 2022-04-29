
#AVRISP = /dev/ttyACM0
AVRISP = /dev/ttyUSB0

NAME = main

CC = avr-gcc
CXX = avr-g++
AS = avr-as
CFLAGS = -Os -mmcu=atmega328p
CXXFLAGS = -Os -mmcu=atmega328p

all: $(NAME).hex

main.o: main.cpp
	$(CXX) -c $(CFLAGS) $^

waitloop.o: waitloop.c
	$(CC) -c $(CFLAGS) $^

$(NAME).elf: main.o waitloop.o
	$(CC) $(CFLAGS) $^ -o $@

$(NAME).hex: $(NAME).elf
	avr-objcopy -O ihex $< $@

clean:
	-rm *.o
	-rm *.elf
	-rm *.hex

write:
	avrdude -c avrisp -P $(AVRISP) -b 19200 -p m328p -U hfuse:w:0xdf:m  -U lfuse:w:0xef:m -U flash:w:main.hex

fetch:
	avrdude -c avrisp -P $(AVRISP) -b 19200 -p m328p

fetch2:
	avrdude -c avrisp -P /dev/ttyACM0 -b 19200 -p m328p
