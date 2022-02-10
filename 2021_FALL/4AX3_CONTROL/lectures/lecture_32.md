# Lecture 32

## Intelligent Systems

Data from sensors -> features -> classify / regression / tracking

Signal processing

Feature extraction

## Reduction (PCA)

$\sum_{k=1}^K||x^k - V_m V_m^T x^k ||$

$V_1 ... V_N$ Components

## Support Vector Machines

$()w^T x^k + b)y^k = /gamma^k$ 

$y^k = +1 / -1$

## Clustering

$(x^k)$ ---> unsupervided

Picking groups of things

$2^m$

## K Mean Clustering

Need to know how many you want

1. Pick random k points --> centres
2. For each point assign to cluster by distance
3. Recompute centers
4. Go to 2

Best criteria?

$I(c)$ information contained in cluster C

## Hierarchical Clustering

All pairs
All triples
All ...

Entropy = $\sum p_k - log(p_k)$

## Data Association

Hungarian algorithm 

"Effectively"

---

Association

$x^k$ --> l

$X_{kl}$

$J = \sum_k \sum_i X_{kl} || x^i - u_k ||$

$\frac{dJ}{d u_k} = \frac{1}{2} \sum X_{ki} || x^i - u_k|| -1 = 0$

$u_k = \frac{\sum_i X_{ki} x^i}{\sum_i X_{ki}}$


