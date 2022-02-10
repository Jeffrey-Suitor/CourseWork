# Lecture 23

## Control, Optimal, Predictive

System\
$x' = f(x, u)$

$y = h(x)$

$x_{m+1} = A x_m + B u_m$

$y_m = C x_m$

- Stability
- Control of finite position and final time
- Optimality -> Cost
- Constraints
- Predictive, Horizons

## Stability

BIBO stability\
y'' + y' + y  = u\
Inward spiral and we want to end up center\
Asymptotically stable\
lim y(t) -> 0 as t-> infinity\

L(x) is a monotonic function (gets better every step) [Liapunov]\
Your solutions must always be below L(x) $||x(t)|| \leq L(x)$\
lim L(t) -> 0 as t-> infinity\

## Quadratic Forms
$V(x) = X^TPX$ = general scalar product -> always positive\
$X^T(PX) = (PX)^TX$

$X^T P^T X$

$P = P^T$

Symetric positive definition $P \geq 0$

## General Cost Problem

$\dot{x} = f(x, u)$\
$y = h(x)$\
$J = \int_0^T g(x,u) dt$\
\
$x_{m+1} = A x_m + B u_m$\
$y_m = C X_m$\
$J = \sum_{m=0}^{N-1} x_m^T Q x_m + u_m^T R u_m + x_n^T Q_F n_n$\

Find $u_m$ to minimize J subject to $x_{m+1} = A x_m + B u_m$\

Control to 0\
Control to a set point

``` mermaid
graph TD
    s-->E
    E-->Plant
    Plant-->Output
    Plant-->Controller
    Controller-->E
```
E = k(s-x)

``` mermaid
graph TD
    Adder-->Gs
    Gs-->Controller
    Gs-->Output
    Controller-->Adder
```

$G = \frac{G(s)}{1 - k G(s)}$
$G(0) = 0$
$k(r-x)$

Cannot control in steady state because G(s) goes to 0 so K have no effect

$\frac{1}{s}$ needed to cancel out the 0

PID control needs the I to learn the proper state to hold the controller when the system goes to 0

$x_{m+1} = AX$

$\widetilde{u}_{m+1} = u_m + u$
