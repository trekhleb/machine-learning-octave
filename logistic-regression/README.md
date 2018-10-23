# Logistic Regression

**Logistic regression** is the appropriate regression analysis to conduct when the dependent variable is dichotomous (binary). Like all regression analyses, the logistic regression is a predictive analysis. Logistic regression is used to describe data and to explain the relationship between one dependent binary variable and one or more nominal, ordinal, interval or ratio-level independent variables.

Logistic Regression is used when the dependent variable (target) is categorical.

For example:

- To predict whether an email is spam (1) or (0).
- Whether online transaction is fraudulent (1) or not (0).
- Whether the tumor is malignant (1) or not (0).

In other words the dependant variable (output) for logistic regression model may be described as:

![Logistic Regression Output](../images/logistic-regression/output.svg)

## Training Set

Training set is an input data where for every predefined set of features _x_ we have a correct classification _y_.

![Training Set](../images/logistic-regression/training-set-1.svg)

_m_ - number of training set examples.

![Training Set](../images/logistic-regression/training-set-2.svg)

For convenience of notation, define:

![x-zero](../images/logistic-regression/x-0.svg)

![Logistic Regression Output](../images/logistic-regression/output.svg)

## Hypothesis (the Model)

The equation that gets features and parameters as an input and predicts the value as an output (i.e. predict if the email is spam or not based on some email characteristics).

![Hypothesis](../images/logistic-regression/hypothesis-1.svg)

Where _g()_ is a **sigmoid function**.

![Sigmoid](../images/logistic-regression/sigmoid.svg)

![Sigmoid](https://upload.wikimedia.org/wikipedia/commons/8/88/Logistic-curve.svg)

Now we my write down the hypothesis as follows:

![Hypothesis](../images/logistic-regression/hypothesis-2.svg)

![Predict 0](../images/logistic-regression/predict-0.svg)

![Predict 1](../images/logistic-regression/predict-1.svg)

## References

- [Machine Learning on Coursera](https://www.coursera.org/learn/machine-learning)
- [Sigmoid Function on Wikipedia](https://en.wikipedia.org/wiki/Sigmoid_function)
