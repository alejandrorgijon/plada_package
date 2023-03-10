#' @title Representation of a variable in another variable
#'
#' @description Calculates if a given categoric variable has a representation of above or under 50% according to another categoric variable. n and m represents the 2 categoric variables you want to analyse. o represents the dataframe you want to analyse.
#'
#' @param symbol
#'
#' @return NULL
#'
#' @export

which_envi <- function(category1, category2){
  table1 <- data.frame(category1, category2)
  names(table1) <- c("category1", "category2")
  taxa <- table(table1$category1)
  taxa_half <- data.frame(taxa/2)
  library(dplyr)
  frequencies <- table1 %>% group_by(category1, category2) %>% summarise(nrow=n())
  names(frequencies) <- c("taxa", "environment", "number")
  finaltable <- merge(x = frequencies, y = taxa_half, by.x = "taxa", by.y = "Var1")
  proportion <- finaltable$n >= finaltable$Freq
  finaltable <- cbind(finaltable, proportion)
  finaltable$proportion <- gsub("TRUE", "Above50%", finaltable$proportion)
  finaltable$proportion <- gsub("FALSE", "Under50%", finaltable$proportion)
  finaltable$Freq <- finaltable$Freq * 2
  names(finaltable) <- c("cat1", "cat2", "n", "n_cat1", "proportion")
  print(finaltable)
}
