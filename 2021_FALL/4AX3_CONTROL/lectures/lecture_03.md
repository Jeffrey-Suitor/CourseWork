# Lecture 2

## Control

Models: \
* $x'= f(x,u)$ \
* $y = h(x)$ \

Discrete time: \
* $y'' = -y + u'$ lander \
* pos = \
    * $x_1(m+1) = x_1(m) + \Delta t x_2(m)$ \
    * $x_2(m+1) = x_2(m) + \Delta t (-g+h)$ \
    * $h(x) = x_1$ \

## Linear systems

* $x_{m+1} = A x_m + B u_m$ \
* $y_{m+1} = C x_m$ \
* $x_{m+1} = \begin{matrix} 1 & \Delta t \\ 1 & 0 \end{matrix} * \begin{matrix}0 \\ \Delta t \end{matrix}$ \

## Learning (Supervised)

* $data(x^k, y^k)$ \
* $x^k$ are uncorrelated \
* $F_\theta(x) = y$ \
* $\theta$ = parameter to learn \
* Arg min $\theta$ $\sum_{k=1}^{N}||F_\theta(x^k) -y^k||$ = error \
* Convex shape, where you iterate to find the global minimum
* $x_u = x + \alpha A'(x)$ \

## Tracking Example
* $data(x^k, y^k)$ \
* Find a control input for a car to follow a path \
* $x'' = u''$ = $F = ma$
* $$\begin{matrix} x_1 \\ x_2 \\ y_1 \\ y_2 \end{matrix} * 
    \begin{matrix} 1 & 1 \\ g & 0 \\ - & - \\ - & -\end{matrix} * 
    \begin{matrix} 0 \\ 1 \\ - \\ -\end{matrix}$$ \
* $x_{m+1} = A x_m + B u_m$ \
* $y_m = C x_m$ \
* Arg min $\theta$ $\sum_{k=0}^{N}||yk - y^k||$ = error \
* u <- u - error

## Control Solution / Control Matrix

* $x_{m+1} = A x_m + B u_m$ \
* $y_m = C x_m$ \
* $x_0$ \
* $x_1 = A x_0 + B u_0$ \
* $x_2 = A^2 x_0 + AB u_0+ B u_1$ \
* $x_N = A^N x_0 + ... + B u_{N-1} \
* $$\begin{matrix} A x_0 \\A x_1 \\ A x_2 \\ ... \\ A^N x_C \end{matrix} +
    \begin{matrix} CB \\ CAB * CB \\ CA^2B CAB CB \\ ... \\ CA^{N+1}B ... \end{matrix} * 
    \begin{matrix} u_0 \\ u_1 \\ u_2 \\ ... \\ u_{N-1} \end{matrix} = 
    \begin{matrix} y^1 \\ y^2 \\ y^3 \\ ... \\ y^k \end{matrix}$$ \
