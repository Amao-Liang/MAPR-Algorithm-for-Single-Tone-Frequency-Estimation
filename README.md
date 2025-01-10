# MAPR Algorithm for Single-Tone Frequency Estimation
 ## Abstract
 Based on a novel extension scheme to autocorrelation with higher lags, this paper devises an unbiased and nearly-optimal estimator for a single real sinusoid in white noise. Specifically, the new autocorrelation functions are utilized to construct a univariate polynomial equation parameterized by the frequency. By comparing all roots of the polynomial equation with the cosine of a coarse estimate, the root corresponding to the sinusoidal frequency can be determined. The frequency variance is derived, which is then employed to find the optimal lag of autocorrelation for attaining the minimum mean square frequency error. Computer simulations are provided to corroborate the theoretical development and contrast with several existing estimators as well as the Cramér–Rao lower bound.
 ## Instruction
 First run the ‘precompute_Chebyshev’ programme to precompute and store the coefficients of the polynomials. Because all these coefficients are fixed constants, there is no need to recalculate them again and again during the procedure of the MAPR algorithm. 
 
 Then run the ‘simple_test’ programme and the results of the MAPR estimator will be printed. Please feel free to try multiple different sets of parameters.
 ## Corresponding Reference
 H.-C. Liang and H. C. So, ``Single-tone frequency estimation using modified autocorrelation and polynomial root-finding,'' Signal Processing, vol. 33, no. 9, pp. 1521-1534, Apr. 2025.

