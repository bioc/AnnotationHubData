
################################################################################
## Tests to just see if we can run all of our recipes

.recipeSetup <- function(){
    require(RUnit)              ## just for convenience
    require(AnnotationHubData)  ## just for convenience
    ahroot <- "/var/FastRWeb/web"
    BiocVersion <- c("3.1")      
}
ahroot <- "/var/FastRWeb/web"
BiocVersion <- c("3.1")      

test_HaemCodeImportPreparer_recipe <- function() {
    .recipeSetup()

    ahms = updateResources(ahroot, BiocVersion,
      preparerClasses = "HaemCodeImportPreparer",
      insert = FALSE, metadataOnly=TRUE, justRunUnitTest=TRUE)    
    checkTrue(class(ahms[[1]])=="AnnotationHubMetadata")
}

test_BioPaxImportPreparer_recipe <- function() {
    .recipeSetup()
    ahms = updateResources(ahroot, BiocVersion,
      preparerClasses = "BioPaxImportPreparer",
      insert = FALSE, metadataOnly=TRUE, justRunUnitTest=TRUE)
    checkTrue(class(ahms[[1]])=="AnnotationHubMetadata")
}

test_UCSCChainPreparer_recipe <- function() {
    .recipeSetup()
    ahms = updateResources(ahroot, BiocVersion,
        preparerClasses = "UCSCChainPreparer",
        insert = FALSE, metadataOnly=TRUE, justRunUnitTest=TRUE)
    checkTrue(class(ahms[[1]])=="AnnotationHubMetadata")
}
    
test_UCSC2BitPreparer_recipe <- function() {
    .recipeSetup()
    ahms = updateResources(ahroot, BiocVersion,
        preparerClasses = "UCSC2BitPreparer",
        insert = FALSE, metadataOnly=TRUE, justRunUnitTest=TRUE)
    checkTrue(class(ahms[[1]])=="AnnotationHubMetadata")
}

## FIXME: can we shorten this test, ie, just a few files?
test_EncodeImportPreparer_recipe <- function() {
    .recipeSetup()
    ahms = updateResources(ahroot, BiocVersion,
        preparerClasses = "EncodeImportPreparer",
        insert = FALSE, metadataOnly=TRUE, justRunUnitTest=TRUE)
    checkTrue(class(ahms[[1]])=="AnnotationHubMetadata")
}

test_EpigenomeRoadmapImportPreparer_recipe <- function() {
    .recipeSetup()
    ahms = updateResources(ahroot, BiocVersion,
        preparerClasses = "EpigenomeRoadMapPreparer",
        insert = FALSE, metadataOnly=TRUE, justRunUnitTest=TRUE)
    checkTrue(class(ahms[[1]])=="AnnotationHubMetadata")
}

test_dbSNPVCFPreparer_recipe <- function() {
    .recipeSetup()
    ahms = updateResources(ahroot, BiocVersion,
        preparerClasses = "dbSNPVCFPreparer",
        insert = FALSE, metadataOnly=TRUE, justRunUnitTest=TRUE)
    checkTrue(class(ahms[[1]])=="AnnotationHubMetadata")
}
    
test_RefNetImportPreparer_recipe <- function() {
    .recipeSetup()
    ahms = updateResources(ahroot, BiocVersion,
        preparerClasses = "RefNetImportPreparer",
        insert = FALSE, metadataOnly=TRUE)
     checkTrue(class(ahms[[1]])=="AnnotationHubMetadata")
}

test_PazarImportPreparer_recipe <- function() {
    .recipeSetup()
    ahms = updateResources(ahroot, BiocVersion,
        preparerClasses = "PazarImportPreparer",
        insert = FALSE, metadataOnly=TRUE)
     checkTrue(class(ahms[[1]])=="AnnotationHubMetadata")
}

test_ChEAPreparer_recipe <- function() {
    .recipeSetup()
    ahms = updateResources(ahroot, BiocVersion,
        preparerClasses = "ChEAImportPreparer",
        insert = FALSE, metadataOnly=TRUE)
    checkTrue(class(ahms[[1]])=="AnnotationHubMetadata")
}


test_Inparanoid8ImportPreparer_recipe <- function() {
    #.recipeSetup()
    #suppresWarnings({
    #ahms = updateResources(ahroot, BiocVersion,
    #                       preparerClasses = "Inparanoid8ImportPreparer",
    #                       insert = FALSE, metadataOnly=TRUE,
    #                       justRunUnitTest=TRUE)
    #})
    #checkTrue(class(ahms[[1]])=="AnnotationHubMetadata")
}

## FIXME: throws warnings
test_NCBIImportPreparer_recipe <- function() {
    .recipeSetup()
    ahms = updateResources(ahroot, BiocVersion,
                               preparerClasses = "NCBIImportPreparer",
                               insert = FALSE, metadataOnly=TRUE,
                               justRunUnitTest=TRUE)
    checkTrue(class(ahms[[1]])=="AnnotationHubMetadata")
}

t_GSE62944_recipe <- function() {
    .recipeSetup()
    ahms = updateResources(ahroot, BiocVersion,
                           preparerClasses = "GSE62944ToExpressionSetPreparer",
                           insert = FALSE, metadataOnly=TRUE,
                           justRunUnitTest=TRUE)
    checkTrue(class(ahms[[1]])=="AnnotationHubMetadata")
}

test_Grasp2Db_recipe <- function() {
    .recipeSetup()
    ahms = updateResources(ahroot, BiocVersion,
                           preparerClasses = "Grasp2ImportPreparer",
                           insert = FALSE, metadataOnly=TRUE,
                           justRunUnitTest=TRUE)
    checkTrue(class(ahms[[1]])=="AnnotationHubMetadata")
}

test_EnsemblGtfToGRanges_recipe <- function() {
    .recipeSetup()
    ahms = updateResources(ahroot, BiocVersion,
                           preparerClasses = "EnsemblGtfImportPreparer",
                           insert = FALSE, metadataOnly=TRUE,
                           justRunUnitTest=TRUE)
    checkTrue(class(ahms[[1]])=="AnnotationHubMetadata")
}