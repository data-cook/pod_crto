datacook_theme <- function(base_size = 12, base_family = "Roboto Condensed") { #Roboto Calibri Light
  update_geom_defaults("bar", list(fill = "deepskyblue"))
  update_geom_defaults("line", list(colour = "azure", size = 1))
  update_geom_defaults("point", list(colour = "lightsteelblue", size = 4))
  update_geom_defaults("text", list(colour = "white", size = 3.5, family = base_family))
  update_geom_defaults("label", list(colour = "gray20", fill = "gray80", size = 3.5, family = base_family))
  theme(
    line =               element_line(colour = "azure", size = 1, linetype = 1,
                                      lineend = "butt"),
    rect =               element_rect(fill = "white", colour = "black", size = 0.5, linetype = 1),
    text =               element_text(family = base_family, face = "plain",
                                      colour = "white", size = base_size,
                                      hjust = 0.5, vjust = 0.5, angle = 0, lineheight = 0.9,
                                      debug = F,margin = unit(0.5, "lines")),
    
    axis.text =          element_text(size = rel(0.8), colour = "white", margin = unit(0.5, "lines")),
    strip.text =         element_text(size = rel(0.8), colour = "white"),
    #axis.line =          element_blank(),
    axis.line =          element_line(color = "gray70"),
    axis.text.x =        element_text(vjust = 1),
    axis.text.y =        element_text(hjust = 1),
    axis.ticks =         element_line(colour = "white", size = 0.2),
    axis.title =         element_text(colour = "white", face = "bold", size = rel(0.9)),
    axis.title.x =       element_text(hjust = 0, vjust = 1, margin = margin(10,1,1,1)),
    axis.title.y =       element_text(hjust = 0, angle = 90, margin = margin(1,10,1,1)),
    axis.ticks.length =  unit(0.3, "lines"),
    
    legend.background =  element_rect(colour = NA, fill = "gray30"),
    legend.spacing =      unit(0.2, "cm"),
    legend.key =         element_rect(fill = "gray30", colour = "gray30"),
    legend.key.size =    unit(1.2, "lines"),
    legend.key.height =  NULL,
    legend.key.width =   NULL,
    legend.text =        element_text(size = rel(0.8), colour = "white"),
    legend.text.align =  NULL,
    legend.title =       element_text(size = rel(0.8), face = "bold", hjust = 0, colour = "white"),
    legend.title.align = NULL,
    legend.position =    "right",
    legend.direction =   "vertical",
    legend.justification = "center",
    legend.box =         NULL,
    
    panel.background =   element_rect(fill = "gray20", colour = "gray20"),
    panel.border =       element_rect(fill = NA, colour = NA),
    panel.grid.major =   element_blank(),
    panel.grid.minor =   element_blank(),
    panel.spacing =      unit(0.25, "lines"),
    
    strip.background =   element_rect(fill = "grey40", colour = "grey20"),
    strip.text.x =       element_text(size = rel(1.2), face = "bold"),
    strip.text.y =       element_text(size = rel(1.2), face = "bold", angle = 0),

    
    plot.background =    element_rect(colour = "gray20", fill = "gray20"),
    plot.title =         element_text(size = rel(1.25), face = "bold", margin = margin(0,0,5,0)),
    plot.subtitle =      element_text(size = rel(0.95), margin = margin(0,0,10,0)),
    plot.caption =       element_text(size = rel(0.8), face = "italic", margin = margin(5,0,0,0)),
    plot.margin =        unit(c(1, 1, 0.5, 0.5), "lines")
  )
}


xkcd_dark_theme <- function(base_size = 12, base_family = "xkcd") { #Roboto Calibri Light
  update_geom_defaults("bar", list(fill = "deepskyblue"))
  update_geom_defaults("line", list(colour = "azure", size = 1))
  update_geom_defaults("point", list(colour = "lightsteelblue", size = 4))
  update_geom_defaults("text", list(colour = "white", size = 3.5, family = base_family))
  update_geom_defaults("label", list(colour = "gray20", fill = "gray80", size = 3.5, family = base_family))
  theme(
    line =               element_line(colour = "azure", size = 1, linetype = 1,
                                      lineend = "butt"),
    rect =               element_rect(fill = "white", colour = "black", size = 0.5, linetype = 1),
    text =               element_text(family = base_family, face = "plain",
                                      colour = "white", size = base_size,
                                      hjust = 0.5, vjust = 0.5, angle = 0, lineheight = 0.9,
                                      debug = F,margin = unit(0.5, "lines")),
    
    axis.text =          element_text(size = rel(0.8), colour = "white", margin = unit(0.5, "lines")),
    strip.text =         element_text(size = rel(0.8), colour = "white"),
    #axis.line =          element_blank(),
    axis.line =          element_line(color = "gray70"),
    axis.text.x =        element_text(vjust = 1),
    axis.text.y =        element_text(hjust = 1),
    axis.ticks =         element_line(colour = "white", size = 0.2),
    axis.title =         element_text(colour = "white", face = "bold", size = rel(0.9)),
    axis.title.x =       element_text(hjust = 0, vjust = 1, margin = margin(10,1,1,1)),
    axis.title.y =       element_text(hjust = 0, angle = 90, margin = margin(1,10,1,1)),
    axis.ticks.length =  unit(0.3, "lines"),
    
    legend.background =  element_rect(colour = NA, fill = "gray30"),
    legend.spacing =      unit(0.2, "cm"),
    legend.key =         element_rect(fill = "gray30", colour = "gray30"),
    legend.key.size =    unit(1.2, "lines"),
    legend.key.height =  NULL,
    legend.key.width =   NULL,
    legend.text =        element_text(size = rel(0.8), colour = "white"),
    legend.text.align =  NULL,
    legend.title =       element_text(size = rel(0.8), face = "bold", hjust = 0, colour = "white"),
    legend.title.align = NULL,
    legend.position =    "right",
    legend.direction =   "vertical",
    legend.justification = "center",
    legend.box =         NULL,
    
    panel.background =   element_rect(fill = "gray20", colour = "gray20"),
    panel.border =       element_rect(fill = NA, colour = NA),
    panel.grid.major =   element_blank(),
    panel.grid.minor =   element_blank(),
    panel.spacing =      unit(0.25, "lines"),
    
    strip.background =   element_rect(fill = "grey40", colour = "grey20"),
    strip.text.x =       element_text(size = rel(1.2), face = "bold"),
    strip.text.y =       element_text(size = rel(1.2), face = "bold", angle = 0),
    
    
    plot.background =    element_rect(colour = "gray20", fill = "gray20"),
    plot.title =         element_text(size = rel(1.25), colour = "lightsteelblue", face = "bold", margin = margin(0,0,5,0)),
    plot.subtitle =      element_text(size = rel(0.95), colour = "lightsteelblue", margin = margin(0,0,10,0)),
    plot.caption =       element_text(size = rel(0.8), colour = "lightsteelblue", face = "italic", margin = margin(5,0,0,0)),
    plot.margin =        unit(c(1, 1, 0.5, 0.5), "lines")
  )
}

xkcd_white_theme <- function(base_size = 12, base_family = "xkcd") { #Roboto Calibri Light
  update_geom_defaults("bar", list(fill = "deepskyblue"))
  update_geom_defaults("line", list(colour = "azure", size = 1))
  update_geom_defaults("point", list(colour = "lightsteelblue", size = 4))
  update_geom_defaults("text", list(colour = "black", size = 3.5, family = base_family))
  update_geom_defaults("label", list(colour = "gray20", fill = "gray80", size = 3.5, family = base_family))
  theme(
    line =               element_line(colour = "azure", size = 1, linetype = 1,
                                      lineend = "butt"),
    rect =               element_rect(fill = "white", colour = "black", size = 0.5, linetype = 1),
    text =               element_text(family = base_family, face = "plain",
                                      colour = "black", size = base_size,
                                      hjust = 0.5, vjust = 0.5, angle = 0, lineheight = 0.9,
                                      debug = F,margin = unit(0.5, "lines")),
    axis.text =          element_text(size = rel(0.8), colour = "black", margin = unit(0.5, "lines")),
    strip.text =         element_text(size = rel(0.8), colour = "white"),
    axis.line =          element_blank(),
    #axis.line =          element_line(color = "gray70"),
    axis.text.x =        element_text(vjust = 1),
    axis.text.y =        element_text(hjust = 1),
    axis.ticks =         element_line(colour = "black", size = 0.2),
    axis.title =         element_text(colour = "black", face = "bold", size = rel(0.9)),
    axis.title.x =       element_text(hjust = 0, vjust = 1, margin = margin(10,1,1,1)),
    axis.title.y =       element_text(hjust = 0, angle = 90, margin = margin(1,10,1,1)),
    axis.ticks.length =  unit(0.3, "lines"),
    
    legend.background =  element_rect(colour = NA),
    legend.spacing =      unit(0.2, "cm"),
    legend.key =         element_rect(fill = "white", colour = "white"),
    legend.key.size =    unit(1.2, "lines"),
    legend.key.height =  NULL,
    legend.key.width =   NULL,
    legend.text =        element_text(size = rel(0.8), colour = "black"),
    legend.text.align =  NULL,
    legend.title =       element_text(size = rel(0.8), face = "bold", hjust = 0, colour = "black"),
    legend.title.align = NULL,
    legend.position =    "right",
    legend.direction =   "vertical",
    legend.justification = "center",
    legend.box =         NULL,
    
    panel.background =   element_rect(fill = "white", colour = "black"),
    panel.border =       element_rect(fill = NA, colour = "gray70"),
    panel.grid.major =   element_blank(),
    panel.grid.minor =   element_blank(),
    panel.spacing =      unit(0.25, "lines"),
    
    strip.background =   element_rect(fill = "grey40", colour = "grey10"),
    strip.text.x =       element_text(size = rel(1.2), face = "bold"),
    strip.text.y =       element_text(size = rel(1.2), face = "bold", angle = 0),
    
    plot.background =    element_rect(colour = "white", fill = "white"),
    plot.title =         element_text(size = rel(1.25), face = "bold", margin = margin(0,0,5,0)),
    plot.subtitle =      element_text(size = rel(0.95), margin = margin(0,0,10,0)),
    plot.caption =       element_text(size = rel(0.8), face = "italic", margin = margin(5,0,0,0)),
    plot.margin =        unit(c(1, 1, 0.5, 0.5), "lines")
  )
}


datacook.colors <- c("#022245","#0D3D70","#004F80","#22558C","#00619E",
                     "#0070B5","#0084D6","#008EE6","#36689E","#5081B5",
                     "#6792AB","#73A2BD","#86B4CF","#9FC2D6","#B8D0DE",
                     "#96B4EB","#A0BAEB","#A4BDEB","#B3C7EB","#C7D4EB")


colors.blue <- c("blue4", "blue3", "blue2", "blue1", "blue",
                 "slateblue", "slateblue1", "slateblue2", "slateblue3", "slateblue4",
                 "deepskyblue4", "deepskyblue3", "deepskyblue2", "deepskyblue1", "deepskyblue",
                 "skyblue4", "skyblue3", "skyblue2", "skyblue1", "skyblue",
                 "turquoise4", "turquoise3", "turquoise2", "turquoise1", "turquoise",
                 "cadetblue4", "cadetblue3", "cadetblue2", "cadetblue1", "cadetblue",
                 "lightsteelblue4", "lightsteelblue3", "lightsteelblue2", "lightsteelblue1", "lightsteelblue",
                 "azure4", "azure3", "azure2", "azure1", "azure")


library(extrafont)
windowsFonts(Calibri=windowsFont("TT Calibri"))
windowsFonts(Arial=windowsFont("TT Arial"))
windowsFonts(xkcd=windowsFont("TT xkcd"))
windowsFonts(FontAwesome=windowsFont("TT FontAwesome Regular"))
#windowsFonts(Roboto=windowsFont("TT Roboto"))
loadfonts()
#font_import()

#if (.Platform$OS.type == "windows") loadfonts("win")

