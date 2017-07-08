#' @title Fit a B/P-spline to data.
#'
#' @description
#' blaaaaaaaaaaaaaaa
#'
#' @param xmat [\code{matrix(n,p)}]\cr
#'   Matrix of inputs
#' @param y [\code{numeric(n)}]\cr
#'   Y vector of outcomes.
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
  assertChoice(smoothing, 0:2)
  assertChoice(knotspacing, 0:2)
  UseMethod("bspline")
}

#' @export
bspline.matrix = function(x, y, data, degree, smoothing, alpha, knotspacing) {
  bsplinefit(x, y, degree, smoothing, alpha, knotspacing)
}

