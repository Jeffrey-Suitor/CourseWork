# Lecture 26

## Multi Predictive Control

x(t) = past

m = current

H = horizon

We are looking to compute the optimal for $u_m ... u_m+H$

## MDC Implementation

If you an look into the future and see something better you can always go there even if it increases the cost to get there.

$VFH^+$ means you have precomputed maps to tell you what to do when driving (lunar rover)

## Optimize MDC

$x_{m+1} = A x_m + B u_m$

$J = \sum_{m=0}^{N-1} x_m^T Q x_m + u_m^T R u_m + x_N^T Q_F x_N$

$x_0, \begin{bmatrix} x_1 & x_2 & ... & x_N \\ u_0, & u_1, & ... & u_{N-1}  \end{bmatrix}$ 2N

$x_1 = A x_0 + B u_0$

$x_2 = A^2 x_0 + AB u_0 + B u_1$

$x_3 = A^3 x_0 + A^2B u_0 + AB u_1 + B u_2$

$u = \begin{bmatrix} u_0 \\ u_1 \\ ... \\u_{N-1} \end{bmatrix}$

$x = \begin{bmatrix} x_0 \\ x_1 \\ ... \\x_{N-1} \end{bmatrix}$

$\bar{Q} = \begin{bmatrix} Q & & \\ & ... & \\ & & Q_F \end{bmatrix}$

$\bar{R} = \begin{bmatrix} R & & \\ & ... & \\ & & R_F \end{bmatrix}$

$x_0^T Q x_0 + \bar{x}^T \bar{Q} \bar{x} + \bar{u}^T + \bar{R} + \bar{u}$

$$
\bar{x} = 
\begin{bmatrix} A \\ A^2 \\ ... \\ A^N \end{bmatrix} x_0 + 
\begin{bmatrix} B & & \\ AB & B & \\ A^2B & AB & B \\ ... & ... & ... \end{bmatrix} u
$$

T = A matrix, S = AB matrix

$(T x_0 + S \bar{u})^T Q (T x_0 + S \bar{u}) + \bar{u}^T \bar{R} \bar{u} + x_0^T Q_F x_0$

$\bar{u}^T S^T Q S \bar{u} + 2 \bar{u}^T S^T \bar{Q} T x_0 + x_0^T T^T \bar{Q}^T T x_0 + \bar{u}^T \bar{R} \bar{u} + x_0^T Q_F x_0$

$\frac{dJ}{du} = 2 (\bar{R} + S^T \bar{Q} S) u + 2 S^T \bar{Q} T x_0 = 0$

$\frac{dJ}{du} = H \bar{u} + F x_0$

$H \bar{u} = -F x_0$

$u = - (H^T H)^{-1} H^T F x_0$

You always assume convex quadratic so minimum is first derivative. Convex is quadratic with constraints.

$V(x) = x^T Q x$ subject to $F_k \leq 0$

This has been shown to be very robust

Use a piecewise function

$u(k) = \begin{matrix} u_k & \tau_i < \tau i+1 \\ 0 \end{matrix}$

Hybrid system is a mix of continuous and discrete time

$y' = u \begin{matrix} -1 \\ 0 \\ 1 \end{matrix}$
