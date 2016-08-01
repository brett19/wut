#include "tconfig.h"
#include "../include/coreinit/baseheap.h"
#include "../include/coreinit/expandedheap.h"
#include "../include/coreinit/memory.h"

void * memcpy ( void * destination, const void * source, size_t num )
{
	return OSBlockMove(destination, source, num, 1);
}

void * memset ( void * ptr, int value, size_t num )
{
	return OSBlockSet(ptr, value, num);
}

void* malloc (size_t size)
{
	MEMHeapHandle mem2Heap = MEMGetBaseHeapHandle(MEM_BASE_HEAP_MEM2);
	return MEMAllocFromExpHeap(mem2Heap, size);
}

void free (void* ptr)
{
	MEMHeapHandle mem2Heap = MEMGetBaseHeapHandle(MEM_BASE_HEAP_MEM2);
	MEMFreeToExpHeap(mem2Heap, ptr);
}
