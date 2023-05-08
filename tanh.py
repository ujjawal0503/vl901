import numpy as np
import math
# initialization
M = -4
N = 4
epsilon = 0.1

x=[0]
x =x+ np.arange(M, N+.015625, 0.015625)
NUM = len(x)
j=0
i=1
F=1
v =0
END = NUM-1 #here could change

def f(x):
    return math.tanh(x)

# print(math.log2(1+x[j]))
# print(x[j])

while j !=NUM-1:
    while F==1:
       
        a=(f(x[END])-f(x[j]))/(x[END]-x[j])
        b=(f(x[j])-a*x[j])
        delta=[]
        for p in range(j,END):
            delta.append(f(x[p])-(a*x[p]+b))
        MAE = (np.max(delta) - np.min(delta)) / 2
        if MAE < 0.001 :
            b = b + (np.max(delta) + np.min(delta)) / 2
            print(a, b,i,x[END])
            F=0
            v=v+1
            with open('xendtanh.txt' , 'a') as file:
                file.write(str(x[END]))
                file.write('\n')
                file.close()
            with open('atan.txt' , 'a') as file:
                file.write(str(a))
                file.write('\n')
                file.close()
            with open('btan.txt' , 'a') as file:
                file.write(str(b))
                file.write('\n')
                file.close()
        else:
            END = END-1
       
    i=i+1
    j=END
    END = NUM -1
    F=1



    
