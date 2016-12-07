library(tidyverse)
library(forcats)
library(tidyr)
library(viridis)
library(plotly)
#library(ggiraphExtra)
#library(ggiraph)
load(file = "./data/Place_2010_2014.RData")
source("./functions/ggplot_tema.R")


# Poslanci ------------------------------------------------------------------------------------
poslanci <- place.2010.2014.long %>%
  filter(opis_delovnega_mesta_z370opis == "POSLANEC" & placilo == "placa" & vrednost > 0)

poslanci$leto <- as.factor(poslanci$leto)

poslanci.povprecna.placa.leto <- poslanci %>%
  group_by(leto) %>%
  summarize(povprecna.placa = round(mean(`Povprečna vrednost`, na.rm= T),0)) %>%
  select(leto, `Povprečna vrednost` = povprecna.placa) %>%
  ungroup()

g.povprecna.placa.poslanci <- ggplot(poslanci.povprecna.placa.leto, aes(x=leto, y=`Povprečna vrednost`)) +
  geom_bar(stat="identity") +
  geom_label(aes(label=paste(`Povprečna vrednost`, "€"))) +
  labs(title = "Povprečna mesečna plača poslanca po letih",
       subtitle="",
       x = "Leto",
       y="Povprečna bruto plača v €",
       caption = "Vir podatkov:\nhttps://podcrto.si/podatkovne-zbirke/\nhttp://resources.podcrto.si/dodatkizaobjavo.rar") +
  datacook_theme()

ggsave("./Place/grafi/g.povprecna.placa.poslanci.png", g.povprecna.placa.poslanci, width = 306, height = 142, units = "mm", dpi = 300)


g01.povprecna.placa.poslanci <- ggplot(poslanci, aes(x=leto, y=`Povprečna vrednost`)) +
  geom_violin(aes(fill = leto)) +
  geom_jitter(height = 0,size = 1.5 ) +
  scale_fill_viridis(discrete = T, begin = 0.3, end = 0.6)+
  facet_wrap(~leto, scales = "free", nrow = 1) +
  geom_label(data = poslanci.povprecna.placa.leto, aes(x = leto,
                                              label = paste("Povprečna plača\n",`Povprečna vrednost`)))+
  labs(title = "Povprečna mesečna plača poslanca po letih",
       subtitle="",
       x = "Leto",
       y="Povprečna bruto plača v €",
       caption = "Vir podatkov:\nhttps://podcrto.si/podatkovne-zbirke/\nhttp://resources.podcrto.si/dodatkizaobjavo.rar") +
  datacook_theme() +
  theme(legend.title = element_blank(),
        legend.position = "bottom",
        legend.direction = "horizontal")


ggsave("./Place/grafi/g01.povprecna.placa.poslanci.png", g01.povprecna.placa.poslanci, width = 306, height = 142, units = "mm", dpi = 300)
# Poslanci ------------------------------------------------------------------------------------


# Dodatki -------------------------------------------------------------------------------------
povprecna.izplacila.dodatkov <- place.2010.2014.long %>%
  filter(placilo != "placa" & vrednost !=0) %>%
  group_by(placilo, leto) %>%
  summarise(`Povprečna vrednost` = round(mean(`Povprečna vrednost`, na.rm=T),2)) %>%
  ungroup()

povprecna.izplacila.dodatkov$leto <- as.factor(povprecna.izplacila.dodatkov$leto)

g02.povprecna.izplacila.dodatkov <- povprecna.izplacila.dodatkov %>%
  #filter(leto == "2010") %>%
  ggplot(., aes(x=leto, y=`Povprečna vrednost`, ymax=`Povprečna vrednost`+50)) + 
  geom_bar(stat="identity") +
  facet_wrap(~placilo, scales = "free_y", ncol = 6) +
  geom_text(aes(label=`Povprečna vrednost`), vjust=-0.5, angle = 0) +
  labs(title = "Povprečna bruto izplačila dodatkov",
       subtitle="",
       x = "",
       y="Povprečno bruto izplačilo v €",
       caption = "Vir podatkov:\nhttps://podcrto.si/podatkovne-zbirke/\nhttp://resources.podcrto.si/dodatkizaobjavo.rar") +
  datacook_theme() +
  theme(legend.title = element_blank(),
        legend.position = "bottom",
        legend.direction = "horizontal",
        axis.text.x = element_text(size = 10, angle = 0),
        strip.text = element_text(size = 8))

ggsave("./Place/grafi/g02.povprecna.izplacila.dodatkov.png", g02.povprecna.izplacila.dodatkov, width = 306, height = 142, units = "mm", dpi = 300)
# Dodatki -------------------------------------------------------------------------------------


# Skupina delovnega mesta ---------------------------------------------------------------------

skupina.delovega.mesta.placa <- place.2010.2014.long %>%
  filter(placilo == "placa" & vrednost !=0) %>%
  group_by(leto, Skupina) %>%
  summarise(`Povprečna vrednost` = round(mean(`Povprečna vrednost`, na.rm=T),2)) %>%
  ungroup()

skupina.delovega.mesta.placa$leto <- as.factor(skupina.delovega.mesta.placa$leto)

g.povprecna.placa.skupina <- ggplot(skupina.delovega.mesta.placa, aes(x=Skupina, y=`Povprečna vrednost`)) +
  geom_bar(stat="identity") +
  geom_label(aes(label=paste(`Povprečna vrednost`, "€"))) +
  facet_wrap(~leto, nrow = 1) +
  labs(title = "Povprečna bruto mesečna plača po skupinah delovnega mesta",
       subtitle="",
       x="Skupina delovnega mesta",
       y="Povprečno bruto plača v €",
       caption = "Vir podatkov:\nhttps://podcrto.si/podatkovne-zbirke/\nhttp://resources.podcrto.si/dodatkizaobjavo.rar") +
  datacook_theme()

ggsave("./Place/grafi/g.povprecna.placa.skupina.png", g.povprecna.placa.skupina, width = 306, height = 142, units = "mm", dpi = 300)
# Skupina delovnega mesta ---------------------------------------------------------------------


save.image(file = "./Place/data/Poslanske_place.RData")
