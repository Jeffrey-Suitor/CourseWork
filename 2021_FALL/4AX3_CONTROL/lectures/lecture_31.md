# Lecture 31

## Non Neural AI Classify

$(x^k, y^k)$ $y^k = +1 or -1$

k = 1 ... K

Data --> Features --> Decide (CNN)

## Support Vector Machines (SVM)

$w^T x^k +b$ = the variance

$(w^T x^k +b) y^k \geq 0$

Margin is the space between the two lines

Decision line, want the largest maximal margin 

## Maximal Margin Classifier

$W^T x^k + b) y^k = \gamma^k$

Maximize -> MIN $\gamma y^k$

$||w|| = 1$

$(w^T x^k + b) y^k = \gamma^k$

$(\frac{w^T}{||w||} x^k + b) y^k = \gamma^k$

Gamma = margin

$y^k(w^T x^k + b) \geq 1$

MIN $||w||^2$ w, k

Can be solved via a standard optimizer

## Soft Margin

$y^k(w^T x^k + b) \geq 1$

Instead we use

$y^k(w^T x^k + b) = 1 - \sigma_k$

$MIN ||w||^2 + \sum \sigma_k$

$\sigma_k \geq 0$

Allows for exceptions 

---

k = number of samples

n = dimension

N >>> k

We only care about the points on the line. Support vectors are the only thing that matter.

$w = \sum a_m y^m x^m$

Most $a_k$ are 0

$y^k(w^T x^k + b) = ...$

$y^k( \sum a_m y^m {x^m}^T x^k + b )$

Data --> Maximize the variance --> classify

## Principle Component Analysis

$\sum_{k=1}^K || x^k - V V^T x^k ||$
