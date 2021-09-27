import numpy as np
import math


def Sigmoid(SMInput):

    SMOutput = (2 / (1 + math.exp(-SMInput))) - 1

    return [SMOutput];

def Sigm(SInput):

    SOutput = (1-SInput[0]*SInput[0])/2

    return [SOutput];

def  Sigmatrix() :

 Output1=0
 Output2=0
 numrows = int(input("Enter the number of rows:"))
 numcols = int(input("Enter the number of columns:"))

 print("Enter the entries in a single line (separated by space): ")

 entries = list(map(int, input().split()))

 matrix = np.array(entries).reshape(numrows, numcols)

 #numrows = len(matrix)
 #numcols = len(matrix[0])

 for i in range(numrows):
   for j in range(numcols):

      OP=matrix[i][j]


      A = Sigmoid (OP)

      Output1 = A[0]+ Output1

      B = Sigm(A)

      Output2=B[0]+Output2

 return [Output1,Output2] ;




FinalAnswer=Sigmatrix()

# [[1,0,math.sin(math.pi/4)],[0,1,math.sin(math.pi/2)],[1,0,1]])

print(FinalAnswer)