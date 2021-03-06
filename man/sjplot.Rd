% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/sjplot.R
\name{sjplot}
\alias{sjplot}
\alias{sjtab}
\title{Wrapper to create plots and tables within a pipe-workflow}
\usage{
sjplot(.data, ..., fun = c("frq", "grpfrq", "xtab", "gpt", "scatter", "aov1"))

sjtab(.data, ..., fun = c("frq", "xtab", "grpmean"))
}
\arguments{
\item{.data}{A data frame.}

\item{...}{Names of variables that should be plotted, and also further 
arguments passed down to the \pkg{sjPlot}-functions. See 'Examples'.}

\item{fun}{Plotting function. Refers to the function name of \pkg{sjPlot}-functions.
See 'Details' and 'Examples'.}
}
\value{
An object of class \code{ggplot}.
}
\description{
This function has a pipe-friendly argument-structure, with the
             first argument always being the data, followed by variables that
             should be plotted or printed as table. The function then transforms 
             the input and calls the requested sjp.xy- resp. sjt.xy-function 
             to create a plot or table.
}
\details{
Following \code{fun}-values are currently supported:
         \describe{
            \item{\code{"frq"}}{calls \code{\link{sjp.frq}} or \code{\link{sjt.frq}}.
            If \code{.data} has more than one variable, a plot for each 
            variable in \code{.data} is plotted.
            }
            \item{\code{"grpfrq"}}{calls \code{\link{sjp.grpfrq}}. The first 
            two variables in \code{.data} are used (and required) to create the plot.
            }
            \item{\code{"xtab"}}{calls \code{\link{sjp.xtab}} or \code{\link{sjt.xtab}}.
            The first two variables in \code{.data} are used (and required) 
            to create the plot or table.
            }
            \item{\code{"grpmean"}}{calls \code{\link{sjt.grpmean}}.
            The first two variables in \code{.data} are used (and required) 
            to create the table.
            }
            \item{\code{"gpt"}}{calls \code{\link{sjp.gpt}}. The first 
            three variables in \code{.data} are used (and required) to create the plot.
            }
            \item{\code{"scatter"}}{calls \code{\link{sjp.scatter}}. The first 
            two variables in \code{.data} are used (and required) to create the plot;
            if \code{.data} also has a third variable, this is used as grouping-
            variable in \code{sjp.scatter}.
            }
            \item{\code{"aov1"}}{calls \code{\link{sjp.aov1}}. The first 
            two variables in \code{.data} are used (and required) to create the plot.
            }
         }
}
\note{
The \code{...}-argument is used, first, to specify the variables from \code{.data}
      that should be plotted, and, second, to name further arguments that are
      used in the subsequent plotting functions. Refer to the online-help of
      supported plotting-functions to see valid arguments.
      \cr \cr
      Following functions can already be used in a pipe-workflow, because their
      first argument is a data frame: \code{\link{sjp.chi2}}, \code{\link{sjp.corr}},
      \code{\link{sjp.likert}}, \code{\link{sjp.pca}}, \code{\link{sjp.stackfrq}},
      \code{\link{sjt.corr}}, \code{\link{sjt.df}}, \code{\link{sjt.frq}},
      \code{\link{sjt.itemanalysis}}, \code{\link{sjt.pca}}, 
      \code{\link{sjt.stackfrq}}, \code{\link{view_df}}.
}
\examples{
library(sjmisc)
library(dplyr)
data(efc)

# Frequency plot
sjplot(efc, e42dep, c172code, fun = "frq")

# Grouped frequencies
efc \%>\% sjplot(e42dep, c172code, fun = "grpfrq")

# Grouped frequencies, as box plots
efc \%>\% sjplot(e17age, c172code, fun = "grpfrq", 
               type = "box", geom.colors = "Set1")

# scatter plot, grouped
efc \%>\% 
  select(e42dep, c172code, c161sex) \%>\% 
  sjplot(fun = "scatter")

# frequencies, as plot grid
efc \%>\% 
  select(e42dep, c172code, e16sex, c161sex) \%>\% 
  sjplot() \%>\% 
  plot_grid()

}

