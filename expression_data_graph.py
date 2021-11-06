#!/usr/bin/env python
# coding: utf-8

import pandas as pd
import matplotlib.pyplot as plt

df = pd.read_csv("/Users/candicewu/RNAseq/hits.csv", names=['Expression Levels', 'Protein', 'RNA Transcript'])
#df
df.pivot(index='Protein', columns='RNA Transcript', values='Expression Levels').plot(kind='bar')

plt.ylabel('Expression Level')
plt.title('Obesity Induced Changes in Gene Expression')
