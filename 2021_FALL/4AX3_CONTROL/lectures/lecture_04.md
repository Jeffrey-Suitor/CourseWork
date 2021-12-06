# Lecture 4

## Linear Algebra

* Vector space \
* $V over \Re (C|)$ \
* $x,y \Xi V$ \
* $\lambda x' \Xi V$ \
* $\lambda_1 x + lambda_2 y \Xi V$ \
* $\lambda_1 lambda_2 \Xi \Re$ \
* $X \Xi V \exists y x+y = 0$ \

## Apples and Oranges Example

* $A, B \Xi V$ \
* A = apples, B = oranges \
* $\lambda_1 A = \lambda_2 B$ \
* $\lambda_1 = \lambda_2 = 0$ \
* This allows you to solve by super position because of the linear independence
* $X \Xi V$ \
* $\lambda_1(A) + \lambda_2(B) = x = 3A + B$ \
* $\lambda_1(A + B) + \lambda_2(B) = x = 3A - 2B$ \
* $\lambda_1(A + B) + \lambda_2(2A + 2B)$ = x = Not possible \
* $3A + 2B = \begin{matrix} 3 // 2 \end{matrix}$ \
* $\begin{matrix} 1 & 0 \\ 0 & 1 \end{matrix} * \begin{matrix} \lambda_1 \\ lambda_2 \end{matrix} = x$ \
* $\lambda_1 \begin{matrix} 1 \\ 1 \end{matrix} + \lambda_2 \begin{matrix} 0 \\ 1 \end{matrix} = x$ \
* $\begin{matrix} 1 & 0\\ 1 & 1 \end{matrix} * \begin{matrix} \lambda_1 \\ \lambda_2 \end{matrix} = (\begin{matrix} 3 \\ 1 \end{matrix})$ \

## Finite Dimension Solution

* $\Re ^ M = Finite$ \
* $e^{i m w_o}$ \
* $X(m) = \sum_{-\inf}^{\inf} \delta(m-k)*x(k)$ \
* Vector space
    * metric "measure" \
    * inner product \
    * topology \
    * completeness\

## Metric

* Distance \
* $d(x, y) >= 0$ \
* $d(x, x) = 0$ \
* $d(x, x) <= d(y, z) + d(z, y)$ \
* Norms \
    * $||X||_2 = sqrt(\sum_{k=1}^N X_k^2)$ \
    * $d(x, y) = || x - y ||_2$ \
    * $||x||_p = (\sum X_k^p)^{\frac{1}{P}}$ \
    * $||x||^2_2 = \sum x_k^2$ \

## Scalar Product

* Inner product \
* $<x, y> = \sum x_i y_i$ \
* $<x, y> = |x| |y| cos \alpha$ \

## Linear Functions

* $V = f(x)$ \
* $V -> \Re$ \
* $Given f(x) V -> \Re$ \
* $Linear f(\lambda_1 x + lambda_2 y)$ \
* $= \lambda_1 f(x) + \lambda_2 f(y)$ \
* $Exists c \Xi \Re ^ N$ \
* $f(x,y) = C^T x$ \
* $f(x,y) = 2x + 3y$ \
* $C = \begin{matrix} 2 \\ 3 \end{matrix}$ \
* Dual allows you to compare contorllers \
    * $\Re ^ N -> \Re$ \

## Linear Transforms

* $X_{m+1} = A X_m = B u_m$ \
* $X_m -> 0$ \
* $\frac{||AX||}{||X|||}$ \
* $|| X^* - x_m|| = ||AX^* - AX ||$ \
* $X^* = fixed point$ \ 
