import numpy as np
import math

# a= int(input("enter number"))

def sig(a):
    return  1/(1+math.exp(-a))


def sig_dif(a):
    return  sig(a) * (1 - sig(a))

def sigMat():
    j = int(input("enter col no"))
    i = int(input("enter row number"))
    matrix = np.zeros((i, j))
    for ii in range(i):
        for jj in range(j):
            a = int(input("enter number"))
            matrix[ii,jj]=sig(a)
    print(matrix)

sigMat()


























'''
def tanh ( ):
    numrows = int(input("Enter the number of rows:"))
    numcols = int(input("Enter the number of columns:"))

    # print("Enter the entries in a single line (separated by space): ")

    entries = list(map(int, input().split()))

    matrix = np.array(entries).reshape(numrows, numcols)
    Output=0
    for i in range(numrows):
        for j in range(numcols):
            OP = matrix[i][j]

            A = (math.exp(OP)-math.exp(-OP))/(math.exp(OP)+math.exp(-OP))

            Output = A + Output

    return Output;


D=tanh()
print(D)
'''