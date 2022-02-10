# Lecture 34

## Fusion

$\bar{x}$ $\bar{y}$

Can be correlated or uncorrelated based on CO-VAR(x,y)

Assume that x and y are independent observations of the same thing

Assume that the noise is uncorrelated

We work in a gaussian world and everything is gaussian distributed

$hx + (1-h)y$

Linear mix

Min var

$\frac{\sigma_x^2}{\sigma_x^2 + \sigma_y^2}$

x, y = gauss

x + y  = guass

x * y = gauss

### Kalman Example

Plant = Ax + Bu 
    y = Cx

u = input

y = output

u feeds into $A \widetilde{x} + B u$ which outputs x tilde

x tilde feeds into $C \widetilde{x}$ which outputs y tilde

y - y tilde gets fed through a gain L (error feedback)

L feed back into $A \widetilde{x} + B u$

x tilde goes to -K and feeds back to before u (control)

Can precompute Ks going backwards

17:53 in lecture 34 for diagram

### Optimal (Reinforcement)

Markov chains

$P(x_{m+1} |x_m)$ --> f (only dependent on previous state)

$P(y_m | x_m)$ --> h (only dependent on current state)

Use Cost or Reward

$J = \int_0^t COST(x,u) dt$ have used $X^TQx + u^T R U$

x' = f(x,u)

$s_i$ = state

$a_i$ = action

state = x, action = u

$P_{s s'}^a$ = probability something happens

$R_{s s'}^a$ = reward for taking an action

$\gamma$ = discount, bigger = care more about future, and small = care less

V = expected reward

$V(s) = \sum_a \sum_{s'} P_{s s'}^a (R_{s s'}^a + \gamma V(s'))$

Potential in a state is all possible actions and all states from these actions which is the probability of an action times the reward for that action plus the future discounted reward

#### Policy iteration example

You are given a diagram with set rewards for certain locations.

$R_{s s'}^a$ = -1 or 100 if s' = qf

$V^{m+1}(s) = MIN \text{ u } (COST(s,u) + \gamma V^m( f(x,u) ))$

$x_{m+1} = A x_m + B u_m$

$x^T Q x + u^T R u + x^T Q x$

## Bayesian

A = set
B = set
u = universe

Problem with bayesian is you need to know about the universe

$P(B|A) = \frac{P(A \cap B)}{P(A)}$

$P(B|A) = \frac{P(A|B)P(B)}{P(A)}$

If you compare B_1, B_2, B_3 you do not need to normalize

$x_0 = [0.1, 0.1, ... 0.1]$ for 10

$P(G|X) = [0, 0, 0.3, 0.3, 0, 0, 0.3]$ for 10
