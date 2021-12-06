# Lecture 12

## Observer

* Run a second system in parallel and try to estimate the internal state
* $\widetilde{x_{m+1}} = A \widetilde{x_m} + B u_m = L (y_m - \widetilde{y_m})$ \
* Pick the L such that it goes ot 0 \

### Plant

* $x_{m+1} = A x_m + B u_m$ \
* $u_m = -k x_m$ \
* $= -k \widetilde{x_m}$ \
* $= x_m - e_m$ where $e_m = x_m - \widetilde{x_m}$ \
* e_m approaches 0, x_m approaches 0 \

## Learning and Fusion

* $\widetilde{x_{m+1}} = A \widetilde{x_m} + L (y_m \widetilde{y_m})$ \
* Want a finite memory filter because we don't want to remember all previous values.
* Predict -> Observe -> Update
* $S-N = \frac{1}{N} \sum_{k=1}^{N} y_k$ \
* $S-N = \frac{1}{N} \sum_{k=1}^{N-1} y_k + \frac{1}{N} y_N$ \
* $\frac{N-1}{N} \frac{1}{N-1} \sum_{k=1}^{N-1} y_k + \frac{1}{N} y_N$ \
* $S_{N-1} + \frac{1}{N}(y_m - S_{N-1})$ \

## Example

* Everything is gauss noise \
* $VAR(x) = \sigma_x^2$ \
* How do you use fuse 2 guassian observations \
* x,y -> E(x), E(y) \ 
    * Choose 0 <= K <= 1 \
    * $k x + (1-k) y$ \
    * $a = k, b = (1-k)$ \
    * Want to minimize the variance \
    * $VAR(k x + (1 - k) y)$ \
    * $E((E(ax + by) - ax -by)^2)$ \
    * $E((aE(x) + bE(y) - ax - by)^2)$ \
    * $(a(E(x) -x) + b(E(y) - y))^2$ \
    * $VAR (ax + by) = a^2 VAR(x) + b^2 VAR(y) + 2ab CO-VAR(x, y)$ \
* $k^2 \sigma_x^2 + (1-k)^2 \sigma_y^2$ \
* Minimize \
    * $k^2 \sigma_x^2 + \sigma_y^2 - k \sigma_y^2 + k^2 \sigma_y^2$ \
    * $\frac{d}{dk} = 2k \sigma_x^2 - \sigma_y^2 + 2k \sigma_y^2 = 0$ \
    * $k =\frac{\sigma_y^2}{ \sigma_x^2 + \sigma_y^2}$ \
