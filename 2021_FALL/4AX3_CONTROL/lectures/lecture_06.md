# Lecture 6

## Model fitting

* $(x^k, y^k) Given$ \
* k = 1 ... N \
* $\frac{Arg min}{\theta} \sum_{k=1}{N} || F_{\theta}(x^k) - y^k||^2$ \
* $F_{\theta}(x) = \sum_{k=0}^M \theta_k ]phi_k(x)$ \
* Linear is a combination of basis elements \
* $A_{\theta} = y$ \
* $$A = \begin{matrix} \theta_0(x^1)d_1(x^1) & ... & \theta_m(x^1) \\ 
... & ... & ... \\
\theta_0(x^N) & ... & \theta_m(x^N) \end{matrix}$$ \
* $A^T A \theta = A^T Y$ \
* Numerically use a QR factorization \

## Plant Model

* $ x_m -> Plant -> y_m$ \
* not online \
* not a filter \
* infinite memory filter \
* Example Question: 
    * $(x^k, y^k)$ -> F(x) = ax$ \
    * $J_a(x) = \sum_{k=1}{N} (ax^k - y^k) ^2$ \
    * $=a^2 {x^k}^2 -  2a x^k y^k + {y^k}^2$ \
    * $\frac{d}{da} - 2a{x^k}^2 - 2x^ky^k = 0$ \
    * $a{x^k}^2 = x^ky^k$ \
    * $a = \frac{\sum x^k y^k}{\sum {x^k}^2}$ \

## Trajectory Example

* $f(x) = ax^2 + bx + c$ \
* $\frac{d}{dx} = 2ax + b$ \
* $x = \frac{b}{2a}$ MAX \ 
* $$ \begin{matrix} 
1 & x^1 & {x^1}^2 \\
1 & x^2 & {x^2}^2 \\
1 & x^3 & {x^3}^2 \\
\end{matrix} * \begin{matrix} c \\ b \\ a \end{matrix}$$ \

## AI

* $(x^k, y^k)
* With model \
    * $\frac{Arg Min}{\theta} \sum || F_{\theta}(x^k) - y^k || ^2$ \
    * Iterate and update your $\theta$ \
* Gradient search \
    * $\theta_{m+1} = \theta_m + u \frac{dJ}{d\theta}$ \
    * $J = \sum \frac{1}{2}(F_{\theta}(x) - y)^2$ \
    * $F_{\theta}(x) = ax + b$ <- Line \
    * $\frac{dJ}{da} = (ax + b - y)^2 * x$ \
    * $\frac{dJ}{db} = (ax + b - y)^2 * 1$ \

