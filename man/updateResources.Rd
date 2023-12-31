\name{updateResources}
\alias{updateResources}

\alias{runRecipes}
\alias{runRecipes,AnnotationHubMetadata-method}
\alias{pushResources}
\alias{pushMetadata}


\title{updateResources}

\description{
  Add new resources to AnnotationHub
}

\usage{
updateResources(AnnotationHubRoot, BiocVersion = BiocManager::version(),
                preparerClasses = getImportPreparerClasses(),
                metadataOnly = TRUE, insert = FALSE,
                justRunUnitTest = FALSE, ...)

pushResources(allAhms, uploadToRemote = TRUE, download = TRUE)

pushMetadata(allAhms, url)
}

\arguments{
  \item{AnnotationHubRoot}{
    Local path where files will be downloaded.
  }
  \item{BiocVersion}{
    A \code{character(1)} Bioconductor version. The resource will be available
    in Bioconductor >= to this version. Default value is the current version,
    specified with BiocManager::version().
  }
  \item{preparerClasses}{
    One of the \code{ImportPreparer} subclasses defined in
    \code{getImportPreparer()}. This class is used for dispatch during
    data discovery.
  }
  \item{metadataOnly}{
    A \code{logical} to specify the processing of metadata only or both
    metadata and data files.

    When FALSE, metadata are generated and data files are downloaded,
    processed and pushed to their final location in S3 buckets.
    \code{metadata = TRUE} produces only metadata and is useful for
    testing.
  }
  \item{insert}{
    NOTE: This option is for inserting metadata records in the
    production data base (done by Bioconductor core team member) and
    is for internal use only.

    A \code{logical} to control if metadata are inserted in the AnnotationHub
    db. By default this option is FALSE which is a useful state in which
    to test a new recipe and confirm the metadata fields are correct.

    When \code{insert = TRUE}, the "AH_SERVER_POST_URL" global option must
    be set to the http location of the AnnotationHubServer in the global
    environment or .Rprofile. Additionally, azcopy command line tools
    must be installed on the local machine to push files to Azure buckets.
    See \link{upload_to_azure}.
  }
  \item{justRunUnitTest}{
    A \code{logical}. When TRUE, a small number of records (usually 5) are
    processed instead of all.
  }
  \item{allAhms}{
    List of \code{AnnotationHubMetadata} objects.
  }
  \item{url}{
    URL of AnnotationHub database where metadata will be inserted.
  }
  \item{uploadToRemote}{
    A \code{logical} indicating whether resources should be uploaded
    to remote bioconductor default location. Currently Azure Data Lakes.
  }
  \item{download}{
    A \code{logical} indicating whether resources should be downloaded from
    resource url.
  }
  \item{\dots}{
    Arguments passed to other methods such as \code{regex}, \code{baseUrl},
    \code{baseDir}.
  }
}

\details{
   \itemize{
     \item updateResources:

           \code{updateResources} is responsible for creating metadata records
           and downloading, processing and pushing data files to their final
           resting place. The \item{preparerClasses} argument is used in method
           dispatch to determine which recipe is used.

           By manipulating the \code{metadataOnly}, \code{insert} and
           \code{justRunUnitTest} arguments one can flexibly test the metadata
           for a small number of records with or without downloading and
           processing the data files.


      \item global options:

            When \code{insert = TRUE} the "AH_SERVER_POST_URL" option must be
            set to the https location of the AnnotationHub db.
  }
}

\value{
  A list of \code{AnnotationHubMetadata} objects.
}

\author{Martin Morgan, Marc Carlson}

\seealso{
  \itemize{
    \item \link{AnnotationHubMetadata}
    \item \link{upload_to_azure}
  }
}

\examples{

\dontrun{

## -----------------------------------------------------------------------
## Inspect metadata:
## -----------------------------------------------------------------------
## A useful first step in testing a new recipe is to generate and
## inspect a small number of metadata records. The combination of
## 'metadataOnly=TRUE', 'insert=FALSE' and 'justRunUnitTest=TRUE'
## generates metadata for the first 5 records and does not download or
## process any data.

meta <- updateResources("/local/path",
                        BiocVersion = "3.3",
                        preparerClasses = "EnsemblFastaImportPreparer",
                        metadataOnly = TRUE, insert = FALSE,
                        justRunUnitTest = TRUE,
                        release = "84")

INFO [2015-11-12 07:58:05] Preparer Class: EnsemblFastaImportPreparer
Ailuropoda_melanoleuca.ailMel1.cdna.all.fa.gz
Ailuropoda_melanoleuca.ailMel1.dna_rm.toplevel.fa.gz
Ailuropoda_melanoleuca.ailMel1.dna_sm.toplevel.fa.gz
Ailuropoda_melanoleuca.ailMel1.dna.toplevel.fa.gz
Ailuropoda_melanoleuca.ailMel1.ncrna.fa.gz

## The return value is a list of metadata for the first 5 records:

> names(meta)
[1] "FASTA cDNA sequence for Ailuropoda melanoleuca"
[2] "FASTA DNA sequence for Ailuropoda melanoleuca"
[3] "FASTA DNA sequence for Ailuropoda melanoleuca"
[4] "FASTA DNA sequence for Ailuropoda melanoleuca"
[5] "FASTA ncRNA sequence for Ailuropoda melanoleuca"


## Each record is of class AnnotationHubMetadata:

> class(meta[[1]])
[1] "AnnotationHubMetadata"
attr(,"package")
[1] "AnnotationHubData"

## -----------------------------------------------------------------------
## Insert metadata in the db and process/push data files:
## -----------------------------------------------------------------------
## This next code chunk creates the metadata and downloads and processes
## the data (metadataOnly=FALSE). If all files are successfully pushed to
## to their final resting place, metadata records are inserted in the 
## AnnotationHub db (insert=TRUE). Metadata insertion is done by a 
## Bioconductor team member; contact maintainer@bioconductor.org for help.

meta <- updateResources("local/path",
                        BiocVersion = "3.5",
                        preparerClasses = "EnsemblFastaImportPreparer",
                        metadataOnly = FALSE, insert = TRUE,
                        justRunUnitTest = FALSE,
                        regex = ".*release-81")

## -----------------------------------------------------------------------
## Recovery helpers:
## -----------------------------------------------------------------------

## pushResources() and pushMetadata() are both called from updateResources()
## but can be used solo for testing or completing a run that
## terminated unexpectedly.

## Download, process and push to azure the last 2 files in 'meta':
sub <- meta[length(meta) - 1:length(meta)]
pushResources(sub)

## Insert metadata in the AnotationHub db for the last 2 files in 'meta':

pushMetadata(sub, url = getOption("AH_SERVER_POST_URL"))
}

}

\keyword{methods}
