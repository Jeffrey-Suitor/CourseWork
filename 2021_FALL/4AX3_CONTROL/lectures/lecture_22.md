# Lecture 22

## Bellman Equation

$V(s)^{\pi} = \sum_a \pi(s,a) \sum_{s^1} P_{s s^1}^a ( R_{s s^1} + \gamma V(s^1)^{\pi} )$

$V(s)^{\pi} = \sum_a \pi(s,a) Q^{\pi} (s,a)$

$Q^{\pi}(s,a) = \sum_{s^1} P_{s s^1}^a (R_{s s^1}^a + \gamma V(s^1)^{\pi})$

$\pi(s,a) = MAX a Q(s,a)$ <- Greedy policy 

## Value Iteration

$V(s)^{\pi_1} \geq V(s)^{\pi^2}$

$V(s)^*$

$V(s)^m -> V(s)^{m+1} -> V(s)^{m+2}$

$V(s)^{m+1} = V(s)^m + MAX a (R_{s s^1}^a + \gamma V(s^1)^m)$\

Assumptions:
- Model is known
- Online learning

## Model less Value Iteration

$s_1, s_2, s_3, s_4, ..., s_N$

$V(s_{m+1}) = V(s_m) + \gamma ( V(s_{m-1}) - V(s_m) )$

The problem is that we have to wait for the agent to get the reward

## Temporal Difference Learning

$V(s_m) <- V(s_m) + m (R + \gamma (V(s_{m-1}) - V(s_m)))$

## Q learning

Learning based on actions

$Q(s,a) <- Q(s,a) + m (R + \gamma MAX \text{ a } (Q(s^1, a^1) - Q(s,a)))$


