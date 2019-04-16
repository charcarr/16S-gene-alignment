############################################################################
#
#   Preprocessing blast output for LALIGN 
#   
#   Subset entries to only include ^[B|P][0-9]
#   Initialize a new column (nb2_num) to specify which strand to align
#
###########################################################################



library(tidyverse)
setwd('/Users/charleycarriero/Desktop/automate-compare')

read_csv("blast_output.csv") %>% 
  select(sample_name, seq_len, match, query_seq) %>% 
  filter(str_detect(sample_name, "^[B|P][0-9]")) %>% 
  mutate(nb2_num = str_extract(sample_name, regex("[0-9]+"))) %>% 
  select(sample_name, nb2_num, match, seq_len, query_seq) %>% 
  write_csv("for_lalign.csv")