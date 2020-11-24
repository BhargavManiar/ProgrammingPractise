from multiprocessing import Process, Array
from ctypes import c_char_p

def show(a):
    print("This ran")

    # Decode the encoded values
    a.append(b"m")

if __name__ == "__main__":
    array = Array(c_char_p, 1)


    p = Process(target=show, args=(array,))
    p.start()
    p.join()

    print(array)