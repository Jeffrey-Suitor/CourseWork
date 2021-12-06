# Lecture 15

## Bayesian Reasoning

## Linear Least Sqaures

## State Space Control Principles

* Controllable \
* Observable \
* Luneberg observer \

## Regression

## Expected Value, Variance

* Matrix version \
* Scalar version \

## Fusion (optimal linear mix) + Scalar Kalman

## How to Practice

### Bayesian Reasoning Example

* P(A | B) -> B has happened \
* $P(A | B) = \frac{P (A \cap B)}{P(B)}$ \
* $P(A | B) = \frac{P (B | A)P(A)}{P(B)}$ \
* Partitioning is when you split into sections \
    * $\cup B_k = u$ \
    * $B_k \cap b_l$ = Disjoint \
    * $P(k) = \sum P(A | B_k) P(K_k)$ \

### Linear Least Squares Example

* $(x^k, y^k)$ \
* Linear Model F(x) = $\sum \alpha_k J_k(x)$ \
* $\frac{Minimize}{\alpha_1 \alpha_n} \sum_{k=1}^M || F(x^k) - y^k ||$ \

* Given $(x^k, y^k)$, k=1 ... N \
* Model is f(x) = aX \
* $\begin{bmatrix} x^1 \\ x^2 \\ x^N \end{bmatrix} * \begin{bmatrix} a \end{bmatrix} = \begin{bmatrix} y^1 \\ y^2 \\ y^N \end{bmatrix}$ \
* $A^TAx = A^T y$ \
* $\begin{bmatrix} x^1 & ... & x^n \end{bmatrix} * \begin{bmatrix} x^1 \\ ... \\ x^N \end{bmatrix} a = \begin{bmatrix} x^1 & ... & x^n \end{bmatrix} y$ \
* $\sum x_k^2 a = \sum x_k y_k$ \
* $a = \frac{\sum x_k^2}{\sum x_k y_k}$ \

### Probability Example

* Random Var X -> x  = scalar \
* Random Vector (X_1, X_2)  = matrix \
* E(x) -> Definition u(x) = $\frac{1}{N} \sum x^k$ \
* $VAR(x) = E((E(x) - x)^2)$ \
* $CO-VAR(x,y) = E((E(x) - x)(E(y)-y))$ \

#### Scalar Example
* x is a random variable, C is a constant \
* VAR(x + C) = VAR(x) \
* f(x) is a linear mapping \
* $\Re -> \Re$ \
* I know the variance of x. \
* What is the VAR(f(x)) \
* f(x) = ax \
* VAR(ax) = a^2 VAR(x) \


#### Vector Example

* $VAR(X) = E((E(x) - x)(E(x) - x)^T)$ \
* $(AB)^T = B^TA^T$ \
* $X^T y = y^TX$ \

### State Space Control Example

* Controllable, Observable \
* $x_{m+1} = A x_m + B u_m$ \
* $y_m = C x_m$ \
