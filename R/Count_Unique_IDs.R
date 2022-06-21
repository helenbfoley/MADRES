#' Count Unique IDs in a Dataframe
#'
#' @param dat_and_col Name of the Dataframe and column of the IDs, in the format dat$ID
#'
#' @return The number of unique IDs.
#' @export
#'
#' @examples
#' my_data<-data.frame(aliquot=c("GH56543", "KJ98757", "BW98564"),
#' ID=c("MAD-5-16-78-00",  "MAD-5-17-325-00", "MAD-5-18-199-01"))
#' CountuniqueIDs(my_data$ID)
CountuniqueIDs<-function(dat_and_col){
  dat_and_col->dat2
  return(length(unique(dat2)))
}


