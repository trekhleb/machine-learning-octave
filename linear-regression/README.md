# Linear Regression

Linear regression is a linear model, e.g. a model that assumes a linear relationship between the input variables (_x_) and the single output variable (_y_). More specifically, that output variable (_y_) can be calculated from a linear combination of the input variables (_x_).

![Linear Regression](https://upload.wikimedia.org/wikipedia/commons/3/3a/Linear_regression.svg)

On the image above there is an example of dependency between input variable _x_ and output variable _y_. The red line in the above graph is referred to as the best fit straight line. Based on the given data points (training examples), we try to plot a line that models the points the best. In the real world scenario we normally have more than one input variable.

## Features (variables)

Each training example consists of features (variables) that describe this example (i.e. number of rooms, the square of the apartment etc.)

![Features](../images/linear-regression/features.svg)

_n_ - number of features

_R<sup>n+1</sup>_ - vector of _n+1_ real numbers

## Parameters

Parameters of the hypothesis we want our algorithm to learn in order to be able to do predictions (i.e. predict the price of the apartment).

![Parameters](../images/linear-regression/parameters.svg)

## Hypothesis

The equation that gets features and parameters as an input and predicts the value as an output (i.e. predict the price of the apartment based on its size and number of rooms).

![Hypothesis](../images/linear-regression/hypothesis.svg)

For convenience of notation, define _X<sub>0</sub> = 1_

## Cost Function

Function that shows how accurate the predictions of the hypothesis are with current set of parameters.

![Cost Function](../images/linear-regression/cost-function.svg)

_x<sup>i</sup>_ - input (features) of _i<sup>th</sup>_ training example

_y<sup>i</sup>_ - output of _i<sup>th</sup>_ training example

_m_ - number of training examples

## Batch Gradient Descent

Gradient descent is an iterative optimization algorithm for finding the minimum of a cost function described above. To find a local minimum of a function using gradient descent, one takes steps proportional to the negative of the gradient (or approximate gradient) of the function at the current point.

Picture below illustrates the steps we take going down of the hill to find local minimum.

![Gradient Descent](https://cdn-images-1.medium.com/max/1600/1*f9a162GhpMbiTVTAua_lLQ.png)

The direction of the step is defined by derivative of the cost function in current point.

![Gradient Descent](https://cdn-images-1.medium.com/max/1600/0*rBQI7uBhBKE8KT-X.png)

Once we decided what direction we need to go we need to decide what the size of the step we need to take.

![Gradient Descent](https://cdn-images-1.medium.com/max/1600/0*QwE8M4MupSdqA3M4.png)

We need to simultaneously update ![Theta](../images/linear-regression/theta-j.svg) for _j = 0, 1, ..., n_ 

![Gradient Descent](../images/linear-regression/gradient-descent-1.svg)


![Gradient Descent](../images/linear-regression/gradient-descent-2.svg)

![alpha](../images/linear-regression/alpha.svg) - the learning rate, the constant that defines the size of the gradient descent step

![x-i-j](../images/linear-regression/x-i-j.svg) - _j<sup>th</sup>_ feature value of the _i<sup>th</sup>_ training example

_x<sup>i</sup>_ - input (features) of _i<sup>th</sup>_ training example

_y<sup>i</sup>_ - output of _i<sup>th</sup>_ training example

_m_ - number of training examples

_n_ - number of features

> When we use term "batch" for gradient descent it means that each step of gradient descent uses **all** the training examples (as you might see from the formula above).

## References

- [Machine Learning on Coursera](https://www.coursera.org/learn/machine-learning)
- [Linear Regression on Wikipedia](https://en.wikipedia.org/wiki/Linear_regression)
- [Gradient Descent on Wikipedia](https://en.wikipedia.org/wiki/Gradient_descent)
- [Gradient Descent by Suryansh S.](https://hackernoon.com/gradient-descent-aynk-7cbe95a778da)
- [Gradient Descent by Niklas Donges](https://towardsdatascience.com/gradient-descent-in-a-nutshell-eaf8c18212f0)