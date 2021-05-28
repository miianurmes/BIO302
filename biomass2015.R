library(readxl) # installed with tidyverse, but NOT loaded with library(tidyverse)
file <- "biomass2015.xls"
# find the names of the excel sheets
excel_sheets(path = file)

#import the desired sheet - imports the first by default
my_data <- read_excel(path = file, sheet = "Site L")
library(tidyverse)#purrr is part of tidyverse
my_data <- excel_sheets(path = "biomass2015.xls") %>%
  map_dfr(~read_excel(path = "biomass2015.xls", sheet =.x)) 


#Select relevant columns: Site, plot, production
my_data <- my_data %>%
  select(c(site, plot, production)) %>% #select columns from dataset
  dplyr::mutate(site = factor
                (site, levels = c("L", "M", "A", "H"))) %>% #make r recognise site as 4 levels
  group_by(site, plot) %>%  #group the variables by site and by plot
  summarise(Biomass = sum(production, na.rm = T)) #command r to calculate the sum of biomass(=production) by plot and by size

#plot
p1<- ggplot(my_data, aes (x=site, y=Biomass, colour=site))+
  geom_boxplot()
p1

##28.5 Git install 

# install.packages(usethis)
# library(usethis)
# use_git_config(user.name = "miianurmes", user.email = "miia.nurmesniemi@gmail.com") 
# create_github_token()
# gitcreds::gitcreds_set()
# use_git()
# #use_github()
