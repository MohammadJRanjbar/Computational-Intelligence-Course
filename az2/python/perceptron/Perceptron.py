import numpy as np
import math


def HardLim(I):
    if(I>0):
        return 1;
    else :
        return 0 ;

def forward(x, F):
    a=np.dot(np.transpose(F), x)
    U = HardLim(a)
    return U

x = np.array([[1, 1, 1, 1],
              [0, 0, 1, 1],
              [0, 1, 0, 1]])
y = np.array([0, 0, 0, 1])
W = np.random.rand(3,1)
e=1
num = 4
while num>0 :
 num = 0
 for k in range(4):
  Out=forward(x[:,k],W)
  e=y[k]-Out
  if e!=0:
      num+=1
  W=W+e*x[:,k:k+1]


print(W)
for i in range(4):
    print(forward(x[:,i:i+1], W))