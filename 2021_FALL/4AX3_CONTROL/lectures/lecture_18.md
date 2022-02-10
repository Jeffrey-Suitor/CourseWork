# Lecture 18

## Particle Filter

Markov Model (Chains) \
$x_0$ -> $x_1$ -> $x_2$ -> $x_3$ \
$y_1$ -> $y_2$ -> $y_3$ \

$P (x_k | x_{k-1}))$ Dynamics $f(x_k | x_{k-1})$ \
$P (y_k | x_k))$ Output $g(y_k | x_k)$ \
\
We want: \
$P(x_k | y_1 ... y_k)$ this one has the current state, so $y_k$ \
$P(x_k | y_1 ... y_{k-1})$ this one is a prediction, so $y_{k-1}$ \

## Facts "Markov Property"

$P(x_k | x_{k-1}, x_{k-2}, x_0 = P(x_k | x_{k-1})$ only depends on previous states \
$P(y_K | x_k ... x_0) = P(y_k | x_k)$ means the covariance is 0, and current position is only based on current state \
$P(x_k | y_1 ... y_k) = \frac{P(x_k \cap y_1 ... y_k)}{P(y_1, ..., y_k)}$ $\cap$ can be replaced with a ,\

### Dynamic
$P(x_k | y_1 ... y_k) = P(x_{k-1}, y_1 ... y_{k-1}) * f(x_k | x_{k-1}) * g(y_k | x_k)$ \
$P(x_k | y_1 ... y_k) = P(x_{k-1}, y_1 ... y_{k-1}) * \frac{f(x_k | x_{k-1}) * g(y_k | x_k)}{P(y_k | y_1 ... y_{k-1})}$ \
We normailze the above equation given the observation. \

### Monte Carlo Simulation

$E(x) = \int x P(x) dx \approx \frac{1}{N} \sum x_k$ \
$x_k$ are pulled from P(x) \
$E(f(x)) = \int f(x) P(x) dx$ \

### Trick

$E(f(x)) = \int f(x) p(x) \frac{\pi(x)}{\pi(x)} dx$ \
$E(f(x)) = \int f(x) \frac{p(x)}{\pi(x)} \pi(x) dx$ This allows you to pick a new distribution (typically Gaussian to make your life easy) \

### Motion

Sequential Important Resampling \
$f(x)$
$E(f(x)) = \int f(x) p(x) dx$ \
$E(f(x)) = \int f(x) \frac{p(x)}{\pi(x)} \pi(x) dx$ \
$E(f(x)) \approx \sum f(x_k) w_k dx$ $\sum w_k = 1$ $\pi(x)$ drops out because you are pulling samples for Monte Carlo \

Update: \
$\int f(x) \frac{p(x|y)}{\pi(x)} \pi(x) dx$ \
$\int f(x) \frac{p(x|y) p(x)}{p(y) \pi(x)} \pi(x) dx$ \

## Particles

$(x^k, w^k)$ $k = 1 ... N$ \

