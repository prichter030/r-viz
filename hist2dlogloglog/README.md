# R hist2dlogloglog

2-dimensional histogram with support logarithmic axes (X,Y, and color-coded Z axis).

Allows for visualization of heavily skewed data.

## Installation / Dependencies

### Dependencies
```r
install.packages("gplots") # contains original hist2d, which hist2dplus is based on.
install.packages("RColorBrewer") # required for beautiful colors.
install.packages("fields") # required to plot z-axis legend.
install.packages("scales") # required for log-scale axis computations.
```
### Load hist2dplus
```r
source("hist2dlogloglog.R")

```

### Example

```r
# generarte heavily skewed data, e.g., from a Pareto distribution. 

library(Pareto)

#let's assume our datapoints have two properties that we want to visualize (x and y).

x = rPareto(10000,1000,0.1)
y = rPareto(10000,1000,0.1)

# summary(x)
#      Min.   1st Qu.    Median      Mean   3rd Qu.      Max. 
# 1.002e+03 1.816e+04 1.021e+06 3.674e+34 8.414e+08 2.958e+38 
# (yep, that data is heavily skewed)

hist2dlogloglog(x,y,log="xyz",xlab="X values" ,ylab="Y values", main="hist2dlogloglog example")
```

![hist2dlogloglog example showing Pareto distribution of X and Y](hist2dlogloglog_example1.png)
