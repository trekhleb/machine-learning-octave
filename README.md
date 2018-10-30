# Machine Learning in Octave

## Supervised Learning

Given the "right answer" for example in the data, predict real-valued output. Predictive analysis.

### Regression

Real value prediction.

- [Linear Regression](./linear-regression) - Example: house prices prediction

### Classification

- [Logistic Regression](./logistic-regression) - Examples: microchip fitness detection, handwritten digits recognitions using one-vs-all approach
- [Neural Network](./neural-network) (NN) - Example: handwritten digits recognition

## Unsupervised Learning

### Clustering

- [K-means algorithm](./k-means)
- [Anomaly Detection](./anomaly-detection) (using Gaussian distribution)

## How to Use This Repository

### Install Octave

### Run Demos

In order to run the demo of your choice you should move to the chosen folder (i.e. `neural-network`):

```bash
cd neural-network
```

Launch Octave console:

```bash
octave
```

Launch demo script from Octave console:

```bash
demo
```

To see all demo variables you may launch:

```bash
whos
```

To exit the demo you may launch:

```bash
exit
```

Also be aware that demo scripts may open additional windows with charts or other graphical information that is related to the running algorithm.
