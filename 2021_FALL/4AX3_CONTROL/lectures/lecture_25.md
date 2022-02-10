# Lecture 25

## Linear Quadratic Regulator

$x_{m+1} = x_m + u_m$ is an integrator

$J = \sum q x_m^2 + r u_m^2 + q-T x_N^2$

$V^m(s)$ cost m steps to go at state s

$V^m(x) =  MIN \text{ u } (cost(x, u) + V^{m-1} f(x,u))$

$x_{m+1} = A x_m + B u_m$

$J = \sum_{m=0}^{N-1} x_m^T Q x_m + u_m^T R u_m + x_N^T Q_T x_N$

$V^m(x) = x^T P_m x$ 

$V^0(x) = x^T Q_T x$ 

$P^0 = Q_T$

$V^m(x) = x^T Q x + u^T R u + V^{m-1} (Ax + Bu)$

Minimize u

$V^m(x) = x^T Q x + u^T R u + (Ax + Bu)^T P_m (Ax + Bu)$


$V^m(x) = x^T Q x + u^T R u + x^T A^T P_m A x + x^T A^T P_m B u + u^T B^T P_m A x + u^T B^T P_m B u$


$V^m(x) = x^T Q x + u^T R u + x^T A^T P_m A x + 2 u^T B^T P_m A x + u^T B^T P_m B u$

$\frac{d}{du} = 2 R u + 2 B^T P A x + 2 B^T P B u = 0$

$u = \frac{- B^T P A}{B^T P B + R} X = kX$

$u = - (R + B^T P_m B)^{-1} B^T P A$ --> have to be careful of singular

$x^T P_{m+1} x = x^T Q x + u^T R u + (Ax + Bu)^T P_m (Ax + Bu)$

$x^T P_{m+1} x = x^T Q x + x^T k^t R k x + (Ax + Bu)^T P_m (Ax + Bu)$

$u = -k x$

$(A x - B k x)^T P_m (A x - B k x)$

$x^T (A -B k)^T P_m (A - B k ) x$

$P_{m+1} = Q + k^T R k + (A - B k)^T P_m (A - B k)$

---

How to use it

Start with k0 and p0 at the end and work backward storing the state. 

Star at a value, multiply by the ks and ps to solve

## Linear Quadratic Regulator + Kalman (Linear Guassian Regulator)

Moon lander problem

y'' = -g + u

$\begin{bmatrix} y \\ y' \\ g \end{bmatrix}$

x(T) = 0 ----- x'(T) = 0

y' = -g + u is a plant hidden to the controller
y = output = height

``` mermaid
graph TD

*-->A[y' = -g + u]
A-->y
A-->B[-]
B-->k
B-->c
c-->u[u_0]
k-->u
*-->u
u-->x[x tilde]
x-->r[-k]
r-->*
c-->z[y tilde]
```

-k is stored
