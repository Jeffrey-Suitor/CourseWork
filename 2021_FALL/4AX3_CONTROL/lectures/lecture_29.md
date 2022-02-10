# Lecture 29

## Neural Networks

Derived back propagation last class

$f: R --> R$

$NT(x) - f(x) < \epsilon$

To prove this:

$f \cap \sum_{k=0}^N \alpha_k x^k$

$(x^k, y^k)$ split into training and testing (60/40)

Initialize with random weights

Confusion table:
$$
\begin{matrix}
 & 1 & 0 \\
50 C1 & 45 & 5 \\
50 C2 & 5 & 30
\end{matrix}
$$

45 C1 correct, 30 C2 correct, 5 incorrect C2, 5 incorrect C1.

---

sin(2t)
sin(3t)

Need to make data that is not highly correlated

## Data -> Feature Extraction -> Classify (ANN, SVM)

Deep learning does not need feature extraction

For CNN you create a 2D kernel which you run over the data to identify features. The amount you move over is called the stride.

Too many kernels causes an explosion and there is a lot of redundant data that needs to be removed.

You can use polling to reduce the amount of neurons you need to train.

---

## Autoencoder

Encoder with a small connection to the decoder.

This allows you to direct the training and create meaningful features
