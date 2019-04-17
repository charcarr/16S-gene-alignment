# 16S-gene-alignment
A pipeline for bacterial species identification and quality control. <br/>
The scripts in this pipeline are designed to automate species identification through comparing 16S sangar sequences to a known bank of full length 16S gene sequences. 


<br/>


## Getting Started:


* Put the folder of sangar sequences in the `data/sangar_seqs` directory 
* Add the `what_are_our_strains.csv` to the `data` directory 



**Usage Instructions**

Open the `run_me.Rmd` file and follow the directions inside. <br/>
Each script can be run independently from within the document. 

Dependencies are listed below.

*R*

* tidyverse
* reticulate

*Python*

* requests
* beautifulsoupt4
* pandas
* numpy

<Br/>

## Description: 


The gene alignment pipeline is broken into 5 steps

1. Transform .ab1 files into a FASTA file
2. BLAST the FASTA file
3. Parse the output from BLAST
4. Subset output and preprocess for alignment
5. Query LALIGN to find percent identity


<br/> 


<br/>

**Author**: Charley Carriero <br/>
**Date**: April 2019

<br/>

