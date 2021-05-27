# 2020 US Presidential Election
Data handling scripts for an analysis about the impact of COVID-19 on the 2020 US presidential election. The files are numbered according to the chapter in the thesis in which the data is used. While the data handling has been done in .ipynb files, the regression outputs were computed with R and then put into LaTeX using the Stargazer package. Those files can be found in the folder `reg_outputs`.

The data is always linked before using it in each script. To run the code yourself, you first have to download the data sets and change the directories to work in your folder structure.

### A couple of outputs:

Below, I will showcase a few of the outputs. All the codes and data sources behind them can be found in the scripts.

The change in voting shares for the Democratic candidate from 2016-2020 was calculated per county. The results can be seen below. Most counties increased their share for the Democratic candidate in that time period. Some, on the other hand, increased their voter share for Donald Trump.
<p align='center'>
<img width="496" alt="Screenshot 2021-05-27 at 10 50 16" src="https://user-images.githubusercontent.com/61436958/119796458-ad52d680-bed9-11eb-8e44-c4d0f403c21f.png">
</p>

It was looked at who the people were that voted by mail in the 2020 US presidential election. These shares were then compared with the share of that group in the population. The results can be seen in the table below. Interestingly, all of the people that voted by mail in the data set that was used lived less than 30 minutes away from the next polling station. 
<p align='center'>
<img width="496" alt="Screenshot 2021-05-27 at 10 50 50" src="https://user-images.githubusercontent.com/61436958/119797275-5e597100-beda-11eb-8ee7-195cb98154f5.png">
</p>

The share of registered voters increased for most minority groups. A higher share of minority voters registered should have led to a higher turnout and might thus have influenced the election.
<p align='center'>
<img width="496" alt="Screenshot 2021-05-27 at 10 51 14" src="https://user-images.githubusercontent.com/61436958/119797285-60bbcb00-beda-11eb-83c0-6cc4b3dee6da.png">
</p>
