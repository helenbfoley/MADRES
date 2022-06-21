#' Count Unique Mother's IDs in a Dataframe
#'
#' @param dat_and_col Name of the Dataframe and column of the IDs, in the format dat$ID
#'
#' @return The number of unique mother's IDs, ending in "-00".
#' @export
#'
#' @examples
#' my_data<-data.frame(aliquot=c("GH56543", "KJ98757", "BW98564"),
#' ID=c("MAD-5-16-78-00",  "MAD-5-17-325-00", "MAD-5-18-199-01"))
#' CountuniqueMothers(my_data$ID)
CountuniqueMothers<-function(dat_and_col){
  grepl(x = unique(dat_and_col), pattern = "-00")->dat2
  return(sum(dat2))
}
