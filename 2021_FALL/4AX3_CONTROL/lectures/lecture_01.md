# Lecture 1
<center>
~~~mermaid
graph TD
    Input-->System
    System-->Output
    Output-->Observer
    Noise-->Observer
    Observer-->Predictor
    Predictor-->Controller
    Controller-->Input
~~~
</center>

\newpage

* Observer = what happened \
* Predictor = what will happen \
* Control = how to make it happen \

## Estimate a constant 
* There is noise in the system \
* $\frac{1}{N}\sum_{k=1}^{N} X_k$ \
* How big should we make N? \

## Model 
* $X_{m+1} = X_m$ \
* X = state \
* $Y_m = X_m + noise$ \
* Can assume that the noise has a Gaussian distribution \
* We care about the variance \

## Systems : Models
* $X_{m+1} = A(X_m1, u_m)$ input \
* $y_m = h(X_m)$ output \
* This is said to be stochastic in nature \

\newpage

## Planet Lander Example: \
<center>
~~~mermaid
graph TD
    Lander-->Ground
    Speed-->Lander
~~~
</center>

* $x(t)$ = position = 0 \
* $\dot{x}(t)$ = speed = 0 \
* cost |u| \
* You estimate to stop from smashing into the ground
* We can then make the problem optimal by minimizing cost

\newpage

$$\begin{matrix}
0 & 0  & 0 & G \\
0 & [] & 0 & 0 \\
R & 0  & 0 & 0 \\
\end{matrix}$$

* The observer is a Kalman filter \
* Optimal control \
* Based on the bellman equation \

## Probability

* u = universe of all possible outcomes \
* A is the set we want \
* $P(A) = \frac{A}{u}$ \
* O <= P(A) <= 1 \

* B is some other set of outcomes and we want the intersection of B and A \
* $P(B|A) = \frac{P(A|B)P(B)}{P(A)}$ \
* Bayesian reasoning
