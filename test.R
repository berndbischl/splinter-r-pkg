library(devtools)
load_all()
set.seed(123)

# xx = seq(0, 1, by = 0.2)
# x = expand.grid(xx, xx)

# x = as.matrix(x)


# xtrain = seq(0, 1, by = 0.2)
# xtrain = c(0, 0.7, 0.9, 1)
# xtrain = matrix(xtrain, ncol = 1)
# ntrain = nrow(xtrain)
# ytrain = rnorm(ntrain)


# m = bsplinefit(xtrain, ytrain, degree = 2, alpha = 0.03, smooth = 0, knotspacing = 0)
# print(m)

# xpred = seq(0, 1, by = 0.01)
# xpred = matrix(xpred, ncol = 1)
# ypred = bsplinepredict(m, xpred)

# plot(xpred, ypred, ylim = c(-2,2))
# points(xtrain, ytrain, cex = 3)



xtrain = c(0, 0.7, 0.9, 1)
xtrain = matrix(xtrain, ncol = 1)
ntrain = nrow(xtrain)
ytrain = rnorm(ntrain)
dd = data.frame(x = xtrain, y = ytrain)

m = bspline(y ~ .-1, data = dd, degree = 2, alpha = 0.03, smoothing = 0, knotspacing = 0)
print(m)

# xpred = seq(0, 1, by = 0.01)
# xpred = matrix(xpred, ncol = 1)
# ypred = bsplinepredict(m, xpred)

# plot(xpred, ypred, ylim = c(-2,2))
# points(xtrain, ytrain, cex = 3)

