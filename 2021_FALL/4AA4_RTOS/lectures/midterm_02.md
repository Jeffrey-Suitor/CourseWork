# Task Definitions

## Standard Definitions

Representation of periodic tasks: \

$\phi_i$ = release time of the tasks (when it starts) \
$P_i$ = period of the task, the time interval between two consecutive jobs$ \
$e_i$ = the execution time of the task \ 
$D_i$ = relative deadline of the task \

$(\phi_i, P_i, e_i, D_i)$ \
$(0, P_i, e_i, D_i)$ \
$(0, P_i, e_i, P_i)$ \

utilization $u_i = \frac{e_i}{p_i}$ \
$U = \sum_{i=1}^n u_i$ \

## Hyperperiod

$N = \sum_{n=1}^n \frac{H}{p_i}$ \
$p_i$ is the period of each task \

## Frame Size Constaints

$H = lcm(e_i)$ \
C1: A job must fit into a frame \
$f \geq max$ $e_i$ for all tasks \
\
C2: H must be evenly divided by F, the hyperperiod has an integer number of frames (only factors work) \
C3: $2f - gcd(P_i, f) \leq D_i$ for each task i (gcd is greatest common divisor)\

## CE Scheduling

Two conditions: \
If a job arrives before or at the starting time of frame k \
If job i has an absolute deadline which is smaller than or equal to the ending time of frame k \

# Rate Monotonic Scheduling

Lowest period = high priority \

# Deadline Monotonic Scheduling

Lowest deadline = highest priority \

# Dynamic Priority Scheduling

Earliest deadline first = arrival + relative deadline = high priority \

