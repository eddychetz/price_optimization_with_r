# PRICE OPTIMIZATION WITH MACHINE LEARNING IN R ----
# **** ----

# LIBRARIES ----

# Data Analysis 
library(tidyverse)
library(correlationfunnel)
library(skimr)

# Visuals
library(plotly)
library(tidyquant)

# Machine Learning & Conformal Prediction
library(tidymodels)
library(probably)

#  DATA IMPORT ----

price_optimization_raw_tbl <- read_csv('./data/price_optimization.csv') %>%
    janitor::clean_names()

# DATA EXAMINATION ----

price_optimization_raw_tbl <- price_optimization_raw_tbl %>%
    select(c(freight_price, product_category_name, qty, weekday, weekend, holiday, month, year)) %>%
    mutate(price = round(freight_price), quantity_sold = qty, product = product_category_name) %>%
    select(-c(freight_price, product_category_name, qty)) %>%
    mutate_if(event = contains(2017), paste('No Promo'))
    glimpse()

price_optimization_raw_tbl %>% skim()

# fs::dir_create("./data/")
