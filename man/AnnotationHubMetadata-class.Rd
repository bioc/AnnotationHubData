\name{AnnotationHubMetadata-class}
\docType{class}

% Class:
\alias{class:HubMetadata}
\alias{HubMetadata-class}
\alias{HubMetadata}
\alias{class:AnnotationHubMetadata}
\alias{AnnotationHubMetadata-class}
\alias{AnnotationHubMetadata}

% Constructors:
\alias{AnnotationHubMetadata}

% Accessors:
\alias{metadata}
\alias{metadata,HubMetadata-method}
\alias{metadata<-}
\alias{metadata<-,HubMetadata,list-method}
\alias{inputFiles}
\alias{inputFiles,HubMetadata-method}
\alias{outputFile}
\alias{outputFile,HubMetadata-method}
\alias{recipeName}
\alias{recipeName,HubMetadata-method}
\alias{hubError}
\alias{hubError,list-method}
\alias{hubError,HubMetadata-method}
\alias{hubError<-}
\alias{hubError<-,list,character-method}
\alias{hubError<-,HubMetadata,character-method}

% Methods:
\alias{run}
\alias{run,AnnotationHubMetadata-method}

% Other:
\alias{HubMetadataFromJson}
\alias{toJson}
\alias{constructSeqInfo}
\alias{ahmToJson}
\alias{deleteResources}
\alias{getImportPreparerClasses}
\alias{makeAnnotationHubResource}

% Show:
\alias{show}
\alias{show,HubMetadata-method}


\title{Class \code{"AnnotationHubMetadata"} and methods}

\description{

  \code{AnnotationHubMetadata} is used to represent record(s) in the
  server data base.

}

\section{Objects from the Class}{

  Objects can be created by calls to the constructor,
  \code{AnnotationHubMetadata()}.

}

\usage{
AnnotationHubMetadata(AnnotationHubRoot, SourceUrl, SourceType,
		 SourceVersion, SourceLastModifiedDate, SourceMd5 =
		 NA_character_, SourceSize, DataProvider, Title,
		 Description, Species, TaxonomyId, Genome, Tags,
		 Recipe, RDataClass, RDataDateAdded, RDataPath,
		 Maintainer, ..., BiocVersion = BiocManager::version(),
		 Coordinate_1_based = TRUE, Notes = NA_character_,
		 DispatchClass, Location_Prefix =
		 "https://bioconductorhubs.blob.core.windows.net/annotationhub/")

toJson(x)
constructSeqInfo(species, genome)

metadata(x, ...)
hubError(x)
inputFiles(object, ...)
outputFile(object)
ahmToJson(ahm)
deleteResources(id)
getImportPreparerClasses()
makeAnnotationHubResource(objName, makeAnnotationHubMetadataFunction,
			  ..., where)
}

\arguments{
    \item{AnnotationHubRoot}{
      \code{character(1)} Absolute path to directory structure
      containing resources to be added to AnnotationHub. Internal use only.
    }
    \item{SourceUrl}{
      \code{character()} URL of original resource(s).
    }
    \item{SourceType}{
      \code{character()} Form of original data, e.g., BED, FASTA,
    etc. \code{getValidSourceTypes()} list currently acceptable
    values. If nothing seems appropiate for your data reach out to
    maintainer@bioconductor.org.

    }
    \item{SourceVersion}{
      \code{character(1)} Version of original file.
    }
    \item{SourceLastModifiedDate}{
      \code{POSIXct()} The date when the source was last modified.
    }
    \item{SourceMd5}{
      \code{character()} md5 hash of original file.
    }
    \item{SourceSize}{
      \code{numeric(1)} Size of original file in bytes.
    }
    \item{DataProvider}{
      \code{character(1)} Provider of original data, e.g., NCBI,
      UniProt etc.
    }
    \item{Title}{
      \code{character(1)} Title for the resource with version or genome
      build as appropriate.
    }
    \item{Description}{
      \code{character(1)} Description of the resource. May include
      details such as data type, format, study origin, sequencing
      technology, treated vs control, number of samples etc.
    }
    \item{Species}{
      \code{character(1)} Species name. For help on valid
	species see \code{getSpeciesList, validSpecies, or suggestSpecies.}

    }
    \item{TaxonomyId}{
      \code{character(1)}  NCBI code. There are
	checks for valid taxonomyId given the Species which produce
	warnings. See GenomeInfoDb::loadTaxonomyDb() for full validation
	table.

    }
    \item{Genome}{
      \code{character(1)} Name of genome build.
    }
    \item{Tags}{
      \code{character()} Free-form tags that serve as search terms.
    }
    \item{Recipe}{
      \code{character(1)} Name of recipe function. Only applicable to
      recipes created by the Bioconductor core team and included in
      AnnotationHubData base code.
    }
    \item{RDataClass}{
      \code{character()} Class of derived R object, e.g., GRanges. Length
      must match the length of \code{RDataPath}.
    }
    \item{RDataDateAdded}{
      \code{POSIXct()} Date resource was added to AnnotationHub. The
      default is today's date and is auto-generated when metadata are
      constructed. Resources will appear in snapshots with a date greater
      than or equal to the \code{RDataDateAdded}.
    }
    \item{RDataPath}{
      \code{character()} File path to where object is stored in AWS S3
      bucket or on the web.This field should be the
	      remainder of the path to the resource. The
	      \code{Location_Prefix} will be prepended to
	      \code{RDataPath} for the full path to the resource.
	      If the resource is stored in Bioconductor's AWS S3
	      buckets, it should start with the name of the package associated
	      with the metadata and should not start with a leading
	      slash. It should include the resource file name. For
	      strongly associated files, like a bam file and its index
	      file, the two files should be separates with a colon
	      \code{:}. This will link a single hub id with the multiple files.

    }
    \item{Maintainer}{
      \code{character(1)} Maintainer name and email address,
      \sQuote{A Maintainer \url{a.maintainer@email.com}}
    }
    \item{BiocVersion}{\code{character(1)}. The first Bioconductor version
      the resource was made available for. Unless removed from the hub, the
      resource will be available for all versions greater than or equal to this
      field.
    }
    \item{Coordinate_1_based}{
      \code{logical(1)} Do coordinates start with 1 or 0?
    }
    \item{DispatchClass}{
      \code{character(1)}. Determines how data are loaded into R. The value for
      this field should be \sQuote{Rda} if the data were serialized with
      \code{save()} and \sQuote{Rds} if serialized with \code{saveRDS}. The
      filename should have the appropriate \sQuote{rda} or \sQuote{rds}
      extension.

      A number of dispatch classes are pre-defined in
      AnnotationHub/R/AnnotationHubResource-class.R with the suffix
      \sQuote{Resource}. For example, if you have sqlite files, the
      AnnotationHubResource-class.R defines SQLiteFileResource so the
      DispatchClass would be SQLiteFile. Contact maintainer@bioconductor.org if
      you are not sure which class to use. The function
	      \code{AnnotationHub::DispatchClassList()} will output a
	      matrix of currently implemented DispatchClass and brief
	      description of utility. If a predefine class does not seem
	      appropriate contact maintainer@bioconductor.org.

    }
    \item{Location_Prefix}{
      \code{character(1)} URL location of AWS S3 bucket or web site where
      resource is located.
    }
    \item{Notes}{
      \code{character()} Notes about the resource.
    }
    \item{ahm}{
      An instance of class \code{AnnotationHubMetadata}.
    }
    \item{x}{
      An instance of class \code{AnnotationHubMetadata}.
    }
    \item{object}{
      An \code{AnnotationHubRecipe} instance.
    }
    \item{species}{
      \code{character(1)} The organism, e.g., "Homo sapiens".
    }
    \item{genome}{
      \code{character(1)} The genome build, e.g., "hg19".
    }
    \item{id}{
      An id whose DB record is to be fully deleted.
    }
    \item{objName}{
      \code{character(1)} The name of the PreparerClass used for dispatch.
    }
    \item{makeAnnotationHubMetadataFunction}{
      \code{function} Function (name) that makes \code{AnnotationHubMetadata}
      objects from the resource(s).
    }
    \item{where}{
      Environment where function definition is defined. Default value
      is sufficient.
    }
    \item{\dots}{
      Additional arguments passed to methods.
    }
}

\value{
  \code{AnnotationHubMetadata} returns an instance of the class.

  \code{jsonPath} returns a \code{character(1))} representation of the
  full path to the location of the \code{json} file associated with this
  record.

  \code{toJson} returns the JSON representation of the record.

  \code{fromJson} retuns an instance of the class, as parsed from the
  JSON file.
}

\author{Dan Tenenbaum and Marc Carlson}


\examples{
getClass("AnnotationHubMetadata")
}

\keyword{classes}
