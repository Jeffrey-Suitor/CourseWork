# Lecture 8

## Random Variables

* $X = random variable$ \
* $X \Xi {1, 2, 3, 4, 5, 6}$ \
* $P(X=z) = \frac{1}{6}$ \
* P(X) = probability density distribution \
* $\sum_x P_x(X = x) = 1$ \
* $E(x) = \sum_x x P(X = x)$ \
* X pull samples \
* Pull N samples \
    * $u(x) = \frac{1}{N} \sum_{k=1}^N x_k$ \
    * Monte Carlo Simulation \

## Binning

* Pull Samples \
* By binning you simulate the probability density function \

## Continous Case

* $X \Xi \Re$ \
* $P(0.55 <= X <= 0.6)$ \
* $\int P(x) dx = 1$ \
* $\int x P(x) dx = E(x)$ \
* $E(E(x) - x)^2$ \
* $= E (E(x)^2 - 2xE(x) + x^2)$ \
* $E(x)^2 - 2xE(x)E(x) + E(x)^2)$ \
* $E(x^2) - E(x)^2$ \
* Var X, E(x) = 0, No DC \
* $Var(x) = E((E(x) -x)^2)$ \
* $= E(x^2)$ = 0 - mean \
* $Pull X_k$ \
* $Var(x) = \frac{1}{N} \sum x_k^2$ \

## Gauss or Normal Distribution

* $P(x) = \frac{1}{sqrt(2 \pi \sigma ^2)} e^{\frac{-1}{2}*\frac{(x-u)^2}{\sigma ^2}}$ \
* $\lim \sigma -> 0$ \
* $P(x) = \delta(x)$ \
* $f(a) = \int f(x) \delta(x-a) dx$ \

## Several Random Variables

* $X, Y$ \
* $Plot (X_k, Y_k)$ \
* $CO-VAR(x,y) = (E(x) -x | E(y) - y)$ \
* $CO-VAR(x,x) = VAR(x)$ \
* E(x) = 0, E(y) = 0 \ 
    * Can be accomplished with a DC filter
    * CO-VAR(x,y) = E(x * y)
    * Monte Carlo
        * $\frac{1}{N} \sum x_k y_k$ \
        * $x_k = cos(w_0 k m)$ \

