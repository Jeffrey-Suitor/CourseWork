# Lecture 10

## Stochastic Systems

* Markov Chains
~~~mermaid
graph TD
    X0-->X1
    X1-->X2
    X2-->XM
    X1-->Y1
    X2-->Y2
    XM-->YM
~~~
* $x_{m+1} = f(x_m)$ -> deterministic\
* $x_{m+1} = f(x_m) + \epsilon_m$ \
* $P(x_{m+1} | x_m)$ \
* $E(x_{m+1} = \int x P(x_{m+1}) x_m dx)$ \
* $P(y_m | x_m)$ \

## State Space Control

* $x' = f(x,u)$ \
* $y = h(x)$ \
* These equations are constraints on the system

### Performance Measurement

* $J = \int_0^{\inf} g(x, x', u) dt$ = cost function \

### Particle Example

* f(x) \
* g(x) = 0 \
* $L = g(x,u) + \lambda f(x-u) - x'$ \
* $\frac{dL}{dx}$ \
* $\frac{dL}{d \lambda}$ \
* $x_{m+1} = A x_m + B u_m + \epsilon_m$ \
* $y_m = C x_m$ \
* $J = \sum_{m=0}^{T-1} (x_m^T Q x_m + u_m^T R u_m) + x_T^T Q_T x_T$ \
* Infinite horizon -> for stability, T = inf \
* Finite -> positioning \
* $x^T y = scalar product = x^T Q y$ \
* $x^Tx = || x ||$ \

## Optimal Control

### Controlability

* $x_{m+1} = (\begin{matrix} 1 & 0 \\ 0 & 1 \end{matrix}) x_m + (\begin{matrix} 1 \\ 1 \end{matrix}) u_m$ \
* $y(u) = (1, 1) x_m$ \
* Pick some x such that, go from 0 to any x \
* (2, 2) works but (2, 3) doesn't because the system only works on the diagonal \
* $x_{m+1} = A x_m + B_m$ \
    * $x_0 = (\begin{matrix} 0 \\ 0 \end{matrix})$ \
    * $x_1 = B u(0)$ \
    * $x_2 = A B u(0) + B u(1)$ \
    * $B, AB, A^2B, ...$ \
    * If the matrix is full rank it is controllable \

### Observable

* Reconstruct x(0) from observing $x_1, x_2, x_3, ... x_m$ \
* $x_{m+1} = (\begin{matrix} 1 & 0 \\ 1 & 0 \end{matrix}) x + (\begin{matrix} 1 \\ 1 \end{matrix}) u$ \
* y(u) = (0, 1) x \
* This system is not observable because you can't view all states \

