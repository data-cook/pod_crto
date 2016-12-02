library(tidyverse)
library(forcats)
library(tidyr)
library(readxl)

place.2010 <- read_excel("./data/dodatki_agregat_2010.xlsx")
place.2011 <- read_excel("./data/dodatki_agregat_2011.xlsx")
place.2012 <- read_excel("./data/dodatki_agregat_2012.xlsx")
place.2013 <- read_excel("./data/dodatki_agregat_2013.xlsx")
place.2014 <- read_excel("./data/dodatki_agregat_2014.xlsx")

place.2010.2014 <- rbind(place.2010, place.2011, place.2012, place.2013, place.2014)
rm(place.2010, place.2011, place.2012, place.2013, place.2014)
save.image(file = "./data/Place_2010_2014.RData")
