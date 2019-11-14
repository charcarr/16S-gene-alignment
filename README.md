# 16S-gene-alignment
A pipeline for bacterial species identification. <br/>
Purpose: To automate 16S sangar sequence identification by pairwise comparsion to known full genomes via
 ExPASy LALIGN server. <br/>
 
 <br/>
 Contains scripts to pre-process the data, query LALIGN server, scrape, parse and process the results.


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




<br/>

**Author**: Charley Carriero <br/>
**Date**: April 2019

<br/>

