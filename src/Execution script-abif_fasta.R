#////////////////////////////////////////////////////////////////////////////////////
# Use this script to read Applied Biosystem Inc. Format (Ab1, ABIF) files and 
# put into one FASTA files for easy blasting on NCBI.

# Version 5

# To execute this code, fill out the required information according to the 
# instructions in the ReadMe file.
# When ready, highlight the whole script and click "Run"


# Step 1: Sourcing required functions------------------------------------------------

#path <- "[/Users/charleycarriero/Desktop/automate-compare]"
#func_path <- file.path(path, 'function-abif_fasta.R')
setwd('/Users/charleycarriero/Desktop/automate-compare')
source('function-abif_fasta.R')

# Step 2: Use the abif_fasta function------------------------------------------------

# how to fill in arguments
# folder = name of folder to where ab1 files are kept; need full path; 
#          if path uses backslashes, must use double backslashes (\\) instead;
#          must be in quotes.
# exclude = name of files that you wish to exclude from fasta file; 
#           must be in quotes, extention required, must be in a vector; 
#           example: c('file1.ab1','file2.ab1')
# trim = logical, default TRUE; do you want to trim N's from beginning and end?
#        trim determined by evaluating each nucleotide in the sequence to see if it
#        it is an N or not. It will then look for when the number of non-N nucleotides
#        is twice the number of Ns (meaning we are well into our gene sequence) and
#        the trim to be the most recent N found. Both beginning and ends of the
#        sequence are trimmed this way.
# trim.check = logical; default FALSE; print sequence before and after trim to
#              manually check the trim
# export.check = logical, default TRUE; export sequences before and after trimming
#               for convenience when examining trim job; exports as [ouput]_check.csv
# show.prog = logical, default TRUE; Reports a message on what file is currently
#             being converted
# ouput = default is 'V3-V6seq.FASTA'; name of output file; 
#         fasta extension required; will be a FASTA file; 
#         will save in location of folder provided;
#         can set to FALSE if no output desired

abif_fasta(folder='/Users/charleycarriero/Desktop/automate-compare/Michelle_040119Seq', exclude=NULL, trim=TRUE, 
           trim.check=FALSE, export.check=TRUE,
           show.prog=TRUE, output='V3-V6seq.FASTA')

