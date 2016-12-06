library(tidyverse)
library(forcats)
library(tidyr)
library(viridis)
#library(ggiraphExtra)
#library(ggiraph)
load(file = "./data/Place_2010_2014.RData")
source("./functions/ggplot_tema.R")

poslanci <- place.2010.2014.long %>%
  filter(opis_delovnega_mesta_z370opis == "POSLANEC" & placilo == "placa" & vrednost > 0)

poslanci$leto <- as.factor(poslanci$leto)

poslanci.povprecna.placa.leto <- poslanci %>%
  group_by(leto) %>%
  summarize(povprecna.placa = round(mean(`Povprečna vrednost`, na.rm= T),0)) %>%
  select(leto, `Povprečna vrednost` = povprecna.placa) %>%
  ungroup()

g.povprecna.placa <- ggplot(poslanci.povprecna.placa.leto, aes(x=leto, y=`Povprečna vrednost`)) +
  geom_bar(stat="identity") +
  geom_label(aes(label=paste(`Povprečna vrednost`, "€"))) +
  labs(title = "Povprečna mesečna plača poslanca po letih",
       subtitle="",
       x = "Leto",
       y="Povprečna bruto plača v €",
       caption = "Vir podatkov:\nhttps://podcrto.si/podatkovne-zbirke/\nhttp://resources.podcrto.si/dodatkizaobjavo.rar") +
  datacook_theme()

ggsave("./Place/grafi/g.povprecna.placa.png", g.povprecna.placa, width = 306, height = 142, units = "mm", dpi = 300)


g01.povprecna.placa <- ggplot(poslanci, aes(x=leto, y=`Povprečna vrednost`)) +
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

ggsave("./Place/grafi/g01.povprecna.placa.png", g01.povprecna.placa, width = 306, height = 142, units = "mm", dpi = 300)

povprecna.izplacila.dodatkov <- place.2010.2014.long %>%
  filter(placilo != "placa" & vrednost !=0) %>%
  group_by(placilo, leto) %>%
  summarise(`Povprečna vrednost` = round(mean(`Povprečna vrednost`, na.rm=T),2)) %>%
  ungroup()


g02.povprecna.izplacila.dodatkov <- povprecna.izplacila.dodatkov %>%
  filter(leto == "2010") %>%
  ggplot(., aes(x=placilo, y=`Povprečna vrednost`)) +
  geom_bar(stat="identity") +
  facet_wrap(~leto, scales = "free", nrow = 1) +
  geom_label(aes(label=`Povprečna vrednost`)) +
  labs(title = "",
       subtitle="",
       x = "",
       y="",
       caption = "Vir podatkov:\nhttps://podcrto.si/podatkovne-zbirke/\nhttp://resources.podcrto.si/dodatkizaobjavo.rar") +
  datacook_theme() +
  theme(legend.title = element_blank(),
        legend.position = "bottom",
        legend.direction = "horizontal",
        axis.text.x = element_text(size = 10, angle = 45, hjust = 1))

ggsave("./Place/grafi/g02.povprecna.izplacila.dodatkov.png", g02.povprecna.izplacila.dodatkov, width = 306, height = 142, units = "mm", dpi = 300)




skupina.delovega.mesta <- place.2010.2014 %>%
  mutate(povprecna.placa = placa / mesecev) %>%
  group_by(Skupina) %>%
  summarize(povprecna.placa = round(mean(povprecna.placa, na.rm= T),0)) %>%
  select(Skupina, `Povprečna bruto plača v €` = povprecna.placa)



g.povprecna.placa.skupina <- ggplot(skupina.delovega.mesta, aes(x=Skupina, y=`Povprečna bruto plača v €`)) +
  geom_bar(stat="identity") +
  geom_label(aes(label=paste(`Povprečna bruto plača v €`, "€"))) +
  labs(title = "Povprečna mesečna plača po skupinah delovnega mesta",
       subtitle="",
       caption = "Vir podatkov:\nhttps://podcrto.si/podatkovne-zbirke/\nhttp://resources.podcrto.si/dodatkizaobjavo.rar") +
  datacook_theme()

ggsave("./Place/grafi/g.povprecna.placa.skupina.png", g.povprecna.placa.skupina, width = 306, height = 142, units = "mm", dpi = 300)



## povprečna izplačila dodatkov
izplacila <- povprecna.izplacila %>%
  filter(placilo != "placa") %>%
  select(placilo, leto, vrednost = `Povprečna vrednost`)


izplacila <- as.data.frame(izplacila)


ggplot(data = izplacila, aes(x=leto, y=vrednost)) +
  geom_bar(stat = "identity") +
  coord_flip() +
  facet_wrap(~placilo,scales = "free")


save.image(file = "./Place/data/Poslanske_place.RData")
