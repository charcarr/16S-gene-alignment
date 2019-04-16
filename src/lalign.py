###########################################################
#  Sequence Alignment
#  queries the LALIGN server
#
#  Charley Carriero
#  15 April, 2019
###########################################################


import requests
from bs4 import BeautifulSoup
import numpy as np
import pandas as pd



blast_output= pd.read_csv('data/blast_files/prepped_for_lalign.csv')
df = pd.read_csv('data/what_are_our_MET_strains_full.csv').rename(columns = {'16S sequence (NanoPore)': 'full_seq',
                                                                        'NB2#': 'nb2_num',
                                                                        'MET2 Species': 'species'})
df.drop(df.tail(4).index,inplace=True)
our_strains = df[['species', 'nb2_num', 'full_seq']]

o = blast_output.merge(our_strains,how='left')


########################### define function ##################################

def query_lalign (s1, s2):


    url = "https://embnet.vital-it.ch/cgi-bin/LALIGN_form_parser"
    payload =  ('method=local&'
                'no=3&'
                'evalue=10.0&'
                'matrix=default&open=-12&exten=-2&comm1=&format1=plain_text&seq1='+
                 s1 + '&'
                'comm2=&format2=plain_text&'
                'seq2=' + s2 + '&'
                'undefined=')

    headers = {
        'Connection': "keep-alive",
        'Cache-Control': "max-age=0",
        'Origin': "https://embnet.vital-it.ch",
        'Upgrade-Insecure-Requests': "1",
        'Content-Type': "application/x-www-form-urlencoded",
        'User-Agent': "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36",
        'Accept': "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3",
        'Referer': "https://embnet.vital-it.ch/software/LALIGN_form.html",
        'Accept-Encoding': "gzip, deflate, br",
        'Accept-Language': "en-US,en;q=0.9",
        'Cookie': "_ga=GA1.2.1486009775.1554749601; _gid=GA1.2.527523046.1554749601; _gat=1",
        'cache-control': "no-cache",
        'Postman-Token': "8a27a64f-6a34-44bb-8b0d-646fce32a074"
        }

    r = requests.request("POST", url, data=payload, headers=headers)

    soup = BeautifulSoup(r.text, 'html.parser')
    t =soup.text
    t_list = t.split()
    p = t_list[134]
    p = float(p.strip('%'))

    return(p)

    ########################### run program #################################

o['pid'] = np.vectorize(query_lalign)(o['query_seq'], o['full_seq'])
o = o[['sample_name', 'nb2_num','seq_len','match','species', 'pid']]
o['pass'] = np.where(o['pid'] > 98, 'pass', 'fail')
o.to_csv('results/lalign_output.csv')
