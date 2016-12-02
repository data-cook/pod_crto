download.file("http://resources.podcrto.si/dodatkizaobjavo.rar",
              destfile = "./data/dodatkizaobjavo.rar",mode = "wb")
#system('"c:\\Program Files\\WinRAR\\unrar.exe" e ./data/place_2014.rar')
system('"c:\\Program Files\\WinRAR\\unrar.exe" e ./data/dodatkizaobjavo.rar ./data')
