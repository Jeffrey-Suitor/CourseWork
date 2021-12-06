# Lecture 13

## Predictor & Observer

* Use the prediction and observation to determine state \
* $P(x_m | x_{m-1})$ = prediction \
* $P(x_m | y_m)$ = measurement of state \
* Guassian assumption \
* $E(x_m) = \widetilde{x}_m$ \
* $VAR(x_m) = P_m$ \
* $Given \widetilde{x}_{m-1} P_{m-1}$ \
* $Predict \widetilde{x}_{m}^+ P_m^+$ \
* $Observe y_m$ \
* Update to get $\widetilde{x}_m P_m$ \

## Kalman Filter

* Scalar
* $x_{m+1} = a x_m + v_m$ \
* $y_m = c x_m + q_m$ \
* $N(0, \sigma_v^2)$ \
* $N(0, \sigma_q^2)$ \
* $\widetilde{x}_m = E(x_m)$ \
* $P_m = VAR(x_m - \widetilde{x}_m)$ \

1. Predict -> given $\widetilde{x}_{m-1} P_{m-1}$ \
    * $\widetilde{x}_m^+ = A \widetilde{x}_{m-1}$ \
    * $\widetilde{P}_m^+ = VAR(x_m - \widetilde{x}_m^+)$ \
    * $=VAR(A x_{m-1} + v_m - A \widetilde{x}_{m-1})$ \
    * $=a^2 VAR(x_{m-1} - \widetilde{x}_{m-1}) + VAR(v_m) + 2 CO-VAR(x_{m-1}, -\widetilde{x}_{m-1}, v_m)$ \
    * $=a^2 P_{,-1} + \sigma_v^2$ \
    * $\widetilde{x}_m^+ = a \widetilde{x}_{m-1}$ \
    * $P_m^+ = a^2 P_{m-1} + \sigma_v^2$ \

2. Observe $y_m$ \
    * $\widetilde{x}_m = \widetilde{x}_m^+ + k(y_m - \widetilde{y}_m)$ \
    * $\widetilde{x}_m = \widetilde{x}_m^+ + k c x_m - k c \widetilde{x}_m^+ + k q_m$ \
    * $P_m = VAR(x_m - \widetilde{x_m}) = E((x_m - \widetilde{x}_m)^2)$ \
    * $x_m - \widetilde{x}_m = x_m - \widetilde{x}_m^+ - k(c x_m + q - \widetilde{y}_m)$ \
    * $x_m - \widetilde{x}_m^+ - k c x_m - k c \widetilde{x}_m^+ - k q_m$ \
    * $(1 - kc)(x_m - \widetilde{x}_m^+) - k q_m$ \
    * $(ax + b)2$ \
        * $a = (1 - kc)$\
        * $a = (x_m - \widetilde{x}_m^+)$\
        * $k= -k q_m$ \
* $E((1-kc)^2 (x_m \ widetilde{x}_m^+) + k^2 q_m^2 + 2(a-kc)(x-\widetilde{x}_m^+))$ \
* $(1- kc)^2 E((x_m - \widetilde{x}_m^+)^2) = k^2 E(q_m^2)$ \
* $(1- 2kc + k^2c^2) P_m^+ + k^2 \sigma_q^2$ \
* $\frac{d}{dk} = -2c P_m^+ + 2kc^2 P_m^+ + 2k \sigma_q^2 = 0$ \
* $k = \frac{cP_m^+}{c^2 P_m^+ + \sigma_q^2}$ \
* $\widetilde{x}_m = \widetilde{x}_m^+ + k(y_m - c \widetilde{x}_m^+)$ \
* $P_m = (1-kc) P_m^+$ \

## Scalar Kalman

* $Given a, c, \sigma_v^2 = model uncertainty, \sigma_q^2 = observation uncertainty$ \
* $Start at \widetilde{x}_0 with P_0$ \
* Predict \
    * $\widetilde{x}_m^+ = a x_{m-1}$ \
    * $P_m^+ = a^2 P_{m-1} + \sigma_v^2$ \
* Update $y_m$ \
    * $\widetilde{x}_m = \widetilde{x}_m^+ + k(y_m - c \widetilde{x}_m^+)$ \
    * $P_m = (1- kc) P_m^+$ \
    * $k = \frac{c P_m^+}{c^2 P_m^+ + \sigma_q^2}$ \
