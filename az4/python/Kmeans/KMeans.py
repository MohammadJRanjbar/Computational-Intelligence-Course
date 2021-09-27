import numpy as np
import matplotlib.pyplot as plt
import cv2
def Distance_Calculator(Data,Centers):
    Distance=20
    temp=20
    Mask=np.zeros_like(Data)
    for i in range (Data.shape[0]):


        for j in range(Centers.shape[0]):
            E=np.abs(Data[i]-Centers[j])
            if(Distance>E):
                Distance=E
                temp=j

        Mask[i]=temp
        Distance=20
    return Mask
def UpdateCenters(Centers, Mask , Data):
    for j in range (Centers.shape[0]):
        temp1=0
        sum=0
        for i in range ( Data.shape[0]):
            if Mask[i]==j:
                temp1=temp1+1
                sum=sum+Data[i]

        Centers[j]=sum/temp1

    return Centers

def KMeans (Data,k):

    Data = np.sort(Data)
    Centers=np.random.rand(k)*20
    Centers = np.sort(Centers)
    for i in range (200):
        Mask=Distance_Calculator(Data,Centers)
        Centers=UpdateCenters(Centers,Mask,Data)
    return Mask,Centers

Image = cv2.imread('Lena_gray.png', 0)
Image = np.reshape(Image, (1, -1))
Image = np.transpose(Image)
k=input()
Mask, centers = KMeans(Image,k)
for i in range(len(Image)):
  Image[i] = centers[int(Mask[i])]
Image = np.transpose(Image)
Image = np.reshape(Image, (256, 256))
cv2.imwrite("NewLena.png", Image)
cv2.imshow(Image)
# Data=np.array([0, 2, 5, 11, 12, 17, 19])
# Centers=KMeans(Data,3)
# print(Centers)
# plt.figure()
# plt.plot(Data,np.zeros_like(Data),'bo')
# plt.plot(Centers,np.zeros_like(Centers),'ro')
# plt.show()
