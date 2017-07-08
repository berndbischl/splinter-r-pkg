#' @title Fit a B/P-spline to data.
#'
#' @description
#' blaaaaaaaaaaaaaaa
#'
#' @param x [\code{matrix(n,p)} | \code{formula}]\cr
#'   Either matrix of X-inputs or formula for formula / dataframe interface.
#' @param y [\code{numeric(n)}]\cr
#'   Y vector of outcomes.
#'   Ignored in formula interface.
#' @param data [\code{data.frame}]\cr
#'   Dataframe for formula interface, containing all variables.
#'   Ignored in matrix interface.
#' @param degree [\code{integer(1)}]\cr
#'   Degree of spline.
#' @param smoothing [\code{integer(1)}]\cr
#'   Value of: 0 = none, 1 = identity, 2 = pspline.
#'   Default is 1.
#' @param alpha [\code{numeric(1)}]\cr
#'   Smoothing param.
#'   Default is 1.
#' @param knotspacing [\code{integer(1)}]\cr
#'   Value of: 0 = as points are sampled, 1 = equidistant.
#'   Default is 0.
#' @export
bspline = function(x, y, data, degree, smoothing, alpha, knotspacing) {
  degree = asInt(degree, lower = 1)
  assertChoice(smoothing, 0:2)
  assertNumber(alpha, lower = 0)
  assertChoice(knotspacing, 0:2)
  UseMethod("bspline")
}

#' @export
bspline.matrix = function(x, y, data, degree, smoothing, alpha, knotspacing) {
  assertNumeric(y, na.ok = FALSE, len = nrow(x)) 
  bsplinefit(x, y, degree, smoothing, alpha, knotspacing)
}

#' @export
bspline.formula = function(x, y, data, degree, smoothing, alpha, knotspacing) {
  assertDataFrame(data) 
  mf = model.frame(x, data = data)
  y = model.response(mf)
  mm = model.matrix(x, data = mf)
  bsplinefit(mm, y, degree, smoothing, alpha, knotspacing)
}

