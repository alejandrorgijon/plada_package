#' @title Percentages of categories
#'
#' @description Calculates the percentage of representation of a given category present on a string.
#'
#' @param symbol
#'
#' @return NULL
#'
#' @export

percencat <- function(n){
  percentage <- round((table(n) / length(n)) *100, 2)
  result <- paste(percentage, sep = "")
  names <- table(n)
  finalresult <- as.data.frame(cbind(result, names))
  colnames(finalresult) <- c("Percentage (%)", "n")
  return(finalresult)
}
