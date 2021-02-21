mylist = [False, True, False]
print("mylist = " + str(mylist))
x = any(mylist)
print(x)
print("")

mytuple = (0, 1, False)
print("mytuple = " + str(mytuple))
x = any(mytuple)
print(x)
print("")

myset = {0, 1, 0}
print("myset = " + str(myset))
x = any(myset)
print(x)
print("")

mydict = {0 : "Apple", 1 : "Orange"}
print("mydict = " + str(mydict))
x = any(mydict)
print(x)
print("")
