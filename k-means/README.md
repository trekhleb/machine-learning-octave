# K-Means Algorithm

**K-means clustering** aims to partition n observations into _K_ clusters in which each observation belongs to the cluster with the nearest mean, serving as a prototype of the cluster.

The result of a cluster analysis shown below as the coloring of the squares into three clusters.

![Clustering](https://upload.wikimedia.org/wikipedia/commons/c/c8/Cluster-2.svg)

## Description

Given a training set of observations:

![Training set](./formulas/training-set.svg)

![x-i](./formulas/x-i.svg)

Where each observation is a _d_-dimensional real vector, k-means clustering aims to partition the _m_ observations into _K_ (_≤ m_) clusters:

![Clusters](./formulas/clasters.svg)

... so as to minimize the within-cluster sum of squares (i.e. variance).

Below you may find an example of 4 random cluster centroids initialization and further clusters convergence:

![Clustering](http://shabal.in/visuals/kmeans/random.gif)

[Picture Source](http://shabal.in/visuals/kmeans/6.html)

Another illustration of k-means convergence:

![Clustering](https://upload.wikimedia.org/wikipedia/commons/e/ea/K-means_convergence.gif)

![Clustering](https://upload.wikimedia.org/wikipedia/commons/d/d1/KMeans-density-data.svg)

## References

- [Machine Learning on Coursera](https://www.coursera.org/learn/machine-learning)
- [K-means on Wikipedia](https://en.wikipedia.org/wiki/K-means_clustering)
