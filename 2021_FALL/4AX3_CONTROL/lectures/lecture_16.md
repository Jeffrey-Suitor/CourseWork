# Lecture 16

## Kalman

State $x_m$ \
Measuring $y_m$ \
Everything is Gauss \
Estimate $\widetilde{x}_m = E(x_m)$ \
$P(m) = VAR(x_m - \widetilde{x_m})$ \

### Model

$x_m = A x_{m-1} + q_m$ \
$y_m = (x_M + something_m)$ \
\
$\widetilde{x}_1^+$ \
$\widetilde{x}_m^+ = A \widetilde{x}_{m-1}$ \
$P_m^+ = A P_{m-1} A^T + Q$ \
\
We want to minimize the prediction error \

Predict:
* \widetilde{x}_m^+ -> C \widetilde{x}_m^+ \widetilde{y}_m \

$\widetilde{x}_m = \widetilde{x}_m^+ + k_m(y_m - \widetilde{y}_m^+)$ \
$k = \frac{\text{model uncertainty}}{\text{uncertainty in model + uncertainty in measurement}}$ \
$k = \frac{P_m^+ C^+}{P_m^ C^++ + R} \

## Simple Example

A, B, C, Q, R \
AB for the model \
C for the robot \
A = Matrix \
C = output \
Q = model uncertainty (one of these two is wrong) \
R = model uncertainty  \

$y'' = \alpha_1 y' + \alpha_0 y = 0$ \
$system = \begin{bmatrix} y \\ y1 \end{bmatrix}$ \
$\begin{bmatrix} 1 & 0 \\ - \alpha_0 & - \alpha_1$ \
$alpha_1, alpha_0 > 0$ \
Spiral -> creates a spiral when you plot y and y_!, when you plot in state space you get a spiral \
\
y'' = -g \
y'= v \
v' = -g \
\
g is constant!, $\dot{g} = 0$ \
y' = 0 \
v' = -0 \
g' = 0 \
$\begin{bmatrix} y \\ y_1 \\ y_2 \end{bmatrix}$ \
$y' = \begin{bmatrix} 0 & 1 0 \\ 0 & 0 & 1 \\ 0 & 0 & 0 \end{bmatrix}$ \
(I + hA) \
\
y'' = -g + noise \
g = 3.1 \

## Parameter Tuning

Q and R \
Measuring $\alpha$ and distance d \
y'' = -g \
If the kalman equation doesn't converge and continues straight you need to add a state variable \
d sin(d)
$\begin{bmatrix} x \dot{x} y \dot{y} \theta \dot{\theta}$ \
$\dot{x} = v cos(\theta)$ \
$\dot{y} = v sin(\theta)$ \
Landmark \
As a robot you measure the distance and direction to all the landmarks \
