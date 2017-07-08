# Splinter R package

[![Build Status](https://travis-ci.org/berndbischl/splinter-r-pkg.svg?branch=master)](https://travis-ci.org/berndbischl/splinter-r-pkg)
[![Coverage Status](https://img.shields.io/coveralls/berndbischl/splinter-r-pkg.svg)](https://coveralls.io/r/berndbischl/splinter-r-pkg?branch=master)

R package to make the [SPLINTER](https://github.com/bgrimstad/splinter) library available to R users.

SPLINTER (SPLine INTERpolation) is a library for multivariate function approximation with splines. The library can be used for function approximation, regression, data smoothing, data reduction, and much more. Spline approximations are represented by a speedy C++ implementation of the tensor product B-spline.

The B-spline consists of piecewise polynomial basis functions, offering a high flexibility and smoothness. The B-spline can be fitted to data using ordinary least squares (OLS), possibly with regularization. The library also offers construction of penalized splines (P-splines).

Please refer to the official [SPLINTER](https://github.com/bgrimstad/splinter) page for more detailed information regarding:

* General docs
* Licence information
* Citation info


## Technical setup

* The Splinter lib was copied to the "src" dir, excluding "Eigen"
* Makevars needed to be configured with "PKG_CPPFLAGS" to define include dirs
* All new C++ and RCPP files are under "src/rsplinter*"
* A checkmate stub file was created under src/rsplinter_checkmate_stub.cpp, to allow arg check on
  the C++ side (but we dont really use this now) 
* I am linking vs RcppEigen. That works, but I had to locally fix a line of code in SPLINTER.
  Issue is here: 
  https://github.com/bgrimstad/splinter/issues/88



