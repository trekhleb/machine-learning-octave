# Machine Learning in Octave

This repository contains MatLab/Octave examples of popular machine learning algorithms with code examples and mathematics behind them being explained.

The purpose of this repository was _not_ to implement machine learning algorithms using 3<sup>rd</sup> party libraries or Octave/MatLab "one-liners" _but_ rather to practice and to better understand the mathematics behind each algorithm. In most cases the explanations are based on [this great machine learning course](https://www.coursera.org/learn/machine-learning).

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

### Install Octave or MatLab

This repository contains `*.m` scripts that are intended to be run in [Octave](https://www.gnu.org/software/octave/) or [MatLab](https://www.mathworks.com/products/matlab.html). Thus in order to launch demos you need either Octave or MatLab to be installed on you local machine. In case of MatLab you may also use its [web-version](https://matlab.mathworks.com/).

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

Also be aware that demo scripts opens additional window with charts and other graphical information that is related to the running algorithm. You may find screenshots of the window that each demo will render for you on the dedicated README files for each machine learning algorithm.

![Demos](./images/demos.png)
