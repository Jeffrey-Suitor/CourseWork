# Lecture 21

## Markov Chains

$R_i \sum_{k=0}^{\inf} \gamma^k r_{i+k+1}$

$P_{s s^1}^a = P_R( s_{i+1} = s^1 | s_i = s, a_i = a )$

$R_{s s^1}^a = E(r_{i+1} | s_i = s_1, a_i = a, s_{i+1} = s^1)$

## Policy

$\pi(s,a)$ probability of taking action a in state s\

$V(s)^{\pi} = E_{\pi}(R_i | s_i=s)$

$Q(s)^{\pi} = E_{\pi}(R_i | s_i=s, a_i=a)$

$V(s)^{\pi} = \sum_a \pi(a|s) Q^{\pi}(s,a)$\

Potential at this state = sum of the probability of taking an action and the reward for taking that action

## Bellman Equation

$V(s)^{\pi} = \sum \pi(s,a) \sum P_{s s^1}^a ( R_{s s^1}^a + \gamma V(s^1)^{\pi} )$

$Q(s,a)^{\pi} = \sum P_{s s^1}^a ( R_{s s^1}^a+ \gamma \sum_{a^1} \pi(s^1, a^1) Q^{\pi}(s^1, a^1))$

$V(s)^* = MAX \sum P_{s s^1}^a ( R_{s s^1}^a + \gamma V(s^1)^*)$\

Greedy = want to maximize your problem

## Optimal Policy

$\pi_1$, $\pi_2$ -> $V(s)^{\pi_1} \geq V(s)^{\pi_2}$

$V(s)^* = MAX \pi of V(s)^{\pi}$

$\pi(s,a) = \begin{matrix} 1 & MAX V(s)^* \\ 0 \end{matrix}$\

* There is an optimal solution
* It is not unique
* How do I find it

- Dynamic programming (optimization)
- Value iteration
- Reinforcement learning

## Dynamic Programming

$V(s)^m+1 = MAX a \sum P_{s s^1}^a ( R_{s s^1}^a + \gamma V(s^1)^m)$\

### A Star

Can use A* for path finding. Start with the goal and everything set to 0. Work backwards from the goal and subtract 1. Everytime you can replace with a value that is higher than current you do. Does not matter about the start
