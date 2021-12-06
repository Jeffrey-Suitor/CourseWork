# Lecture 9

## Stochastic Process

* $E(x) = \int x P_X(x) dx$ \
* $E(x) linear$ \
* $E(\lambda_1 + lambda_2 y)$ \
* $= \lambda_1 E(x) + \lambda_2 E(y)$ \
* E(c) = c \

## Variance

* $VAR(x) = E((E(x) - x)^2)$ \
* $= E(x^2) - E(x)^2$ \
* $VAR(x) >= 0, VAR(c) = 0$ bi-linear quadractic \
* $VAR(ax) = a^2 VAR(x)$ \
* $CO-VAR(x,y) = E((E(x) - x) * (E(y) - y))$ \
* $VAR(x+y) = VAR(X) + VAR(Y) + 2 CO-VAR(x, y)$ \

## 2 Dimension Example

* $(\begin{matrix} X \\ Y \end{matrix}) * (\begin{matrix} X & Y \end{matrix})^T$ \
* $=(\begin{matrix} X^2 & YX \\ YX & Y^2 \end{matrix})$ \
* $=(\begin{matrix} VAR(X) & CO-VAR(X, Y) \\ CO-VAR(X, Y) & VAR(Y) \end{matrix})$ = covariance matrix \
* $$\begin{matrix} x \\ y \\ z \end{matrix} *
\begin{matrix} x & y & z \end{matrix} = 
(\begin{matrix} \sigma_x^2 & \sigma_{xy} & \sigma_{xz} \\
\sigma_{xy} & \sigma_y^2 & \sigma_{yz} \\
\sigma_{xz} & \sigma_{yz} & \sigma_z^2 \end{matrix})$$ \
* The above matrix is symmetric \

## Noise

* $White noise \frac{1}{\epsilon(t)}$ \
* All frequencies have same probability \
* Gaussian noise shaped like gauss \
* Pink noise $\frac{12 DB}{octave}$ \

## Stochastic (Model Fitting)

* Model Y = aX + b \

### Equations

* $Y_k = ax_k + b + \epsilon_k$ \
* $\epsilon_k = N(0, \sigma_x^2)$ \
* $VAR = \sigma_x^2$ \
* $$CO-VAR(\epsilon_k, \epsilon_l) = 
\begin{matrix} 0 & k != l \\
\sigma_x^2 & k=l \end{matrix}$$ \

### Monte Carlo

* $\frac{1}{N} \sum_{k=1}^N y_k$ \
* $=\frac{1}{N} \sum_{k=1}^N a X_k + \epsilon_k$ \
* $=\frac{1}{N} \sum_{k=1}^N a X_k + \frac{1}{N} \sum_{k=1}^N \epsilon_k$ \

## Ensemble Averaging

* By adding together all the noise, due to the noise being guassian the noise is equal to 0. So that gives you a meaningful measurement.

## Maximum Likelihood (Estimator)

* $Y_k = a X_k + b$ -> Guass \
* $P(Y_k - a X_k b)$ -> Want to maximize the probability \
* $L = \prod_{k=1}^N P(y_k - a x_k - b)$ \
* $\frac{Max L}{a,b} = \prod P(y_k - a x_k - b)$ \
* $Y_k - a X_k - b = \epsilon_k$ \
* $\epsilon_k = N(0, \sigma_x^2)$ \
* $\prod e^{\frac{\frac{-1}{2}(y_k - a x_k - b)^2}{\sigma_x^2}}$ \
* Maximize L \
* First pull log \
* Max(f) = Max(log(f)) \
* $e^{\sum_{k=1}^N \frac{\frac{-1}{2}(y_k - a x_k - b)^2}{\sigma_x^2}}$ \
* Pull Log
* $\frac{-1}{2 sigma_x^2} \sum (y_k - a x_k - b)^2$ -> same as before \

## Stochastic System

* $x_{m+1} = f(x_m) = \epsilon_k$ \
* $y_{m} = h(x_m) + u_k$ \


