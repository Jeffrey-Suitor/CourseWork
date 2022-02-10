#Lecture 19

## Sequential Importance Resampling (Sequential Monte Carlo)

$P(x_k | y_1 ... y_k)$

$E(f(x)) = \int f(x)p(x)dx$

$\approx \frac{1}{N} \sum w_k x_k$

P(x) is gauss: $\begin{bmatrix} \mu = expected value \\ \sigma^2 = variance \end{bmatrix}$

## Particles

Camel Shaped Graph

PDF = probability density function

$P = (x_k, w_k)$

$\sum w_k = 1$

$P(x) = \sum w_k \delta (x-x_k)$

$E(f) = f(x_k)$ 

## Example 2

Parabola

$w_k = \frac{1}{N}$

Because you're particles aren't distributed as they are supposed to be you have to resample

## Resample

$$
\begin{matrix}
w_1 = 0.1 \\
w_2 = 0.5 \\
w_3 = 0.1 \\
w_4 = 0.3
\end{matrix}
$$

CDF = cummulative density function

$CDF(x) = \sum w_k$ where $w_k < x$

[0.1 0.5 0.1 0.3]

1. Randomly select a number
2. Use the output to select a weight and clone it
3. Repeat many many times and you will have a PD equal to the original function

You would compute the CDF and then do your selection to place particles where you want\

Spinning may not be ideal if you lack samples or by chance the selection is skewed\

Chose the smallest one and then iterate through using the smallest one\

Markov chain with our states\

Want to compute $P(x_k | y_1 ... y_k)$\

$P(x_k | x_{k-1} ... x_0) = P(x_k | x_{k-1})$ -> f

$P(y_k | x_k ... x_0) = P(y_k | x_k)$ -> g

$P(x_K, y_1 ... y_k) = P(x_{k-1}, y_1 ... y_{k-1}) -> f(x_k |x_{k-1}) \text{ and } g(y_k)$

$P(x_k | y_1 ... y_k) = P(x_{k-1} | y_1 ... y_{k-1})$

Use the Bayesian\
$\frac{f(x_k | x_{k-1}) g(y_k | x_k)}{P(y_k | y_1 ... y_k)}$

You can ask the clone to solve for g(stuff)

$E(f(x)) = \int f(x) p(x) dx$

$= \int f(x) p(x) \frac{\pi(x)}{\pi(x)} dx$

$= \int f(x) \frac{p(x)}{\pi(x)} \pi(x)dx$ Rearranged so we can pull from pi(x) or any probability distribution

$(x_k, w_k)$

Initially all particles are evenly distributed -> $w_k = \frac{1}{N}$\

1. Compute Dynamics\
    x_k <- f(x_k)
2. Observe [y_k] <-\
    $w_k <- w_k * \pi(y_m - \widetilde{y_k})$\
    Where pi is a normal distributino $N(y_k - \widetilde{y_{k-1}}, \sigma)$\
    Rank each particle according to the weight and the likelihood of it's observation being true
    Use an exponential function for the assignin the weights\
3. Normalize
    $w_k <- \frac{w_k}{\sum w_k}$
4. Resample with noise (may normalize again)
5. Goto 1

