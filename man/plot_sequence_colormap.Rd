% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/motif.R
\name{plot_sequence_colormap}
\alias{plot_sequence_colormap}
\title{Plot Sequence Color Map}
\usage{
plot_sequence_colormap(
  experiment,
  samples = "all",
  genome_assembly = NULL,
  threshold = NULL,
  use_normalized = FALSE,
  distance = 10,
  dominant = FALSE,
  data_conditions = NULL,
  ncol = 1,
  base_colors = c(A = "#109649", C = "#255C99", G = "#F7B32C", T = "#D62839"),
  font_size = 6,
  rasterize = FALSE,
  raster_dpi = 150,
  ...
)
}
\arguments{
\item{experiment}{TSRexploreR object.}

\item{samples}{A vector of sample names to analyze.}

\item{genome_assembly}{Genome assembly in FASTA or BSgenome format.}

\item{threshold}{TSSs or TSRs with a score below this value will not be considered.}

\item{use_normalized}{Whether to use the normalized (TRUE) or raw (FALSE) counts.}

\item{distance}{Bases to add on each side of each TSS.}

\item{dominant}{If TRUE, will only consider the highest-scoring TSS per gene, transcript, or TSR or 
highest-scoring TSR per gene or transcript.}

\item{data_conditions}{Apply advanced conditions to the data.}

\item{ncol}{Integer specifying the number of columns to arrange multiple plots.}

\item{base_colors}{Named vector specifying colors for each base.}

\item{font_size}{Size of text for plots.}

\item{rasterize}{Rasterize a ggplot.}

\item{raster_dpi}{If rasterization is set, this controls the rasterization DPI.}

\item{...}{Arguments passed to geom_tile.}
}
\value{
ggplot2 object of sequence colormap.
}
\description{
Make a color map for the sequences around TSSs.
}
\details{
This plotting function generates a ggplot2 base color map for the sequences
around TSSs. Color maps represent each base surrounding a TSS as a different color.
Since the base composition for every TSS region can be seen in one plot, it's a good
  companion for sequence logos.

The color of each base is set using the 'base_colors' argument.
The argument input should be a named vector, with the base as the name,
and the desired color of the base as the vector element.

'genome_assembly' must be a valid genome assembly in either fasta or BSgenome format.
fasta formatted genome assemblies should have the file extension '.fasta' or '.fa'.
BSgenome assemblies are precompiled Bioconductor libraries for common organisms.

'distance' controls the length upstream and downstream of the TSS
  from which the sequence will be retrieved.

A set of functions to control data structure for plotting are included.
'threshold' will define the minimum number of reads a TSS or TSR
 must have to be considered.
'dominant' specifies whether only the dominant TSS or TSR is considered 
  from the 'mark_dominant' function.
For TSSs this can be either dominant per TSR or gene, and for TSRs
  it is just the dominant TSR per gene.
'data_conditions' allows for the advanced filtering, ordering, and grouping
  of data.

The plot can be rasterized using ggrastr using 'rasterize',
  and the rasterization DPI set using 'raster_dpi'.
}
\examples{
data(TSSs_reduced)
assembly <- system.file("extdata", "S288C_Assembly.fasta", package="TSRexploreR")

exp <- TSSs_reduced \%>\%
  tsr_explorer(genome_assembly=assembly) \%>\%
  format_counts(data_type="tss")

p <- plot_sequence_colormap(exp, distance=5)

}
\seealso{
\code{\link{plot_sequence_logo}} to plot a sequence logo.
}
