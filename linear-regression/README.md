# Linear Regression

## Features (variables)

Each training example consists of features (variables) that describe this example (i.e. number of rooms, the square of the apartment etc.)

![Features](../images/linear-regression-features.svg)

_n_ - number of features

_R<sup>n+1</sup>_ - vector of _n+1_ real numbers

## Parameters

Parameters of the hypothesis we want our algorithm to learn in order to be able to do predictions (i.e. predict the price of the apartment).

![Parameters](../images/linear-regression-parameters.svg)

## Hypothesis

The equation that gets features and parameters as an input and predicts the value as an output (i.e. predict the price of the apartment based on its size and number of rooms).

![Hypothesis](../images/linear-regression-hypothesis.svg)

For convenience of notation, define _X<sub>0</sub> = 1_

## Cost Function

Function that shows how accurate the predictions of the hypothesis are with current set of parameters.

![Cost Function](../images/linear-regression-cost-function.svg)

_x<sup>i</sup>_ - input (features) of _i<sup>th</sup>_ training example

_y<sup>i</sup>_ - output of _i<sup>th</sup>_ training example

_m_ - number of training examples