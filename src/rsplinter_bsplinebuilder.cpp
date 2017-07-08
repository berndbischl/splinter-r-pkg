#include "bsplinebuilder.h"

namespace SPLINTER
{

/*
 * Build B-spline
 */
BSpline* BSpline::Builder::build2() const {
    // Check data
    // TODO: Remove this test
    if (!_data.isGridComplete())
        throw Exception("BSpline::Builder::build: Cannot create B-spline from irregular (incomplete) grid.");

    // Build knot vectors
    auto knotVectors = computeKnotVectors();

    // Build B-spline (with default coefficients)
    auto bspline = new BSpline(knotVectors, _degrees);

    // Compute coefficients from samples and update B-spline
    auto coefficients = computeCoefficients(*bspline);
    bspline->setCoefficients(coefficients);

    return bspline;
}

}
