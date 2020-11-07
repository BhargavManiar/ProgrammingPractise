import numpy as np
import matplotlib.pylab as plt
from numpy import random


list_1 = [1,2,3,4,5]
np_array_1 = np.array(list_1, dtype=np.int8)# One axis array
print(np_array_1);


m_list_1 = [ [1,2,3], [4,5,6], [7,8,9]]
np_m_arr_1 = np.array(m_list_1)
print(np_m_arr_1)

print(np.arange(1,10))
print(np.linspace(0,5,5))
print(np.zeros(4))
print(np.zeros((2,3)))

print(np_m_arr_1.size)

np_arr_2 = np.array([1,2,3,4,5,6])
print(np_arr_2.dtype)


print(np.random.randint(10,50,5))
print(np.random.randint(10,50,(2,3)))

#print(np.random.randint) # Probably can do this in an ipy notebook 

print(np_m_arr_1.shape)
print(np_m_arr_1.item(0,2))

print(np.take(np_m_arr_1,[0,3,6]))
print(np.put(np_m_arr_1, [0,3,6],[10,10,10]))


np_m_arr_1[0,0] = 2
np_m_arr_1.itemset((0,1),1)
print(np_m_arr_1)


