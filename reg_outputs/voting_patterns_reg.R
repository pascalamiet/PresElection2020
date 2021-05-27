# Voting Patterns


# set up ------------------------------------------------------------------

library(tidyverse)
library(stargazer)
setwd("~/Documents/01_Bachelor Thesis/Empirics")

df <- read_csv('data_clean/vbm.csv')

# regression --------------------------------------------------------------

ols <- lm(vote ~ sex + sex_orientation + income + education + black + hisp + 
            asian + native + rural + town + suburb + rel_jew + rel_mus + 
            rel_ath, data=df)
summary(ols)

table <- stargazer(ols, title='Voting patterns')
cat(table, file='../aa_Thesis/reg/voting_patterns.tex')

# robust ------------------------------------------------------------------

library(lmtest)
library(sandwich)
coeftest(ols, vcov = vcovHC(ols, type="HC3"))
