# Lecture 24

## Optimal Control

Observable, Controllable\

System: $x_{m+1} = f(x_m, u_m)$

$J = \sum_{m=0}^N Cost(x_m, u_m)$

Finite Horizon x(0) = $x_0$ x(N)

---

Minimize J subject to $u_0 ... u_{N-1}$ system

---

1D for today

$x_{m+1} = a x_m + b u_m$

c = identity 

$J_N = \sum_{m=0}^{N-1} q x_m^2 + r u_m^2 + q_T x_N^2$

weight of control + weight of state + terminal cost

r = reward

## Bellman Equation

$V^*(s) = MAX \text{ a } \sum P_{s s'}^a ( R_{s s'}^a + \gamma V(s'))$

Greedy policy

$V_m = MIN \text{ } u_m \text{ } (cost(x_m, u_m) + V_{m-1}f(x_m, u_m))$

$V_N$ is the cost go N steps

---

$V_m = P_m x_m^2$ --------- $(x_m^T P_m x_m)$ in matrices

$V_0 = q_T x_T^2$ you can assume it is a quadratic function

$V_m = MIN \text{ } u_m \text{ } (cost(x_m, u_m) + V_{m-1}f(x_m, u_m))$

$V_m = P_m x_m^2$ and $f(x_m, u_m) = a x_m + b u_m$

$V_m = MIN \text{ } u_m \text{ } (q x_m^2 + r u_m^2 + P_{m-1}(a x_{m-1} + b u_{m-1}))$

Not using the indices
$\frac{d V_m}{d u_m} = 2 r u + 2 P (a x + b u_m * b)$

$u = \frac{a b P_{m-1}}{r + b^2 P_{m-1}} X = kX$

$= -a \frac{b P_{m-1}}{b^2 P_{m-1} + r}$ 

These problems are dual, solve one and you solve the other. If you observe you control error to 0 and when you control you control the plant to 0. b = control matrix, c = output matrix. 

$V_m(s) = P_m x^2$ ------- $u = -kX$

$=q x^2 + r k^2 x^2 + P_{m-1}(a x - b k x)^2$

$=q x^2 + r k^2 x^2 + P_{m-1}(a - b k)^2 x^2$

## Ricatti Equation
$P_m =q + r k^2 + P_{m-1}(a - b k)^2$

$P_0 = q_T$

$u = -kX$

$x_{m+1} = A x_m + B u_m$

$J_N = \sum_{m=0}^{N-1} x_m^T Q x_m + u_m^T R u_m + x_N^T + Q_T x_N$

$x_N$ = control

Observe = x(0) from N observations of the system

Observe -->

Control <--

Optimal control is done by working backward from your end point
