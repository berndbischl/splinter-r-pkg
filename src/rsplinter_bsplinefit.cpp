#include <Rcpp.h>
#include <vector>
#include <checkmate.h>                                                                            
#include "datatable.h"                                                                             
#include "bspline.h"
#include "bsplinebuilder.h"
#include "utilities.h"

using namespace Rcpp;
using namespace SPLINTER;                                                                                
using namespace std;


// [[Rcpp::export]]
SEXP bsplinefit(NumericMatrix xmat, NumericVector y, SEXP degree, SEXP alpha, 
    SEXP smooth, SEXP knotspacing) {
  
  
  qassert(xmat, "M", "xmat");
  qassert(y, "N+", "y");
  qassert(degree, "X1", "degree");
  int degree2 = as<int>(degree);
  qassert(alpha, "N1[0,)", "alpha");
  double alpha2 = as<double>(alpha);
  qassert(smooth, "X1[0,2]", "smooth");
  int smooth2 = as<int>(smooth);
  qassert(knotspacing, "X1[0,2]", "knotspacing");
  int knotspacing2 = as<int>(knotspacing);

  BSpline::Smoothing s;
  switch(smooth2) {
    case 0: s = BSpline::Smoothing::NONE; break;
    case 1: s = BSpline::Smoothing::IDENTITY; break;
    case 2: s = BSpline::Smoothing::PSPLINE; break;
  }
 
  BSpline::KnotSpacing ks;
  switch(knotspacing2) {
    case 0: ks = BSpline::KnotSpacing::AS_SAMPLED; break;
    case 1: ks = BSpline::KnotSpacing::EQUIDISTANT; break;
    case 2: ks = BSpline::KnotSpacing::EXPERIMENTAL; break;
  }
 
  DataTable dt;                                                                                   
  for (int i=0; i<xmat.nrow(); i++) {                                                                         
    DenseVector x(xmat.ncol());                                                                                    
    for (int j=0; j<xmat.ncol(); j++) {                                                                      
      x(j) = xmat(i, j); 
    }              
    dt.addSample(x, y(i));                                                                      
  }                                       

  BSpline *model = BSpline::Builder(dt)
    .degree(degree2)
    .knotSpacing(ks)
    .smoothing(s)                                                      
    .alpha(alpha2)
    .build2();  
  Rcpp::XPtr<BSpline> res2(model); 
  return res2;
}

// [[Rcpp::export]]
NumericVector bsplinepredict(SEXP model, NumericMatrix xmat) {
  NumericVector yhat(xmat.nrow());                                                                                 
  XPtr<BSpline> bsptr(model);
  
  for (int i=0; i<xmat.nrow(); i++) {                                                                         
    DenseVector x(xmat.ncol());                                                                                    
    for (int j=0; j<xmat.ncol(); j++) {                                                                      
      x(j) = xmat(i, j); 
    }              
    yhat(i) = bsptr->eval(x);
  }                                                                                                    
  return yhat;
}




