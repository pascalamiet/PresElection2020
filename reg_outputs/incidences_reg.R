# Incidences


# set up ------------------------------------------------------------------

library(tidyverse)
library(stargazer)
setwd("~/Documents/01_Bachelor Thesis/Empirics")

df <- read_csv('data_clean/results_covid_county.csv')

# regression --------------------------------------------------------------

ols1 <- lm(change ~ incidences, data=df)
summary(ols1)

ols2 <- lm(change ~ deaths, data=df)
summary(ols2)

table <- stargazer(ols1, ols2, title='Coefficients of incidences and deaths')
cat(table, file='../aa_Thesis/reg/incidences.tex')
