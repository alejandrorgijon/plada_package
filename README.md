# plada

The package `plada` aims to help you <i><b>PLA</b>ying with your <b>DA</b>ta</i> (quite original name, huh?). 

## Installation

This package is currently only available through GitHub and can be downloaded using devtools.

```
> install.packages("devtools")
> devtools::install_github("alejandrorgijon/plada")
```
## Functions

During my PhD I needed some specific functions in R, but I could not find a package that would do them. Therefore, I decided to develope them. I used this functions to analyze microbial genomes assembled from metagenomes (MAGs), but I certainly think many people from other fields can find them useful! 

At the moment, `plada` has 5 functions that I developed to help me managing and sorting data. Maybe in the future I will include more functions.
The package also includes 3 fake datasets (`sequences`, `some_bacteria and `random_data`) to test the functions included here.

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

As a microbial ecologist, sometimes I need to estimate how many of my genomes are classified into different taxonomical levels (i.e., How many of my genomes are classified to the genus level? And to the class level?). To use this function, we need to provide a dataframe that should contain 8 columns, normally in the order as follows: mOTU, domain, phyla, class, order, family, genera, species.

For example, I have provided in the package a fake dataset of 9 bacteria called `some_bacteria`:

```
> head(some_bacteria, n=10)
# A tibble: 8 × 8
  mOTU     Domain      Phylum              Class                  Order               Family               Genus          Species
  <chr>    <chr>       <chr>               <chr>                  <chr>               <chr>                <chr>          <chr>  
1 mOTU_001 d__Bacteria p__Actinobacteriota c__Actinomycetia       o__Mycobacteriales  f__Mycobacteriaceae  g__Mycobacter… s__Myc…
2 mOTU_002 d__Bacteria p__Cyanobacteria    c__Cyanobacteriia      o__Cyanobacteriales f__Nostocaceae       g__Dolichospe… s__Dol…
3 mOTU_002 d__Bacteria p__Cyanobacteria    c__Cyanobacteriia      o__Cyanobacteriales f__Nostocaceae       g__Dolichospe… s__Dol…
4 mOTU_003 d__Bacteria p__Proteobacteria   c__Alphaproteobacteria o__Rhodobacterales  f__Rhodobacteraceae  g__Roseicyclus s__    
5 mOTU_004 d__Bacteria p__Cyanobacteria    c__Cyanobacteriia      o__PCC-6307         f__Cyanobiaceae      g__Synechococ… s__Syn…
6 mOTU_005 d__Bacteria p__Bacteroidota     c__Bacteroidia         o__Flavobacteriales f__Flavobacteriaceae g__Polaribact… s__Pol…
7 mOTU_006 d__Bacteria p__Proteobacteria   c__Alphaproteobacteria o__Rhodobacterales  f__                  g__            s__    
8 mOTU_007 d__Bacteria p__Cyanobacteria    c__Cyanobacteriia      o__PCC-6307         f__Cyanobiaceae      g__Vulcanococ… s__Vul…
```

To use `taxabu()` we just need to provide call the dataframe using the function:
```
> taxabu(some_bacteria)
  Taxonomic_level Count
1            mOTU     8
2          Domain     8
3          Phylum     8
4           Class     8
5           Order     8
6          Family     7
7           Genus     7
8         Species     6
9           Total     8
```
As we can see, from a total of 8 mOTUs (metagenomic Operational Taxonomical Units), 8 were classified to the order level, 7 to the genus level and 6 to the species level.

### `which_envi()`: 

This function calculates if a given categoric variable has a representation  above or under 50%.

# Some useful resources:

- How to develop a R package? https://github.com/mvuorre/exampleRPackage


