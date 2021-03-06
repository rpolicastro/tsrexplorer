% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/getters.R
\name{get_diff_results}
\alias{get_diff_results}
\title{Get Differential TSS/TSR results}
\usage{
get_diff_results(experiment, data_type = c("tss", "tsr"), samples = "all")
}
\arguments{
\item{experiment}{TSRexploreR object.}

\item{data_type}{Either 'tss' or 'tsr'.}

\item{samples}{A vector of sample names to analyze.}
}
\value{
List of differential features data.frames.
}
\description{
Get the DESeq2 or edgeR differential features.
}
\examples{
data(TSSs)
sample_sheet <- data.frame(
  sample_name=c(
    sprintf("S288C_D_\%s", seq_len(3)),
    sprintf("S288C_WT_\%s", seq_len(3))
  ),
  file_1=rep(NA, 6), file_2=rep(NA, 6),
  condition=c(
    rep("Diamide", 3),
    rep("Untreated", 3)
  )
)

exp <- TSSs \%>\%
  tsr_explorer(sample_sheet=sample_sheet) \%>\%
  format_counts(data_type="tss") \%>\%
  fit_de_model(~condition, data_type="tss", method="edgeR") \%>\%
  differential_expression(
    data_type="tss",
    comparison_name="Diamide_vs_Untreated",
    comparison_type="coef",
    comparison=2
  )

dr <- get_diff_results(exp, data_type="tss")

}
