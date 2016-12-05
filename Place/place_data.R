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

place.2010.2014 <- place.2010.2014 %>%
  rename(leto = leto_obdobja)

place.2010.2014$skupina_dm <- as.factor(place.2010.2014$skupina_dm)
place.2010.2014 <- place.2010.2014 %>%
  rename(Skupina = skupina_dm)

place.2010.2014$Skupina <- as.character(place.2010.2014$Skupina)
place.2010.2014$Skupina[place.2010.2014$Skupina == "A"] <- "Funkcionarji (A)"
place.2010.2014$Skupina[place.2010.2014$Skupina == "B"] <- "Vodilni uslužbenci (B)"
place.2010.2014$Skupina <- factor(place.2010.2014$Skupina)


place.2010.2014.long <- gather(data = place.2010.2014, key = "placilo", value = "vrednost", placa, polozajni_dodatek:dodatek_poracun_c900bruto)
place.2010.2014.long$placilo <- as.factor(place.2010.2014.long$placilo)

place.2010.2014.long <- place.2010.2014.long %>%
  mutate(`Povprečna vrednost` = vrednost/mesecev)

place.2010.2014.long$`Povprečna vrednost` <- ifelse(is.na(place.2010.2014.long$`Povprečna vrednost`),
                                                    place.2010.2014.long$vrednost,
                                                    place.2010.2014.long$`Povprečna vrednost`)
place.2010.2014.long$`Povprečna vrednost` <- ifelse(place.2010.2014.long$mesecev == 0,
                                                    place.2010.2014.long$vrednost,
                                                    place.2010.2014.long$`Povprečna vrednost`)


save.image(file = "./data/Place_2010_2014.RData")
