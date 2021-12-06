# Lecture 5

## Euclidean Space

* $\Re ^ m$ \
* m equations \
* m < n, x + y = 1 = Space / undeterminant \
* m = n there is one solution \
* m > n there are more parameters than solutions \

## Model Fitting

* Model -> Functional
* $F_{\theta}(x), (x^k, y^k)$ \
* $\theta, x = parameters$ \
* $\frac{Arg Min}{\theta} \sum_{k=1}^N || F_{\theta}(x^k)-y^k || ^2$ \
* $F_{\theta}(x) = \sum_{m=0}^N \theta_m \phi_m (x)$ \
* $\phi_m(x) = x^m$ \
* $\phi_m(x) = e^{-iwm}$ \
* Basis \
    * $\lambda_1 \phi_m(x) = \lambda_2\phi_k(x)$\
    * $\lambda_1 = lambda_2 = 0$ \
    * $m = k$ \
    * $\phi_0 = \begin{matrix} 1 \\ 0 \end{matrix}$ \
    * $\phi_1 = \begin{matrix} 0 \\ 1 \end{matrix}$ \
    * $\begin{matrix} 2 \\ 3 \end{matrix} = 2 \phi_0 + 3 \phi_1$ \
* $F_{\theta}(x^k) = y^k$ \
* $\theta_0 \phi_0 (x^1) + \theta_1 \phi_1 (x^1) + \theta_2 \phi_2 (x^1) = y^1$ \
* $$\begin{matrix} \phi_0 (x^1) & phi_1 (x^1) & ... & \phi_m(x^1) \\
\phi_0 (x^2) & phi_1 (x^2) & ... & \phi_m(x^2) \\
\phi_0 (x^N) & phi_1 (x^N) & ... & \phi_m(x^N) \end{matrix} * 
\begin{matrix} \theta_0 \\ \theta_1 \\ theta_m \end{matrix} * 
\begin{matrix} y^1 \\ y^2 \\ y^k \end{matrix}$$ \
* $||A \theta 0 y || 2$ \
* k = horizontal, n = vertical \
* N >> K, significantly larger \

## Linear Algebra

* $||x||^2 = X^T X$ \
* Norm      Scalar Product
* $|| x ||^2 = \sum x_i^2$ \
* $\sum x_i^2 = variance$ \
* $\frac{Arg Min}{\theta} || A \theta - y || ^2$ \
* $(A \theta - y)^t (A \theta - y)$ \
* $\theta^T A^T A \theta - \theta^T A^T y - y^T A \theta + y^T y$ \
    * $(AB)^T = B^TA^T$ \
    * $X^T Y = Y^T X$ \
    * $Y^t A \theta = A^T \theta^T y$ \
    * $\theta6T A^T A \theta - 2 \theta^T A^T y + y^T y$ \
    * $\frac{d}{d\theta} 2A^T A \theta - 2 A^T y = 0$ \
    * $A^T A \theta = A^T y$ = normal equations \
    * $A \theta = y$ \

## Example

* $F(x) = ax + b$ \
* $(x^k, y^k)$ \
    * $ax^1 + b = y^1$ \
    * $ax^2 + b = y^2$ \
$$\begin{matrix} 1 & x^1 \\
1 & x^2 \\
1 & x^N \end{matrix} *
\begin{matrix} b \\ a \end{matrix} *
\begin{matrix} y^1 \\ y^2 \\ y^N \end{matrix}$$ \

* $A^T A = \begin{matrix} N & \sum x^k \\ \sum x^k & \sum {x^k}^2 \end{matrix}$ \
* $(\begin{matrix} a & b \\ c & d\end{matrix})^{-1} = \frac{1}{det(A)} * (\begin{matrix} d & -b \\ -c & a\end{matrix})$ \
* $N \sum (x^k)^2 - (\sum x_k)^2$ \
* $a = \frac{N(\sum x^k y^k) - (\sum x^k)(\sum y^k)}{N\sum (x^k)^2 - \sum(x_k)^2}$ \

## Example 2
* $f(x) = ax + b$ \
* (1, 2) (1, 3) (2, 5) \
* $\begin{matrix} 1 & 0 \\ 1 & 1 \\ 1 & 2 \end{matrix} * \begin{matrix} b \\ a \end{matrix} = \begin{matrix} 1 \\ 3 \\ 5 \end{matrix}$ \
* $\begin{matrix} 1 & 1 & 1 \\ 0 & 1 & 2 \end{matrix} * \begin{matrix} 1 & 0 \\ 1 & 1 \\ 1 & 2 \end{matrix} = A^T A$ \
* $\begin{matrix} 1 & 1 & 1 \\ 0 & 1 & 2 \end{matrix} * \begin{matrix} 1 \\ 3 \\ 5 \end{matrix} = A^T y$ \






