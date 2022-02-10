# Lecture 28

## Artificial Neural Networks (ANN)

Back propagation = training method used for neural networks

## Supervised Learning

- Classify
- Regression

$(x^k, y^k)$

$L = \frac{1}{2} \sum (cl(x^k) - y^k)^2$

``` mermaid
graph TD
A((x1))-->z((z = sum wi*xi + b))
B((x2))-->z
C((x3))-->z
D((x4))-->z
z-->f((a=f_z))
```

$R^N$ --> $R$

a = output

$-k x_n^k \leq 1$

$f(x) = \frac{1}{1 + e^{-z}}$ is the sigmoid function

$L = \frac{1}{2} \sum( f (w^T x^k + b) - y^k)^2$

ARGMIN L with respect to $w_k, b$

$$
\frac{dL}{d\theta} = 
(f(w^T x^k + b) - y^k) * 
f'(w^T x^k + b) * 
\begin{matrix}
    \theta = w_k & x_k \\
    \theta = b & 1
\end{matrix}
$$

Error * Z (Gain, how sensitive it is to changes on weights and x)

$w_m <-- w_m + \delta \frac{dL}{dw_k}$

$[x^k, y^k]$

We do this in batches (0 --> N) or epochs.

## Why batches

Control was a smooth concave shape, but in supervised learning there are lots of local minima which could trap our response. 

---

$$
\begin{matrix}
a_k^0=x_k & O & O & O & x_n \\
O & O & O & O & O \\
O & O & O & O & O \\
O & O & O & O & O \\
O & O & O & O & O \\
a_1^L & O & O & O & O \\
\end{matrix}
$$

L + 1 layers
last layer is y
middle layers are called hidden layers

$a_i^l = f(\sum_k w_{ik}^l a_k^{l-i} + b_i)$ value of 1 neuron at layer l at position i

$a_i^0 = x_i$ = top

$y_i = a_i^L$ = output

$J = \frac{1}{2} \sum (a_i^L - y_i)^2$

$\frac{dJ}{d\theta} = (a_i^L - y_i) \frac{d a_i^L}{d\theta}$

$a_i^L = f(w^T)$

$\frac{d a_i^L}{d\theta} = f'(z_i^L) * \frac{\sum w_{ik}^l a_k^{l-i} + b_i^l}{d\theta}$

$$
\theta = 
\begin{matrix} 
    w_{ik}^l & a_k^{l-1} \\ 
    b_i^l & 1 \\ 
    w^{l-1} & \frac{d a_k^{l-1}}{du} 
\end{matrix}
$$

$\delta_i^L = (y_i - a_i^l)f'(z_i^l)$

$\delta_i^l = f'(z_i^l) \sum w_{ik}^l \delta_k^{l-1}$
