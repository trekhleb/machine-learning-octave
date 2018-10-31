# Machine Learning in Octave

This repository contains MatLab/Octave examples of popular machine learning algorithms with code examples and mathematics behind them being explained.

The purpose of this repository was _not_ to implement machine learning algorithms using 3<sup>rd</sup> party libraries or Octave/MatLab "one-liners" _but_ rather to practice and to better understand the mathematics behind each algorithm. In most cases the explanations are based on [this great](https://www.coursera.org/learn/machine-learning) machine learning course.

## Supervised Learning

In supervised learning we have a set of training data as an input and a set of labels or "correct answers" for each training set as an output. Then we're training our model (machine learning algorithm parameters) to map the input to the output correctly (to do correct prediction). The ultimate purpose is to find such model parameters that will successfully continue correct input→output mapping (predictions) even for new input examples.

### Regression

In regression problems we do real value predictions.

_Usage examples: stock price forecast, sales analysis, dependency of any number, etc._

- [Linear Regression](./linear-regression) - example: house prices prediction.

### Classification

In classification problems we split input examples by certain characteristic.

_Usage examples: spam-filters, language detection, finding similar documents, handwritten letters recognition, etc._

- [Logistic Regression](./logistic-regression) - examples: microchip fitness detection, handwritten digits recognitions using one-vs-all approach.
- [Neural Network](./neural-network) (NN) - example: handwritten digits recognition.

## Unsupervised Learning

Unsupervised learning is a branch of machine learning that learns from test data that has not been labeled, classified or categorized. Instead of responding to feedback, unsupervised learning identifies commonalities in the data and reacts based on the presence or absence of such commonalities in each new piece of data.

### Clustering

In clustering problems we split the training examples by unknown characteristics. The algorithm itself decides what characteristic to use for splitting.

_Usage examples: market segmentation, social networks analysis, organize computing clusters, astronomical data analysis, data compression, etc._

- [K-means algorithm](./k-means) - example: split data into three clusters.
- [Anomaly Detection](./anomaly-detection) (using Gaussian distribution) - example: detect overloaded server.

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
