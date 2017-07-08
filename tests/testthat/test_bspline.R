context("bspline")

test_that("bspline", {

  xtrain = seq(0, 1, by = 0.2)
  xtrain = matrix(xtrain, ncol = 1)
  ntrain = nrow(xtrain)
  ytrain = 1:ntrain

  m = bsplinefit(xtrain, ytrain, degree = 1)

  ypred = bsplinepredict(m, xpred)
  expect_equal(ypred, ytrain)
})
