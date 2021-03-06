% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/bspline.R
\name{bspline}
\alias{bspline}
\title{Fit a B/P-spline to data.}
\usage{
bspline(x, y, data, degree, smoothing, alpha, knotspacing)
}
\arguments{
\item{x}{[\code{matrix(n,p)} | \code{formula}]\cr
Either matrix of X-inputs or formula for formula / dataframe interface.}

\item{y}{[\code{numeric(n)}]\cr
Y vector of outcomes.
Ignored in formula interface.}

\item{data}{[\code{data.frame}]\cr
Dataframe for formula interface, containing all variables.
Ignored in matrix interface.}

\item{degree}{[\code{integer(1)}]\cr
Degree of spline.}

\item{smoothing}{[\code{integer(1)}]\cr
Value of: 0 = none, 1 = identity, 2 = pspline.
Default is 1.}

\item{alpha}{[\code{numeric(1)}]\cr
Smoothing param.
Default is 1.}

\item{knotspacing}{[\code{integer(1)}]\cr
Value of: 0 = as points are sampled, 1 = equidistant.
Default is 0.}
}
\description{
blaaaaaaaaaaaaaaa
}
