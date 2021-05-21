# Beliefs


# set up ------------------------------------------------------------------

library(tidyverse)
library(stargazer)
setwd("~/Documents/01_Bachelor Thesis/Empirics")

df <- read_csv('data_clean/covid_tracker.csv',col_types = 'nccnnnnnnn')

# regression --------------------------------------------------------------


ols1 <- lm(trust_gov ~ male + age + battleground_state + democratic_state, 
          data=df)
summary(ols1)


ols2 <- lm(belonging ~ male + age + battleground_state + democratic_state, 
           data=df)
summary(ols2)


ols3 <- lm(country_division ~ male + age + battleground_state + democratic_state, 
           data=df)
summary(ols3)


table <- stargazer(ols1, ols2, ols3, title='Regressions of changes of beliefs')
cat(table, file='../aa_Thesis/reg/beliefs.tex')
