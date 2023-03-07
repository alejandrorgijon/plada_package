#' @title Taxonomic categorization effort analysis
#'
#' @description Calculates how many mOTUs are classified until different taxonomical levels.
#' The dataframe should contain 8 columns, normally in the order as follows: mOTU, domain, phyla, class, order,
#' family, genera, species.
#'
#' @param symbol
#'
#' @return NULL
#'
#' @export

taxabu <- function(df){
  a <- str_length(as.vector(df[[1]]))
  b <- str_length(as.vector(df[[2]]))
  c <- str_length(as.vector(df[[3]]))
  d <- str_length(as.vector(df[[4]]))
  e <- str_length(as.vector(df[[5]]))
  f <- str_length(as.vector(df[[6]]))
  g <- str_length(as.vector(df[[7]]))
  h <- str_length(as.vector(df[[8]]))
  total_length <- length(as.vector(df[[1]]))
  dataframe <- as.data.frame(cbind(a, b, c, d, e, f, g, h))
  dataframe[dataframe=="3"]<-NA         # TRUE WHEN IS NA, FALSE WHEN THERE IS SOMETHING
  dataframe$a <- is.na(dataframe$a)
  dataframe$b <- is.na(dataframe$b)
  dataframe$c <- is.na(dataframe$c)
  dataframe$d <- is.na(dataframe$d)
  dataframe$e <- is.na(dataframe$e)
  dataframe$f <- is.na(dataframe$f)
  dataframe$g <- is.na(dataframe$g)
  dataframe$h <- is.na(dataframe$h)
  species_count <- sum(str_count(dataframe$h, "FALSE"))
  genera_count <- sum(str_count(dataframe$g, "FALSE"))
  family_count <- sum(str_count(dataframe$f, "FALSE"))
  order_count <- sum(str_count(dataframe$e, "FALSE"))
  class_count <- sum(str_count(dataframe$d, "FALSE"))
  phylum_count <- sum(str_count(dataframe$c, "FALSE"))
  domain_count <- sum(str_count(dataframe$b, "FALSE"))
  mOTU_count <- sum(str_count(dataframe$a, "FALSE"))
  numbers_counts <- c(mOTU_count, domain_count, phylum_count, class_count, order_count, family_count, genera_count, species_count, total_length)
  until_what <- c("mOTU", "Domain", "Phylum", "Class", "Order", "Family", "Genus", "Species", "Total")
  final_dataframe <- as.data.frame(cbind(until_what, numbers_counts))
  names(final_dataframe) <- c("Taxonomic_level", "Count")
  final_dataframe$Count <- as.numeric(as.character(final_dataframe$Count))
  final_dataframe
}
