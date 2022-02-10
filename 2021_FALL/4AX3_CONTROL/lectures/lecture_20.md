#Lecture 20

## Bellman Equation

Discrete Time\
Discrete State Space\

a is part of set A which are actions\
reward = R

$$
\begin{matrix}
0.1 & 0.8 & 0.1 \\
0 & Robot & 0 \\
0 & 0 & 0
\end{matrix}
$$

$x_{m+1} = A x_m  + \epsilon_m$

Policy = Controller\
$\pi(S,a)$ probability of taking action a in state s.\

## Markov Model

States $S_i$ Actions $A_i$\
Transitions $S_i - a -> S_k$\
In state S action A leads to $S^1$

$\bigvee S \sum_a P_{s s^1}^a = 1$

## Markov Chains (Rewards)

  $A_i$ -> $A_{i+1}$ -> $A_{i+2}$ -> $A_{i+m-1}$\

$S_i$ -> $S_{i+1}$ -> $S_{i+2}$ -> $S_{i+m}$

R = reward\
A = action\
S = state

$R_i = r_{i+1} + r_(i+2) + ... $

$R_i = \sum_{k=0}^{\inf} r_{i+k+1}$

## Discounted Reward

$0 \leq \gamma \leq 1$

$R_i = \sum_{k=0}^{\inf} \gamma^k r_{i+k+1}$

$R_i = r_{i+1} + \gamma r_{i+1} + \gamma^2 r_{i+2}$

$V(s) = E(r_i | s_i = s)$

$Q(s, a) = E(r_i | s_i = s_1, a_i = a)$

$R_i = \sum_{k=0}^{\inf} \gamma^k r_(i+k+1)$

$R_i = r_{i+1} +  \sum_{k=1}^{\inf} \gamma^k r_(i+k+1)$

$R_i = r_{i+1} + \gamma \sum_{k=0}^{\inf} \gamma^k r_(i+k+2)$

Immediate reward + the discounted future reward

---

$V(s) = E(r_{i+1} + \gamma \sum_{k=0}^{\inf} r_{i+k+2} | s_i=s)$

---

## Notation

$P_{s s^1}^a = P_r(s_{i+1} = s^1 | s_i = s_1, a_i = a)$

$R_{s s^1}^a = E(r_{i+1} | s_i=s_1, a_i = a, s_{i+1} = s^1)

## Policy

$\pi(s,a)$

$V(s)^{\pi} = E_{\pi}(\sum_{k=0}^{\inf} \gamma^k r_{i+k+1} | s_i=s)$

$= E_{\pi}(r_{i+1} + \gamma \sum_{k=0}^{\inf} \gamma^k r_{i+k+2} | s_i=s)$

### Immediate reward

$E_{\pi}(r_{i+1} | s_i=s) = \sum_a \pi(s,a) \sum_{s^1} P_{s s^1}^a r_{s s^1}^a$

### Delayed Reward

$E_{\pi}(\gamma \sum_{k=0}^{\inf} \gamma^k r_{i+k+2} | s_i=s)$

$= \sum_a \pi(s,a) \sum P_{s s^1}^a \gamma E(\sum \gamma^k r_{i+k+2} | s_i=s)$


## Bellman Equation

$V(s)^{\pi} = \sum \pi(s,a) \sum P_{s s^1}^a + \gamma V(s^1)^{\pi}$

Expected reward under state s with policy pi is all possible choices of the policy plus all possible choices by non determinism of the system immediate robot + discounted future reward.\

$Q^{\pi}(s,a) = \sum_{s^1} P_{s s^1}^a ( R_{s s^1}^a + \gamma \sum \pi(s^1, a^1) ) Q^{\pi}(s^1, a^1))$

## Optimal $\pi$

Maximize $V(s)^{\pi}$
