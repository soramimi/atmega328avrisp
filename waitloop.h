
#ifndef __WAITLOOP_H
#define __WAITLOOP_H

#ifdef __cplusplus
extern "C" {
#endif

void waitloop(unsigned int n);

void usleep(int n);
void msleep(int n);

#ifdef __cplusplus
}
#endif

#endif
