% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/MetaScope_ID.R
\name{metascope_id}
\alias{metascope_id}
\title{MetaScope ID}
\usage{
metascope_id(
  bam_file,
  aligner = "bowtie",
  out_file = paste(tools::file_path_sans_ext(bam_file), ".metascope_id.csv", sep = ""),
  EMconv = 1/10000,
  EMmaxIts = 25
)
}
\arguments{
\item{bam_file}{The .bam file that needs to be summarized, annotated, and
needs removal of ambiguity.}

\item{aligner}{The aligner which was used to create the bam file. Default is 
"bowtie" but can also be set to "subread" or "other"}

\item{out_file}{The name of the .csv output file. Defaults to the bam_file
basename plus ".metascope_id.csv".}

\item{EMconv}{The convergence parameter of the EM algorithm. Default set at
\code{1/10000}.}

\item{EMmaxIts}{The maximum number of EM iterations, regardless of whether
the EMconv is below the threshhold. Default set at \code{50}.
If set at \code{0}, the algorithm skips the EM step and summarizes the .bam
file 'as is'}
}
\value{
This function returns a .csv file with annotated read counts to genomes with
mapped reads. The function itself returns the output .csv file name.
}
\description{
This function will read in a .bam file, annotate the taxonomy and genome
names, reduce the mapping ambiguity using a mixture model, and output a
.csv file with the results. Currently, it assumes that the genome
library/.bam files use NCBI accession names for reference names (rnames in
.bam file).
}
\examples{
# Code not run
\donttest{
## Get a reference genome library
download_refseq('viruses', compress = FALSE)

## Make and align to a single a reference genome library
mk_subread_index('Viruses.fasta')
readPath <- system.file("extdata", "virus_example.fastq",
package = "MetaScope")
viral_map <- align_target(readPath, "Viruses", project_name = "virus_example")

#### Apply MetaScope ID:
metascope_id(viral_map)
}

}
