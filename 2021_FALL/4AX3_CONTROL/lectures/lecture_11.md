# Lecture 11

## State Space Control

* $x_{m+1} = A x_m + B u_m$ \
* $y_m = C x_m$ \
    * No noise \
    * Controllable \
    * Observable \
* Full state feedback control \

~~~mermaid
graph TD
    U-->AB
    AB-->X
    X-->C
    C-->Y
    X-->-K
    -K-->U
~~~

* $u_m = -k x_m$ \
* $x_{m+1} = A x_m - B K x_m$ \
* $=(A - B K | x_m)$ \
* We get to pick the value of K \
* $x_m = 0$ \
* $x_{m+1} = A * 0 - K B 0$ \
* $x_{m+1} = (A - B K) x_m$ \
* $||x_{m+1}|| = ||(A - B K) x_m||$ \
* $||x_{m+1}|| <= ||A - B K|| ||x_m||$ \

## Control Example

* $y'' + y' + y = u$ \
* $x_{m+!} = A x_m$ \
* Want to control to y* \
* $u = K(x^* - x)$ \

## Observer

* Estimates the current state \

~~~mermaid
graph TD
    X-->Plant
    Plant-->Y
    Y-->Model
    X-->Model
~~~

* Model means that you know A, B, C \
* $\widetilde{x_{m+1}} = A \widetilde{x_m} + B u_m$ \
* As long as you know $X_0$ \
* $\widetilde{x_0} = x_0$ \
* $\widetilde{x_1} = A x_m + B u_m$ \
* This is open loop control \

## Construct an observer

* Control observation error to zero \
* $\widetilde{x_{m+1}} = A \widetilde{x_m} + B u_m + L (y_m - \widetilde{y_m})$ \

~~~mermaid
graph TD
    X-->Plant
    Plant-->Y
    X-->Model
    Model-->X_tilde
    X_tilde-->C
    C-->Y_tilde
    X_tilde-->-K
    -K-->X
    Y_tilde-->Error
    Y-->Error
    Error-->-L
    -L-->Model
~~~

### Plant

* $x_{m+1} = A x_m + B u_m$ \
* $y_m = C x_m$ \

### Model

* $\widetilde{x_{m+1}} = A \widetilde{x_m} + B u_m + L (y_m - \widetilde{y_m})$ \
* $\widetilde{y_m} = C \widetilde{x_m}$ \

### Error Analysis

* $error = x_{m+1} - \widetilde{x_{m+1}}$ \
* $A x_m = B u_m - A \widetilde{x_m} - B u_m - L (y_m - \widetilde{y_m}) - c x_m + c \widetilde{x_m}$ \
* $=(A - Lc) (x_m - \widetilde{x_m})$ \
* Pick L so poles are in the unit circle \
* (A - Bk) = luneberg observer \
