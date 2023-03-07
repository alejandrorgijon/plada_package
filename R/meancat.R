#' @title Mean of a value according to a category
#'
#' @description Calculates the mean of a numerical variable (n) according to certain category (m) --> meancat(n, m)
#'
#' @return NULL
#'
#' @export

meancat <- function(n, m){
  names <- table(m)
  mean_final <- (tapply(n, m, FUN = sum))/names
  finalresult <- as.data.frame(cbind(names, mean_final))
  colnames(finalresult) <- c("n", "mean")
  return(finalresult)
}
