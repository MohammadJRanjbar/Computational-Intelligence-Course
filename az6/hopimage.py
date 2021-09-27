"""
Created on Tue Nov 12 17:06:21 2019

@author: Mohammad
"""
import numpy as np
import cv2 
import matplotlib.pyplot as plt
def showImage(v):
  im = np.reshape(v, (10, 10))
  plt.figure()
  plt.imshow(im)
  plt.show()
def sgn(number):
    res = np.sign(number)
    for i in range (res.shape[0]):
        if (res[i,0]==0):
            res[i,0]=-1
    return res 
IB=cv2.resize(cv2.imread('b.png',0), (10, 10))
_, IB = cv2.threshold(IB, 90, 255, 0)
IB = IB / 255
IB = IB.astype(float)
IB=sgn(IB)
IP=cv2.resize(cv2.imread('p.png',0), (10, 10))
_, IP = cv2.threshold(IP, 90, 255, 0)
IP = IP / 255
IP = IP.astype(float)
IP=sgn(IP)
IG=cv2.resize(cv2.imread('g.png',0), (10, 10))
_, IG = cv2.threshold(IG, 90, 255, 0)
IG = IG / 255
IG = IG.astype(float)
IG=sgn(IG)
ID=cv2.resize(cv2.imread('d.png',0), (10, 10))
_, ID = cv2.threshold(ID, 90, 255, 0)
ID = ID / 255
ID = ID.astype(float)
ID=sgn(ID)
IK=cv2.resize(cv2.imread('k.png',0), (10, 10))
_, IK = cv2.threshold(IK, 90, 255, 0)
IK = IK / 255
IK = IK.astype(float)
IK=sgn(IK)


def noisify(im , percentage):
  image = im.copy()

  number=int(percentage*image.shape[0])
  for i in range (number):
    randnumber = np.random.randint(0,image.shape[0])
    image[randnumber,0]=-image[randnumber,0]
  return image


images = [np.reshape(IB, (-1, 1)),np.reshape(IP, (-1, 1)),np.reshape(IG, (-1, 1)),np.reshape(ID, (-1, 1)),np.reshape(IK, (-1, 1)) ]
images = np.concatenate(images, axis = 1)
showImage(images[:,0:1])

p1=noisify(images[:, 3:4],0.01)
       

def asynchornise (v1,v2):
    p = v1.copy()
    for  i in  range(v1.shape[0]):
        if(v1[i,0]!=v2[i,0]):
            p[i,0]=v2[i,0]
            return p
    return p
        
m=p1.shape[1]
W=np.dot(p1,np.transpose(p1))-m*np.eye(p1.shape[0])
v1=p1
i=1
while(True):
    v2=sgn(np.dot(W,v1))
    v2=asynchornise(v1,v2)
    if(np.allclose(v2,v1)):
            break
    i=i+1
    if(i==300):
      break
    v1 = v2
showImage(p1)