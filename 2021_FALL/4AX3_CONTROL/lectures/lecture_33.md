# Lecture 33

## Linear Least Squares (LLS)

$(x^k, y^k)$ --> some data

This is a regression problem

$\phi_{\theta}(x^k) = y^k$

### Least Square

$ARGMIN \text { } \theta \text{ } \sum_{k=1}^K ||y_{\theta}(x^k)-y^k||^2$

### Linear

$\phi_{\theta}(x) = \sum_{m=0}^N \theta_m \phi_m(x)$

$\phi_m(x)$ = basis functions --> orthogonal family (1, x, $x^2$ ...)

### How to solve the problem

#### Matrix

$$
\begin{bmatrix}
\phi_0(x^1) & ... & \phi_N(x^1)\\
... & ... & ... \\
\phi_0(x^k) & ... & \phi_N(x^k)
\end{bmatrix} 
\
\begin{bmatrix} \theta_0 \\ ... \\ \theta_N \end{bmatrix} = 
\
\begin{bmatrix} y^1 \\ ... \\ y^k \end{bmatrix}
$$

$\phi_k = x^k$ --> 1, x, $x^2$ ...

$A \phi = y$

* If matrix is square you can solve
* More variables (rows) than equations (columns), no unique solution

$A^T A \theta = A^T y$

$\theta = (A^T A)^{-1} A^T y$

Perfect mathematically but not numerically. QR is used on the computer

##### Model Fitting Example

Don't just pick the maximum value. Fit points to a model. For one unique point just use $ax^2 + bx + c$

#### Gradient Descent

$ARGMIN \text { } \theta \text{ } \sum_{k=1}^K ||y_{\theta}(x^k)-y^k||^2$

$f(w^T x + b) = \phi$

$\frac{dL}{d\theta} = 2 \sum || \theta_{\phi}(x) - y'|| * \phi'_{\theta}(x)$

$\theta_{m+1} = \theta_m + \gamma \frac{dL}{d\theta}$

Steepest Descent
* $\frac{dL}{d\theta}$ = gradient
* $\gamma$ = learning rate

#### Maximum Likelihood

LLS

$P(y|x)$

Want to estimate the probability distribution and not the function.

$(x^k, y^k)$

$MAX \pi_{k=1}^K P(y^k | x^k)$

$P(y | x) = N(\mu, \sigma^2)$

* N = normal or gauss
* u = expected value
* $\sigma$ = variance
* $\sigma^2$ = standard deviation

$\frac{1}{ \sqrt{2\pi} \sigma } e^{ \frac{-(y - \mu)^2 }{\sigma^2} }$

## Statistics

A = is a set
u = universe

$P(A) = \frac{|A|}{|u|}$

### Random Variable

#### Discrete

u = [a, b, c, d] --> equadistant

You pull samples from u --> $\bar{x}$

$P_{\bar{x}}(x)  = \frac{1}{4}$

u = [a, a, b]

$P_{\bar{x}}(x=a)  = \frac{2}{3}$
$P_{\bar{x}}(x=b)  = \frac{1}{3}$

#### Continous

$\bar{x} \varepsilon R$

Cannot do x==0, have to do $abs(x) < \epsilon$

$P_{\bar{x}}(\alpha \leq x \leq \beta)  =\int_{\alpha}^{\beta} x P_{\bar{x}}(x) dx$

P = PDF

$\int_{-\inf}^{\inf} P_{\bar{x}}(x) dx = 1$

$\int x P(x) dx = E(x)$ --> 1st momentum

$E(x) = 0$

$\int x^2 P(x) dx = VAR(x)$ --> 2nd momentum

$E((x - E(x))^2)$

CO-VAR(x,y)

$E( (x - E(x)) (y- E(y)) )

$\bar{x} \varepsilon R^m$

$x = \begin{bmatrix} x_1 \\ x_2 \\ ... \\ x_N \end{bmatrix}$

##### From previous midterm

$P_{\bar{x}}(x) = P_{x_1}(x) * P_{x_3}(x) * P_{x_3}(x)$

$$
\begin{bmatrix}
    x_1 \\ x_2 \\ ... \\ x_N
\end{bmatrix}
\begin{bmatrix}
    \sigma_{1,1}^2 & \sigma_{1,2}^2 & ... & \sigma_{1,N}^2\\
    ... &... & ... & ... \\
    \sigma_{N,1}^2 & \sigma_{N,2}^2 & ... & \sigma_{N,N}^2\\
\end{bmatrix}
$$

$\sigma_{i,j} = COVAR(x_i, x_j)$
