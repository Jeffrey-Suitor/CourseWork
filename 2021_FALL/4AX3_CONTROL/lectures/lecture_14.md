# Lecture 14

## Kalman

* $x_{m+1} = A x_m = w_m$ \
* $y_m = c x_m + v_m$ \
* $E(w) = 0, E(v) = 0$ \
* $VAR(w) = Q$ \
* $XX^T$ = CO-VAR matrix \
* $E(ww^T) = Q, E(vv^T) = R$ \

### Observer
* $\widetilde{x}_m = E(x_m)$ \
* $P_m = VAR(x_m - E(x_m)$ \
* $= E((x_m - \widetilde{x}_m)(x_m - \widetilde{x}_m)^T)$ \

### Predict

* $\widetilde{x}_m = A \widetilde{x}_{m-1}$ \
* $P_m^+ = E((x_m - \widetilde{x}_m^+)(x_m - \widetilde{x}_m^+)^T)$ \
* $E(A() ()^T A^T + 2 A () v_m ^T + v_m v_m^T)$ \
* $E(A () ()^T A^T = v_m v_m^T)$ \
* $P_m^+ = A P_{m-1} A^T + Q$ \
* $\widetilde{x}_m^+ = A \widetilde{x}_{m-1}$ \

### Update

* Observe $y_m$ \
* $\widetilde{x}_m = \widetilde{x}_m^+ = k(y-m - c \widetilde{x}_m^+)$ \
* $\widetilde{x}_m = \widetilde{x}_m^+ + kcx_m + kv_m - kc \widetilde{x}_m^+$ \
* $=(I + kc)(x_m - \widetilde{x}_m^+) + k v_m$ \
* Minimize P choosing K \
* $E((x_m - \widetilde{x}_m)(x_m -widetilde{x}_m)^T)$ \
* $\widetilde{x}_m = \widetilde{x}_m^+ + kcx_m + kv_m - kc \widetilde{x}_m^+$ \
* $x_m - \widetilde{x}_m = x_m - \widetilde{x}_m^+ - kc x_m  - k v_m + kc \widetilde{x}_m^+$ \
* $(I-kc)(x_m - \widetilde{x}_m^+) - k v_m$ \
* $aa^T + ba^T = ab^T + bb^T$ \
* $(I-kc)(x_m - \widetilde{x}_m^+)(x_m - \widetilde{x}_m^+)^T (I-kc)^T + k v_m v_m^T k^T$ \

### Kalman Steps

* Given $\widetilde{x}_0, P_0, Q, R$ \
* $\widetilde{x}^+(m) = A \widetilde{x}(m-1)$ \
* $P^+(m) = A P (m-1) A^T + Q$ \
* Update with y(m) \ 
    * $k = \frac{P^+(m)C^T}{c P^+(m) C^T + R}$ \
    * $\widetilde{x}_m = \widetilde{x}_m^+ + k(y(m) - c\widetilde{x}^+(m))$ \
    * $P(m) = (1 - kc) P^+(m)$ \
