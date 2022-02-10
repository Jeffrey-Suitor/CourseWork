# Lecture 22

## Bellman Equation

$V(s)^{\pi} = \sum_a \pi(s,a) \sum_{s^1} P_{s s^1}^a ( R_{s s^1} + \gamma V(s^1)^{\pi} )$

$V(s)^{\pi} = \sum_a \pi(s,a) Q^{\pi} (s,a)$

$Q^{\pi}(s,a) = \sum_{s^1} P_{s s^1}^a (R_{s s^1}^a + \gamma V(s^1)^{\pi})$

$\pi(s,a) = MAX a Q(s,a)$ <- Greedy policy 
