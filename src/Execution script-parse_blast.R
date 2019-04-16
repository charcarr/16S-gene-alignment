#////////////////////////////////////////////////////////////////////////////////////
# Use this script to read the blast results of the V3klVr6 sequences 
# This script automatically parses all the results into one csv file.

# Version 3

# To execute this code, fill out the required information according to the 
# instructions in the ReadMe file.
# In brief: Replace all parts of script in [] with your info
#           read argument descriptions in step 3, and fill in parameters according
#           to your needs

# When ready, highlight the whole script and click "Run"

# Step 1: Sourcing required functions------------------------------------------------

path <- "/Users/MichelleDaigneault/Documents/EAV Lab/R Functions/Parse_BLAST"
source(file.path(path, 'function-parse_blast.R'))

# Step 2: Set your working directory to where your files are-------------------------

path <- "[your/path/to/folder/where/blast/xml/file/is/located]"

setwd(path)
blast_xml <- "[name of blast xml file].xml"
input <- file.path(path, blast_xml)

# Step 3: Use the parse_blast function-----------------------------------------------

# how to fill in arguments:
# filename = name of xml file containing blast search results for V3klV6r sanger 
#            sequencing (exported from ncbi blast); 
#            full path to file should be included; need to include .xml
# ngroups = default 1; the number of identity-coverage groups to be returned
# tophit = default FALSE; if TRUE, only returns the top hit for each query
# output = default 'blast_result.csv'; name of output file; will be in csv format;
#          will be saved in same location as your blast xml file.

parse_blast(filename='/Users/MichelleDaigneault/Downloads/AA1J3F0A014-Alignment.xml', ngroups=1, tophit=FALSE, output= 'blast_result.csv')
