library(tidyverse)
library(forcats)
library(tidyr)
load(file = "./data/Place_2010_2014.RData")
source("./functions/ggplot_tema.R")

poslanci <- place.2010.2014 %>%
  filter(opis_delovnega_mesta_z370opis == "POSLANEC" & mesecev != 0 & placa > 0)


povprecna.placa.leto <- poslanci %>%
  mutate(povprecna.placa = placa / mesecev) %>%
  group_by(leto_obdobja) %>%
  summarize(povprecna.placa = round(mean(povprecna.placa, na.rm= T),0)) %>%
  select(Leto = leto_obdobja, `Povprečna bruto plača v €` = povprecna.placa)

ggplot(povprecna.placa.leto, aes(x=Leto, y=`Povprečna bruto plača v €`)) +
  geom_bar(stat="identity") +
  geom_label(aes(label=paste(`Povprečna bruto plača v €`, "€"))) +
  labs(title = "Povprečna mesečna plača poslanca po letih",
       subtitle="",
       caption = "Vir podatkov:\nhttps://podcrto.si/podatkovne-zbirke/\nhttp://resources.podcrto.si/dodatkizaobjavo.rar") +
  datacook_theme()
