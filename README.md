# 16S-gene-alignment
A pipeline for species identification and quality control.


**Author**: Charley Carriero <br/>
**Date**: April 16, 2019 <br/>

---

<br/> 

### Usage Instructions

Open the `run_me.Rmd` file and follow the directions inside. <br/>
Each script can be run independently from within the document. 

<br/>

### Dependencies

*R*

* tidyverse
* reticulate

*Python*

* requests
* beautifulsoupt4
* pandas
* numpy

<Br/>


### Description


The gene alignment pipeline is broken into 5 steps

1. Transform .ab1 files into a FASTA file
2. BLAST the FASTA file
3. Parse the output from BLAST
4. Subset output and preprocess for alignment
5. Query LALIGN to find percent identity


<br/> 


