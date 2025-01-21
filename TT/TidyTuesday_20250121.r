# Tidy Tuesday task
# Author: Younes Laalou
# Date: 2025-01-21


# Task try to apply the data to visualise on a map

# Libraries

install.packages("devtools")



library(maps)
library(ggplot2)
library(sf)
library(tidyverse)
library(patchwork)





# Option 2: Read directly from GitHub


water_insecurity_2022 <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/main/data/2025/2025-01-28/water_insecurity_2022.csv')
water_insecurity_2023 <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/main/data/2025/2025-01-28/water_insecurity_2023.csv')




# Visualise the change from 2022 to 2023



# map 
USA <- sf::st_as_sf(map(database = "county", plot = FALSE, fill = TRUE))


# Process data to compare
# Use comma in name and ID to seperate

water_2022 <- water_insecurity_2022 |> 
  separate_wider_delim(
    name, 
    delim = ", ",
    names = c("county", "state")
  ) |>
  mutate(
    county = tolower(county),
    county = str_remove(county, " county"),
    state = tolower(state)
  )


water_2023 <- water_insecurity_2023 |> 
  separate_wider_delim(
    name, 
    delim = ", ",
    names = c("county", "state")
  ) |>
  mutate(
    across(c("county", "state"),
    tolower),
    county = str_remove(county, " county")
  )

#
USA_map <- USA |> 
  separate_wider_delim(
    ID,
    delim = ",",
    names = c("state", "county")
  )



# Join the datasets

USA_2022 <- left_join(USA_map, water_2022, by = join_by(state, county))

USA_2023 <- left_join(USA_map, water_2023, by = join_by(state, county))


# Check for changes 

sum(water_2023$percent_lacking_plumbing == water_2022$percent_lacking_plumbing, na.rm = TRUE)

# Visualise as plot

p1 <- ggplot() + 
  geom_sf(
    data = USA_2022, 
    aes(geometry = geom, 
    fill = percent_lacking_plumbing)) +
  theme_void()+
  scale_fill_continuous(
    na.value = "#ededed"
  )


p2 <- ggplot() + 
  geom_sf(
    data = USA_2023, 
    aes(geometry = geom, 
    fill = percent_lacking_plumbing)) +
  theme_void()+
  scale_fill_continuous(
    na.value = "#ededed"
  )

p1 / p2

sum(!is.na(USA_2022$plumbing))/nrow(USA_2022)



