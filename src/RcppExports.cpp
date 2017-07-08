// Generated by using Rcpp::compileAttributes() -> do not edit by hand
// Generator token: 10BE3573-1514-4C36-9D1C-5A225CD40393

#include <Rcpp.h>

using namespace Rcpp;

// bsplinefit
SEXP bsplinefit(NumericMatrix xmat, NumericVector y, SEXP degree, SEXP alpha, SEXP smooth, SEXP knotspacing);
RcppExport SEXP splinter_bsplinefit(SEXP xmatSEXP, SEXP ySEXP, SEXP degreeSEXP, SEXP alphaSEXP, SEXP smoothSEXP, SEXP knotspacingSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< NumericMatrix >::type xmat(xmatSEXP);
    Rcpp::traits::input_parameter< NumericVector >::type y(ySEXP);
    Rcpp::traits::input_parameter< SEXP >::type degree(degreeSEXP);
    Rcpp::traits::input_parameter< SEXP >::type alpha(alphaSEXP);
    Rcpp::traits::input_parameter< SEXP >::type smooth(smoothSEXP);
    Rcpp::traits::input_parameter< SEXP >::type knotspacing(knotspacingSEXP);
    rcpp_result_gen = Rcpp::wrap(bsplinefit(xmat, y, degree, alpha, smooth, knotspacing));
    return rcpp_result_gen;
END_RCPP
}
// bsplinepredict
NumericVector bsplinepredict(SEXP model, NumericMatrix xmat);
RcppExport SEXP splinter_bsplinepredict(SEXP modelSEXP, SEXP xmatSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< SEXP >::type model(modelSEXP);
    Rcpp::traits::input_parameter< NumericMatrix >::type xmat(xmatSEXP);
    rcpp_result_gen = Rcpp::wrap(bsplinepredict(model, xmat));
    return rcpp_result_gen;
END_RCPP
}

static const R_CallMethodDef CallEntries[] = {
    {"splinter_bsplinefit", (DL_FUNC) &splinter_bsplinefit, 6},
    {"splinter_bsplinepredict", (DL_FUNC) &splinter_bsplinepredict, 2},
    {NULL, NULL, 0}
};

RcppExport void R_init_splinter(DllInfo *dll) {
    R_registerRoutines(dll, NULL, CallEntries, NULL, NULL);
    R_useDynamicSymbols(dll, FALSE);
}
