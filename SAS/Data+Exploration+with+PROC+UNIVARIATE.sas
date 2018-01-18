
proc univariate data = sashelp.shoes;
var sales;
run;

proc univariate data = sashelp.shoes;
var sales;
class region; /*grouped by region*/
run;

ods select Quantiles;
proc univariate data = sashelp.shoes;
var sales;
class region;
run;

/*The ODS OUTPUT tells SAS to write the extreme values information to a dataset named outlier.*/

/* 
ods output extremeobs = outlier;
proc univariate data = sashelp.shoes;
var sales;
class region;
run;
ods output close; */
# Checking Normality

Most of the statistical techniques assumes data should be normally distributed. It is important to check this assumption before running a model using
Plot Histogram and see the distribution
Calculate Skewness
Normality Tests
proc univariate data=sashelp.shoes NOPRINT;
var sales;
HISTOGRAM / NORMAL (COLOR=RED);
run;

ods select TestsforNormality;
proc univariate data = sashelp.shoes normal;
var sales;
run;

/* Shapiro Wilk Test [Sample Size <= 2000] null hypothesis - distribution is normal */
/* Kolmogorov-Smirnov Test [Sample Size > 2000]  null hypothesis - distribution is normal */
/* Anderson-Darling test rejects the hypothesis of normality when the p-value is less than or equal to 0.05 */
/*  alternative to the chi-square and Kolmogorov-Smirnov goodness-of-fit tests */
/* Test Statistic:	The Anderson-Darling test statistic is defined as
A2=−N−S
where
S=∑((2i−1)/N)[lnF(Yi)+ln(1−F(Yn+1−i))] :i = 1 to N, Yn+1 = Y(N+1)
F is the cumulative distribution function of the specified distribution. Note that the Yi are the ordered data. */

/*  Cramér–von Mises criterion is a criterion used for judging the goodness of fit of a cumulative distribution function {\displaystyle F^{*}} F^{*} compared to a given empirical distribution function F_{n} F_{n}, or for comparing two empirical distributions. 
 It is also used as a part of other algorithms, such as minimum distance estimation. ) */

proc univariate data = sashelp.shoes noprint;
var sales;
output out = temp
pctlpts = 10 to 100 by 10 pctlpre = p_; /*  custome percentiles 8/
run;

proc univariate data=sashelp.shoes PLOT;
var sales;
run;

ods select winsorizedmeans;
ods output winsorizedmeans=means;
proc univariate winsorized = 0.2 data=sashelp.shoes;
var sales;
run;

ods select trimmedmeans;
ods output trimmedmeans=means;
proc univariate trimmed = 0.2 data=sashelp.shoes;
var sales;
run;

/*  Calculate Sample T-test */
ods select TestsForLocation;
proc univariate data=sashelp.shoes;
var sales;
run;
