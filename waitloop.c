
#include "waitloop.h"

void waitloop(unsigned int n)
{
	do {
		asm("nop");
		asm("nop");
		asm("nop");
		asm("nop");
	} while (--n);
}

void usleep(int n)
{
	waitloop(n * 2);
}

void msleep(int n)
{
	for (int i = 0; i < n; i++) {
		waitloop(2000);
	}
}

