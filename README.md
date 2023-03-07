# plada

The package `plada` aims to help you <i><b>PLA</b>ying with your <b>DA</b>ta</i> (quite original name, huh?). 

## Installation

This package is currently only available through GitHub and can be downloaded using devtools.

```
> install.packages("devtools")
> devtools::install_github("alejandrorgijon/plada")
```
## Functions

At the moment, `plada` has 5 functions that have been quite useful to manage and sort data. 
The package also includes 2 fake datasets (`sequences` and `random_data`) to test the functions included here.

### `gesize()`: 
This function calculates the GC percentage of given sequences and calculates the length of them (aka number of bases).
For example, I have provided in the package a fake dataset of genetic sequences called `sequences`:

```
> head(sequences)
1       seq1    GCGCGCGGGCATCGTAGCTGCTCGCGCTAGCTACGTCCGCTCTCGACTAGCTGACTGCGCTCAGCTATGCTACGATCGTACGATCGTGCTATGCTAGTGCATGCTAGCTAGC
2       seq2    CGATCGTAGCTACGTAGCTAGCTGATCGACTAGTGATCGCGTAGCTAGCTGCTGCTCGTCGTATGACTAGCTGATCGATCGATCGATCGTAGCTAGCTAGCTAGCTGATCGTAG
3       seq3    cgatcgcgatcgtactgctgtcggtggcta
4       seq4    cgatactcatatgcgtcgtaacgtctgctgtgtgtgctactatcgtagctacgtacgatcgatcgtgactcgatcgtagactg
5       seq5    ACTCGTAGCGTTGGTCATcatcgtagctagcgctagctgatgccaaaaa
```

If we use the function `gesize(), indicating which column has the genetic sequences and which column has the name given to the sequence, we can retrieve the GC composition and length of the sequence:

```
> gesize(sequences$genseqs, sequences$columnames)
name    length    GC        sequence
1 seq1   112      59.82    GCGCGCGGGCATCGTAGCTGCTCGCGCTAGCTACGTCCGCTCTCGACTAGCTGACTGCGCTCAGCTATGCTACGATCGTACGATCGTGCTATGCTAGTGCATGCTAGCTAGC
2 seq2   114      51.75    CGATCGTAGCTACGTAGCTAGCTGATCGACTAGTGATCGCGTAGCTAGCTGCTGCTCGTCGTATGACTAGCTGATCGATCGATCGATCGTAGCTAGCTAGCTAGCTGATCGTAG
3 seq3   30       60       cgatcgcgatcgtactgctgtcggtggcta
4 seq4   83       49.4     cgatactcatatgcgtcgtaacgtctgctgtgtgtgctactatcgtagctacgtacgatcgatcgtgactcgatcgtagactg   
5 seq5   49       48.98    ACTCGTAGCGTTGGTCATcatcgtagctagcgctagctgatgccaaaaa 
```
                                                                                                           
### `meancat()`: 
Calculates the mean of a numerical variable (n) according to certain category (m) –> meancat(n, m).
For example, I have provided in the package a fake dataset of the number of dogs that different people have (I love dogs <3) called `random_data`:

```
> head(random_data, n=10)
   person  country n_dogs
1 person1    Spain      3
2 person2 Tanzania      2
3 person3      USA      1
4 person4    Spain      1
5 person5       UK      1
6 person6   Sweden      0
7 person7   Sweden      0
8 person8   Sweden      1
9 person9    Japan      2
```

If we use the function `meancat()`, we can observe how many dogs have people in average in every country:

```
> meancat(random_data$n_dogs, random_data$country)
         n      mean
Japan    1 2.0000000
Spain    2 2.0000000
Sweden   3 0.3333333
Tanzania 1 2.0000000
UK       1 1.0000000
USA      1 1.0000000
```

### `percencat()`: 

However, if you want to estimate representation of all groups from a given category present on your dataset (let's say, you want to check how many of the people in your dataset are from UK), your function is `percencat()`.

```
> percencat(random_data$country)
         Percentage (%) n
Japan             11.11 1
Spain             22.22 2
Sweden            33.33 3
Tanzania          11.11 1
UK                11.11 1
USA               11.11 1
```

### `taxabu()`: 

As a microbial ecologist, sometimes I need to calculates how many groups (let´s say, metagenomic Operational Taxonomical Units, or mOTUs) are classified into different taxonomical levels. The dataframe to provide to this function should contain 8 columns, normally in the order as follows: mOTU, domain, phyla, class, order, family, genera, species.

```
taxabu(df)
```

### `which_envi()`: 

This function calculates if a given categoric variable has a representation  above or under 50%.

# Some useful resources I consulted during development and publication of the package.

- How to develop a R package? https://github.com/mvuorre/exampleRPackage


