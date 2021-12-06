# Lecture 2

## Probability Partitioning

$$\begin{matrix} 0 & 0 & 0 & 0 \\
                 0 & 0 & 0 & 0 \\
                 0 & 0 & 0 & 0 \\
\end{matrix}$$

* $A_k \cap A = \phi$ \
* $V A_k = u$ \
* $P(c) = \sum P(c|A_k)* A_k$ \

## Hero Example

* 1/100 people is a hero \
* 90% accurate, 10% false positive \
* 80% accurate, 20% false negative \
* P(H | X) = 0.9 \
* P(H | !X) = 0.2 \
* P(X) = 0.01 \
* $P(X | H) = \frac{P(H|X)*P(X)}{P(H)}$ \
* $P(X | H) = \frac{0.9 * 0.01}{0.01*0.9 0.99*0.2} = 0.05 = 5%$ \

## Bayesian Reasoning

<center>
~~~mermaid
graph TD
    X0-->X1
    X1-->Y1
    X1-->Xn
    X1-->Noise
    Y1-->X1
~~~
</center>


* $P(X | Y) = \int X P(X | Y) dx$ \

## Hallway Robot

* $\begin{matrix} 0 & 1 & 2 & 3 & 4 & 5 & 6 & 7 & 8 & 9 \end{matrix}$ \
* $\begin{matrix} 0 & 1 & 1 & 0 & 0 & 0 & 1 & 0 & 0 & 0 \end{matrix}$ \
* $P_1(x) = $\begin{matrix} 0 & \frac{1}{3} & \frac{1}{3} & 0 & 0 & 0 & \frac{1}{3} & 0 & 0 & 0 \end{matrix}$ \
* $P_0(x) = $\begin{matrix} \frac{1}{7} & 0 & 0 & \frac{1}{7} & \frac{1}{7} & \frac{1}{7} & 0 & \frac{1}{7} & \frac{1}{7} & \frac{1}{7} \end{matrix}$ \
* $X_0 = \begin{matrix} 0.1 & 0.1 & 0.1 & 0.1 & 0.1 & 0.1 & 0.1 & 0.1 & 0.1 & 0.1 \end{matrix}$ \
* $P (X | 1) = \frac{P(1 | X) P(x)}{P(1)}$ \

### Move the robot
 
* $X_1(x) = $\begin{matrix} 0 & 0 & \frac{1}{3} & \frac{1}{3} & 0 & 0 & 0 & \frac{1}{3} & 0 & 0 \end{matrix}$ \
* $P(X | 1) = \frac{P(G | 1) P(X)}{P(1)}$ \

## Plant Example

<center>
~~~mermaid
graph TD
    Plant-->Observer
    Observer-->Predict
    Predict-->Control
    Control-->Plant
~~~
</center>

* x' = A(x, u) \
* y = u(x) \
* X(T) = 0 \
* $X(\inf) = 0$ \
* $J = \int_0^{\inf} cost(x, u) dt$ \
* Arg min J u \
* Minimize control input cost that approaches final state \

## Race Track Example

* Find the series of values to mimize cost \
* $Min \sum || \widetilde{X_k} - X_k ||$ \
* $Min \sum || Robot - Markers ||$ \
* $\widetilde{X_{k+1}} = A \widetilde{X_k} + B u_k$ \

