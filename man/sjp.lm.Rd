% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/sjPlotLinreg.R
\name{sjp.lm}
\alias{sjp.lm}
\title{Plot estimates, predictions or effects of linear models}
\usage{
sjp.lm(fit, type = "lm", vars = NULL, group.estimates = NULL,
  remove.estimates = NULL, sort.est = TRUE, poly.term = NULL,
  title = NULL, legend.title = NULL, axis.labels = NULL,
  axis.title = NULL, resp.label = NULL, geom.size = NULL,
  geom.colors = "Set1", point.alpha = 0.2, scatter.plot = TRUE,
  wrap.title = 50, wrap.labels = 25, axis.lim = NULL,
  grid.breaks = NULL, show.values = TRUE, show.p = TRUE, show.ci = TRUE,
  show.legend = FALSE, show.loess = FALSE, show.loess.ci = FALSE,
  show.summary = FALSE, digits = 2, vline.type = 2,
  vline.color = "grey70", coord.flip = TRUE, y.offset = 0.15,
  facet.grid = TRUE, complete.dgns = FALSE, prnt.plot = TRUE, ...)
}
\arguments{
\item{fit}{fitted linear regression model (of class \code{\link{lm}}, \code{\link[nlme]{gls}} or \code{plm}).}

\item{type}{type of plot. Use one of following:
\describe{
  \item{\code{"lm"}}{(default) for forest-plot like plot of estimates. If the fitted model only contains one predictor, intercept and slope are plotted.}
  \item{\code{"std"}}{for forest-plot like plot of standardized beta values. If the fitted model only contains one predictor, intercept and slope are plotted.}
  \item{\code{"std2"}}{for forest-plot like plot of standardized beta values, however, standardization is done by dividing by two sd (see 'Details'). If the fitted model only contains one predictor, intercept and slope are plotted.}
  \item{\code{"slope"}}{to plot regression lines for each single predictor of the fitted model, against the response (linear relationship between each model term and response).}
  \item{\code{"resid"}}{to plot regression lines for each single predictor of the fitted model, against the residuals (linear relationship between each model term and residuals). May be used for model diagnostics.}
  \item{\code{"pred"}}{to plot predicted values for the response, related to specific predictors. See 'Details'.}
  \item{\code{"eff"}}{to plot marginal effects of all terms in \code{fit}. Note that interaction terms are excluded from this plot; use \code{\link{sjp.int}} to plot effects of interaction terms.}
  \item{\code{"poly"}}{to plot predicted values (marginal effects) of polynomial terms in \code{fit}. Use \code{poly.term} to specify the polynomial term in the fitted model (see 'Examples').}
  \item{\code{"ma"}}{to check model assumptions. Note that only three arguments are relevant for this option \code{fit} and \code{complete.dgns}. All other arguments are ignored.}
  \item{\code{"vif"}}{to plot Variance Inflation Factors.}
}}

\item{vars}{numeric vector with column indices of selected variables or a character vector with
variable names of selected variables from the fitted model, which should be used to plot
estimates, fixed effects slopes (for \code{\link[lme4]{lmer}}) or probability or
incidents curves
(for \code{\link[lme4]{glmer}}) of random intercepts.}

\item{group.estimates}{numeric or character vector, indicating a group identifier for
each estimate. Dots and confidence intervals of estimates are coloured
according to their group association. See 'Examples'.}

\item{remove.estimates}{character vector with coefficient names that indicate
which estimates should be removed from the plot.
\code{remove.estimates = "est_name"} would remove the estimate \emph{est_name}. Default
is \code{NULL}, i.e. all estimates are printed.}

\item{sort.est}{logical, determines whether estimates should be sorted according to their values.
If \code{group.estimates} is \emph{not} \code{NULL}, estimates are sorted
according to their group assignment.}

\item{poly.term}{name of a polynomial term in \code{fit} as string. Needs to be
specified, if \code{type = "poly"}, in order to plot marginal effects
for polynomial terms. See 'Examples'.}

\item{title}{character vector, used as plot title. Depending on plot type and function,
will be set automatically. If \code{title = ""}, no title is printed.}

\item{legend.title}{character vector, used as title for the plot legend. Note that
only some plot types have legends (e.g. \code{type = "pred"} or when
grouping estimates with \code{group.estimates}).}

\item{axis.labels}{character vector with labels used as axis labels. Optional
argument, since in most cases, axis labels are set automatically.}

\item{axis.title}{character vector of length one or two (depending on
the plot function and type), used as title(s) for the x and y axis. 
If not specified, a default labelling  is chosen.}

\item{resp.label}{name of dependent variable, as string. Only 
used if fitted model has only one predictor and \code{type = "lm"}.}

\item{geom.size}{size resp. width of the geoms (bar width, line thickness or point size, 
depending on plot type and function). Note that bar and bin widths mostly 
need smaller values than dot sizes.}

\item{geom.colors}{user defined color palette for geoms. If \code{group.estimates}
is \emph{not} specified, must either be vector with two color values or a specific
color palette code (see 'Details' in \code{\link{sjp.grpfrq}}). Else, if
\code{group.estimates} is specified, \code{geom.colors} must be a vector
of same length as groups. See 'Examples'.}

\item{point.alpha}{alpha value of point-geoms in the scatter plots.}

\item{scatter.plot}{logical, if \code{TRUE} (default), a scatter plot of
response and predictor values for each predictor of the model
is plotted. Only applies for slope-type plots.}

\item{wrap.title}{numeric, determines how many chars of the plot title are displayed in
one line and when a line break is inserted.}

\item{wrap.labels}{numeric, determines how many chars of the value, variable or axis 
labels are displayed in one line and when a line break is inserted.}

\item{axis.lim}{numeric vector of length 2, defining the range of the plot axis.
Depending on plot type, may effect either x- or y-axis, or both.
For multiple plot outputs (e.g., from \code{type = "eff"} or 
\code{type = "slope"} in \code{\link{sjp.glm}}), \code{axis.lim} may
also be a list of vectors of length 2, defining axis limits for each
plot (only if non-faceted).}

\item{grid.breaks}{numeric; sets the distance between breaks for the axis, 
i.e. at every \code{grid.breaks}'th position a major grid is being printed.}

\item{show.values}{logical, whether values should be plotted or not.}

\item{show.p}{logical, adds significance levels to values, or value and 
variable labels.}

\item{show.ci}{logical, if \code{TRUE}, depending on \code{type}, a confidence
interval or region is added to the plot.}

\item{show.legend}{logical, if \code{TRUE}, and depending on plot type and
function, a legend is added to the plot.}

\item{show.loess}{logical, if \code{TRUE}, and depending on \code{type}, an 
additional loess-smoothed line is plotted.}

\item{show.loess.ci}{logical, if \code{TRUE}, a confidence region for the loess-smoothed line
will be plotted. Default is \code{FALSE}. Only applies, if \code{show.loess = TRUE}
(and for \code{\link{sjp.lmer}}, only applies if \code{type = "fe.slope"}
or \code{type = "fe.resid"}).}

\item{show.summary}{logical, if \code{TRUE}, a summary with model statistics 
is added to the plot.}

\item{digits}{numeric, amount of digits after decimal point when rounding estimates and values.}

\item{vline.type}{linetype of the vertical "zero point" line. Default is \code{2} (dashed line).}

\item{vline.color}{color of the vertical "zero point" line. Default value is \code{"grey70"}.}

\item{coord.flip}{logical, if \code{TRUE}, the x and y axis are swapped.}

\item{y.offset}{numeric, offset for text labels when their alignment is adjusted 
to the top/bottom of the geom (see \code{hjust} and \code{vjust}).}

\item{facet.grid}{\code{TRUE} to arrange the lay out of of multiple plots 
in a grid of an integrated single plot. This argument calls 
\code{\link[ggplot2]{facet_wrap}} or \code{\link[ggplot2]{facet_grid}}
to arrange plots. Use \code{\link{plot_grid}} to plot multiple plot-objects 
as an arranged grid with \code{\link[gridExtra]{grid.arrange}}.}

\item{complete.dgns}{logical, if \code{TRUE}, additional tests are performed. Default is \code{FALSE}
Only applies if \code{type = "ma"}.}

\item{prnt.plot}{logical, if \code{TRUE} (default), plots the results as graph. Use \code{FALSE} if you don't
want to plot any graphs. In either case, the ggplot-object will be returned as value.}

\item{...}{other arguments, passed down to the \code{\link[effects]{effect}} resp. 
\code{\link[effects]{allEffects}} function when \code{type = "eff"}.}
}
\value{
Depending on the \code{type}, in most cases (insisibily)
          returns the ggplot-object with the complete plot (\code{plot})
          as well as the data frame that was used for setting up the
          ggplot-object (\code{df}). For \code{type = "ma"}, an updated model
          with removed outliers is returned.
}
\description{
Depending on the \code{type}, this function plots coefficients (estimates)
               of linear regressions (including panel models fitted with the \code{plm}-function
               from the \pkg{plm}-package and generalized least squares models fitted with
               the \code{gls}-function from the \pkg{nlme}-package) with confidence 
               intervals as dot plot (forest plot),
               model assumptions for linear models or slopes and scatter plots for each single
               coefficient. See \code{type} for details.
}
\details{
\describe{
           \item{\code{type = "lm"}}{if fitted model only has one predictor, no 
                 forest plot is shown. Instead, a regression line with confidence 
                 interval (in blue) is plotted by default, and a loess-smoothed 
                 line without confidence interval (in red) can be added if argument 
                 \code{show.loess = TRUE}.}
           \item{\code{type = "std2"}}{plots standardized beta values, however, 
                 standardization follows Gelman's (2008) suggestion, rescaling the 
                 estimates by dividing them by two standard deviations instead of 
                 just one. Resulting coefficients are then directly comparable for 
                 untransformed binary predictors. This standardization uses the 
                 \code{\link[arm]{standardize}}-function from the \pkg{arm}-package.}
           \item{\code{type = "slope"}}{regression lines (slopes) with confidence 
                 intervals for each single predictor of the fitted model are plotted, 
                 i.e. all predictors of the fitted model are extracted and for each of
                 them, the linear relationship is plotted against the response variable.
                 Other predictors are omitted, so this plot type is intended to check
                 the linear relationship between a predictor and the response.}
           \item{\code{type = "resid"}}{is similar to the \code{type = "slope"} option, 
                 however, each predictor is plotted against the residuals
                 (instead of response).}
           \item{\code{type = "pred"}}{plots predicted values of the response, related
                 to specific model predictors. This plot type calls 
                 \code{\link[stats]{predict}(fit, newdata = model.frame, type = "response")} 
                 and requires the \code{vars} argument to select specific terms that should be 
                 used for the x-axis and - optional - as grouping factor. Hence, 
                 \code{vars} must be a character vector with the names of one or 
                 two model predictors. See 'Examples'.}
           \item{\code{type = "eff"}}{computes the marginal effects for all predictors, 
                 using the \code{\link[effects]{allEffects}} function. I.e. for each 
                 predictor, the predicted values towards the response are plotted, with 
                 all remaining co-variates set to the mean. Due to possible different 
                 scales of predictors, a faceted plot is printed (instead of plotting 
                 all lines in one plot).
                 You can pass further arguments down to \code{allEffects} for flexible
                 function call via the \code{...}-argument.}
           \item{\code{type = "poly"}}{plots the marginal effects of polynomial terms 
                 in \code{fit}, using the \code{\link[effects]{effect}} function, but 
                 only for a selected polynomial term, which is specified with \code{poly.term}.
                 This function helps undertanding the effect of polynomial terms by 
                 plotting the curvilinear relationships of response and quadratic, cubic etc. 
                 terms. This function accepts following argument.}
           \item{\code{type = "ma"}}{checks model assumptions. Please note that only 
                 three arguments are relevant: \code{fit} and \code{complete.dgns}. 
                 All other arguments are ignored.}
           \item{\code{type = "vif"}}{Variance Inflation Factors (check for multicollinearity) 
                 are plotted. As a rule of thumb, values below 5 are considered as good 
                 and indicate no multicollinearity, values between 5 and 10 may be tolerable.
                 Values greater than 10 are not acceptable and indicate multicollinearity
                 between model's predictors.}
           }
}
\examples{
# --------------------------------------------------
# plotting estimates of linear models as forest plot
# --------------------------------------------------
# fit linear model
fit <- lm(airquality$Ozone ~ airquality$Wind + airquality$Temp + airquality$Solar.R)

# plot estimates with CI
sjp.lm(fit, grid.breaks = 2)

# plot estimates with CI
# and with narrower tick marks
# (because "grid.breaks" was not specified)
sjp.lm(fit)

# ---------------------------------------------------
# plotting regression line of linear model (done
# automatically if fitted model has only 1 predictor)
# ---------------------------------------------------
library(sjmisc)
data(efc)
# fit model
fit <- lm(neg_c_7 ~ quol_5, data=efc)
# plot regression line with label strings
sjp.lm(fit, resp.label = "Burden of care",
       axis.labels = "Quality of life", show.loess = TRUE)

# --------------------------------------------------
# plotting regression lines of each single predictor
# of a fitted model
# --------------------------------------------------
library(sjmisc)
data(efc)
# fit model
fit <- lm(tot_sc_e ~ c12hour + e17age + e42dep, data=efc)

# reression line and scatter plot
sjp.lm(fit, type = "slope")

# reression line w/o scatter plot
sjp.lm(fit, type = "slope", scatter.plot = FALSE)

# --------------------------
# plotting model assumptions
# --------------------------
sjp.lm(fit, type = "ma")

\dontrun{
# --------------------------
# grouping estimates
# --------------------------
library(sjmisc)
data(efc)
fit <- lm(barthtot ~ c160age + e17age + c12hour + e16sex + c161sex + c172code,
          data = efc)

# order estimates according to coefficient's order
sjp.lm(fit, group.estimates = c(1, 1, 2, 3, 3, 4),
       geom.colors = c("green", "red", "blue", "grey"), sort.est = FALSE)

fit <- lm(barthtot ~ c160age + c12hour + e17age+ c161sex + c172code + e16sex,
          data = efc)

# force order of estimates according to group assignment
sjp.lm(fit, group.estimates = c(1, 2, 1, 3, 4, 3),
       geom.colors = c("green", "red", "blue", "grey"), sort.est = TRUE)

# --------------------------
# predicted values for response
# --------------------------
library(sjmisc)
data(efc)
efc$education <- to_label(to_factor(efc$c172code))
fit <- lm(barthtot ~ c160age + c12hour + e17age+ education,
          data = efc)

sjp.lm(fit, type = "pred", vars = "c160age")

# with loess
sjp.lm(fit, type = "pred", vars = "e17age", show.loess = TRUE)

# grouped
sjp.lm(fit, type = "pred", vars = c("c12hour", "education"))

# grouped, non-facet
sjp.lm(fit, type = "pred", vars = c("c12hour", "education"),
       facet.grid = FALSE)

# --------------------------
# plotting polynomial terms
# --------------------------
library(sjmisc)
data(efc)
# fit sample model
fit <- lm(tot_sc_e ~ c12hour + e17age + e42dep, data = efc)
# "e17age" does not seem to be linear correlated to response
# try to find appropiate polynomial. Grey line (loess smoothed)
# indicates best fit. Looks like x^3 has a good fit.
# (not checked for significance yet).
sjp.poly(fit, "e17age", 2:4, scatter.plot = FALSE)
# fit new model
fit <- lm(tot_sc_e ~ c12hour + e42dep +
          e17age + I(e17age^2) + I(e17age^3),
          data = efc)
# plot marginal effects of polynomial term
sjp.lm(fit, type = "poly", poly.term = "e17age")

library(splines)
# fit new model with "splines"-package, "bs"
fit <- lm(tot_sc_e ~ c12hour + e42dep + bs(e17age, 3), data = efc)
# plot marginal effects of polynomial term, same call as above
sjp.lm(fit, type = "poly", poly.term = "e17age")}

}
\references{
Gelman A (2008) "Scaling regression inputs by dividing by two standard deviations." \emph{Statistics in Medicine 27: 2865–2873.} \url{http://www.stat.columbia.edu/~gelman/research/published/standardizing7.pdf}
            \cr \cr
            Hyndman RJ, Athanasopoulos G (2013) "Forecasting: principles and practice." OTexts; accessed from \url{https://www.otexts.org/fpp/5/4}.
}
\seealso{
\href{http://www.strengejacke.de/sjPlot/sjp.lm}{sjPlot manual: sjp.lm} for
           more details and examples of this function; use \code{\link{sjp.poly}}
           to see which polynomial degree fits best for possible polynomial terms.
}

