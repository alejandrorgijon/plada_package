library(readr)
sequences <- read_csv("data-raw/sequences.csv")
random_data <- read_delim("data-raw/random_data.csv",
                                                delim = ";", escape_double = FALSE, trim_ws = TRUE)
use_data(sequences)
use_data(random_data)
?sequences
