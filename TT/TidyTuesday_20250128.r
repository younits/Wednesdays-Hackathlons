# Tidy Tuesday task
# Author: Younes Laalou
# Date: 2025-01-28
# Himalaya

library(ggplot2)
library(tidyverse)

# Data
exped_tidy <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/main/data/2025/2025-01-21/exped_tidy.csv')
peaks_tidy <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/main/data/2025/2025-01-21/peaks_tidy.csv')


# What is the distribution of climbing status (PSTATUS) across different mountain ranges (HIMAL_FACTOR)?

peaks_tidy$HIMAL_FACTOR <- as.factor(peaks_tidy$HIMAL_FACTOR)

bla <- peaks_tidy |> 
  count(HIMAL_FACTOR, PSTATUS) 



p <- ggplot(
  bla, aes(n, HIMAL_FACTOR, fill = as.factor(PSTATUS))
) +
geom_col(position = "dodge2") +
labs(
    title = "Distribution of climbing status (PSTATUS) across different mountain ranges (HIMAL_FACTOR)",
    x = "Amount of Climbs by category", y = NULL
)+
theme_bw() +
guides(fill=guide_legend(title = "PSTATUS"))



ggsave("distrub.png", p, height = 7, width = 5)



# Which mountain range (HIMAL_FACTOR) has the highest average peak height (HEIGHTM)?


range <- group_by(peaks_tidy, HIMAL_FACTOR)


haha <- summarise(range, av_height = mean(HEIGHTM))


max(haha$av_height)

idx <- which(haha$av_height == max(haha$av_height))

haha[9,]