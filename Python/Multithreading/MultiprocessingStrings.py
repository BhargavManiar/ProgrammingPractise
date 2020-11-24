import multiprocessing
from multiprocessing import *
from ctypes import c_char_p

def workerOne(string,lock):
	for i in range(10):
		lock.acquire()
		string.value = string.value + "m";
		lock.release()
		
def workerTwo(string,lock):
	for i in range(10):
		lock.acquire()
		string.value = string.value + "-";
		lock.release()

if __name__ == '__main__':
	manager = Manager()
	stdio = manager.Value(c_char_p,"")
	lock = multiprocessing.Lock()
	
	p1 = Process(target=workerOne, args=(stdio, lock))
	p2 = Process(target=workerTwo, args=(stdio, lock))
	
	p1.start()
	p2.start()
	
	p1.join()
	p2.join()
	
	print(stdio.value)