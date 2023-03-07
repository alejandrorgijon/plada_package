#' @title Genome size studies
#'
#' @description Calculates the GC percentage of given sequences and calculates the length of them (aka number of bases).
#'
#' @param symbol
#'
#' @import stringr
#'
#' @return NULL
#'
#' @export

gesize <- function(n, m){
  vector <- as.vector(n)
  namesequences <- as.vector(m)
  length <- nchar(vector)
  GC <- str_count(vector, "C") + str_count(vector, "c") + str_count(vector, "G") + str_count(vector, "g")
  GC_percentage <- round((GC/length)*100, 2)
  beg_codon <-
  finalresult <- as.data.frame(cbind(namesequences, length, GC_percentage, vector))
  colnames(finalresult) <- c("name", "length", "GC","sequence")
  return(finalresult)
}
