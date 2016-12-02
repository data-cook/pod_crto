library(tidyverse)
library(forcats)
library(tidyr)
library(viridis)
load(file = "./data/Place_2010_2014.RData")
source("./functions/ggplot_tema.R")

poslanci <- place.2010.2014 %>%
  filter(opis_delovnega_mesta_z370opis == "POSLANEC" & mesecev != 0 & placa > 0)

poslanci <- poslanci %>%
  mutate(`Povprečna bruto plača v €` = placa / mesecev)

poslanci <- poslanci %>%
  rename(Leto = leto_obdobja)

poslanci$Leto <- as.factor(poslanci$Leto)

povprecna.placa.leto <- poslanci %>%
  mutate(povprecna.placa = placa / mesecev) %>%
  group_by(Leto) %>%
  summarize(povprecna.placa = round(mean(povprecna.placa, na.rm= T),0)) %>%
  select(Leto, `Povprečna bruto plača v €` = povprecna.placa)

g.povprecna.placa <- ggplot(povprecna.placa.leto, aes(x=Leto, y=`Povprečna bruto plača v €`)) +
  geom_bar(stat="identity") +
  geom_label(aes(label=paste(`Povprečna bruto plača v €`, "€"))) +
  labs(title = "Povprečna mesečna plača poslanca po letih",
       subtitle="",
       caption = "Vir podatkov:\nhttps://podcrto.si/podatkovne-zbirke/\nhttp://resources.podcrto.si/dodatkizaobjavo.rar") +
  datacook_theme()

ggsave("./Place/grafi/g.povprecna.placa.png", g.povprecna.placa, width = 306, height = 142, units = "mm", dpi = 300)



g01.povprecna.placa <- ggplot(poslanci, aes(x=Leto, y=`Povprečna bruto plača v €`)) +
  geom_violin(aes(fill = Leto)) +
  geom_jitter(height = 0,size = 1.5 ) +
  scale_fill_viridis(discrete = T, begin = 0.3, end = 0.6)+
  facet_wrap(~Leto, scales = "free_x", nrow = 1) +
  geom_label(data = povprecna.placa.leto, aes(x = Leto,
                                              label = paste("Povprečna plača\n",`Povprečna bruto plača v €`)))+
  labs(title = "Povprečna mesečna plača poslanca po letih",
       subtitle="",
       caption = "Vir podatkov:\nhttps://podcrto.si/podatkovne-zbirke/\nhttp://resources.podcrto.si/dodatkizaobjavo.rar",
       x = "Leto") +
  datacook_theme() +
  theme(legend.title = element_blank(),
        legend.position = "bottom",
        legend.direction = "horizontal")

ggsave("./Place/grafi/g01.povprecna.placa.png", g01.povprecna.placa, width = 306, height = 142, units = "mm", dpi = 300)



save.image(file = "./Place/data/Poslanske_place.RData")
