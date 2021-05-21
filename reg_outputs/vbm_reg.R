# VBM


# set up ------------------------------------------------------------------

library(tidyverse)
library(stargazer)
setwd("~/Documents/01_Bachelor Thesis/Empirics")

vbm <- read_csv('data_clean/vbm.csv')


# regression --------------------------------------------------------------

lpm <- lm(vbm ~ sex + education + income + sex_orientation + black + hisp
          + asian + native + rural + town + suburb, data=vbm)

summary(lpm)

table1 <- stargazer(lpm, title='Regression results')
cat(table1, file='../aa_Thesis/reg/vbm.tex')
