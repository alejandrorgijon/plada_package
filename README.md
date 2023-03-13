# plada
> *Copyright 2023 (Alejandro Rodríguez-Gijón). Licensed under the MIT license.*

The package `plada` aims to help you <i><b>PLA</b>ying with your <b>DA</b>ta</i> (quite original name, huh?). 

During my PhD I needed some specific functions in R, but I could not find a package that would do them. Therefore, I decided to develope them. I used these functions to sort and analyze genomic information and metadata of microbial genomes assembled from metagenomes (MAGs), but I certainly think many people from other fields can find them useful! 

At the moment, `plada` has 5 functions, but I may include more functions in the future: suggestions are appreciated.
Note that the package also includes 4 tables with data (`sequences`, `some_bacteria`,`environments` and `random_data`) to test the functions included here. But I'm sorry to tell you my friend, these tables were randomly generated.

## Installation

This package is currently only available through GitHub and can be downloaded using devtools.

```
> install.packages("devtools")
> devtools::install_github("alejandrorgijon/plada")
```
## Functions

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

If we use the function `gesize()`, indicating which column has the genetic sequences and which column has the name given to the sequence, we can retrieve the GC composition and length of the sequence:

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
Calculates the mean of a numerical variable (n) according to certain category (m).
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

### `taxabu()`: 

As a microbial ecologist, sometimes I need to estimate how many of my genomes are classified into different taxonomical levels (i.e., How many of my genomes are classified to the genus level? And to the class level?). To use this function, we need to provide a dataframe that should contain 8 columns, normally in the order as follows: mOTU, domain, phyla, class, order, family, genera, species.

For example, I have provided in the package a fake dataset of 8 bacteria called `some_bacteria`:

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

To use `taxabu()` we just need to provide the dataframe using the function:
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

Important to note: this function has been build using the taxonomy provided by GTDBtk (https://github.com/Ecogenomics/GTDBTk), and may not work with different formats.

### `percencat()`: 

However, if you want to estimate representation of different groups from a given category present on your dataset (let's say, you want to check how many Cyanobacteria are present in your dataset), your function is `percencat()`.

```
> percencat(some_bacteria$Phylum)
                    Percentage (%) n
p__Actinobacteriota           12.5 1
p__Bacteroidota               12.5 1
p__Cyanobacteria                50 4
p__Proteobacteria               25 2
```
```
> percencat(some_bacteria$Genus)
                   Percentage (%) n
g__                          12.5 1
g__Dolichospermum              25 2
g__Mycobacterium             12.5 1
g__Polaribacter              12.5 1
g__Roseicyclus               12.5 1
g__Synechococcus_D           12.5 1
g__Vulcanococcus             12.5 1
```

### `which_envi()`: 

This function calculates if a given categoric variable has a representation  above or under 50%.
Let's say that, given the dataset `environments`, we want to check how many of our genomes are aquatic and how many are terrestrial, but also check which sub-environments we find under these categories. First, let's observe the dataset:

```
> head(environments, n = 10)
# A tibble: 10 × 3
   species   environment1 environment2
   <chr>     <chr>        <chr>       
 1 species1  aquatic      marine      
 2 species2  aquatic      marine      
 3 species3  aquatic      marine      
 4 species4  aquatic      marine      
 5 species5  aquatic      marine      
 6 species6  aquatic      freshwater  
 7 species7  aquatic      freshwater  
 8 species8  aquatic      freshwater  
 9 species9  aquatic      freshwater  
10 species10 aquatic      freshwater  
...
```

To determine how many species we find on each sub-environment ($environment2), we will:

```
> which_envi(environments$environment1, environments$environment2)
         cat1             cat2  n n_cat1 proportion
1     aquatic       freshwater  6     11   Above50%
2     aquatic           marine  5     11   Under50%
3 terrestrial             clay  2     13   Under50%
4 terrestrial plant-associated  1     13   Under50%
5 terrestrial         volcanic 10     13   Above50%
```

Here, we observe that we have 11 species on aquatic environments (6 freshwater and 5 marine) and 13 terrestrial (2 clay, 1 plant-associated and 10 volcanic). This is indicated by n_cat1.

Note by a friend: when you indicate the environments, go from bigger to smaller environments (which environment includes which?).

# Some useful resources:

- How to develop a R package? https://github.com/mvuorre/exampleRPackage
- Chaumeil PA, et al. 2022. GTDB-Tk v2: memory friendly classification with the Genome Taxonomy Database. Bioinformatics, btac672.

# Acknowledgements

Thanks Armando Pacheco Valenciana for your help testing the package.

# Citation

Rodríguez-Gijón, A. Plada: a R package to PLAy with your DAta [Computer software]. https://github.com/alejandrorgijon/plada
