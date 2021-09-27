import numpy as np
def sigmoid(x):
     return 1 / (1 + np.exp(-x))
def sigmoid_derivative(x):
     return x * (1 - x)
X = np.array([[0, 0], [0, 1], [1, 0], [1, 1]])
Y = np.array([[0], [1], [1], [0]])
epochs = 10000
lr = 0.1
W1 = np.random.uniform(size=(2, 2))
B1 = np.random.uniform(size=(1, 2))
W2 = np.random.uniform(size=(2, 1))
B2 = np.random.uniform(size=(1, 1))
for _ in range(epochs):
     A1 = np.dot(X, W1)
     A1 += B1
     Net1 = sigmoid(A1)
     output_layer_activation = np.dot(Net1, W2)
     output_layer_activation += B2
     OutP = sigmoid(output_layer_activation)
     error = Y - OutP
     d_OutP = error * sigmoid_derivative(OutP)
     error_hidden_layer = d_OutP.dot(W2.T)
     d_hidden_layer = error_hidden_layer * sigmoid_derivative(Net1)
     W2 += Net1.T.dot(d_OutP) * lr
     B2 += np.sum(d_OutP, axis=0, keepdims=True) * lr
     W1 += X.T.dot(d_hidden_layer) * lr
     B1 += np.sum(d_hidden_layer, axis=0, keepdims=True) * lr
print(*OutP)


