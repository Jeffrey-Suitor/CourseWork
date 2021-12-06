# Lecture 17

## Extended Kalman Filter

### Simple Robot

Differential drive robot \
state = $\begin{bmatrix} x \\ y \\ \theta \\ \dot{x} \\ \dot{y} \\ \dot{\theta} \\ \ddot{x} \\ \ddot{y} \\ \ddot{\theta} \end{bmatrix}$ \
There are no direct sensors to measure speed \
All of these are found in a typically IMU \ 
Robot = $\begin{bmatrix} \dot{x} = vcos(B) \\ \dot{y} = v sin(B) \\ \dot{\theta} \end{bmatrix}$ \
World = $\begin{bmatrix} \dot{x} = vcos(\theta + \frac{B}{2}) \\ \dot{y} = vsin(\theta + \frac{B}{2}) \\ \dot{\theta} = B \end{bmatrix}$ \
$- \pi \leq \theta \leq \pi$ \
$d = \sqrt{(x-x_m)^2(y-y_m)^2}$ \
$Actan2(x,y)$ \
$x_{m+1} - f(x_m, u_m)$ \
$y_m = h(x_m)$ \

### Predict

$\widetilde{x}_m^+ = f(\widetilde{x}_{m-1}, u_{m-1}) = P_m^+$ \

### Update

$f(x+h) = f(x) + h f(x)$ \
$= (A + h J_A)x$ \
$$
J_f(x) = \begin{bmatrix} \frac{df_1}{dx_1} & \frac{df_1}{dx_2} & ... * \frac{df_1}{dx_m} \\
... \\
\frac{df_m}{dx_1} \end{bmatrix}$ \

THIS STUFF NEEDS THE FULL JACOBIAN \

## Robot Example

$state = \begin{bmatrix} x \\ y \theta \end{bmatrix}$
$control = \begin{bmatrix} v \\ steer \end{bmatrix}$ \
x_{m+1} = \begin{bmatrix} x_m + dt cos(\theta_m) \\ y_m + dt sin(\theta_m) \\ \theta_m + dt B \end{bmatrix}$ \begin{bmatrix} f_x \\ f_y \\ f_z \end{bmatrix}$ \
J_f = \begin{bmatrix} 1 & 0 -dt v sin(\theta) \\ 0 1 v cos(\theta) \\ 0 0 dt v \end{bmatrix}$ \
$\widetilde{x}_{m+1} = f(x \text(state), \begin{matrix} V \\ B \end{matrix} \text(control))$ \

MISSED SOME STUFF HERE \

## Marker
$$
h = \begin{bmatrix} x \\ y \\ \theta \end{bmatrix} \ 
= \begin{bmatrix} \sqrt{(x_m - x)^2 + (y_m-y)^2} \\ atan(\frac{y_m -y}{x_m - x}) - \theta
$$
