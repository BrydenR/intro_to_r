library(ggplot2)
library(dplyr)
library(data.table)


load("ggplot/suicides.rdata")
all_suicides <- copy(suicides)

suicides <- suicides %>%
  group_by(year, state, means) %>%
  mutate(deaths = sum(deaths))

## The Basics
bare <- ggplot(suicides)

## Adding plot aethetics
aethetics <- ggplot(suicides, aes(x=year, y=deaths))

## Adding points
scatter <- ggplot(suicides, aes(x=year, y=deaths)) + 
  geom_point()

## Split "mean" by color
color_by_means <- ggplot(suicides, aes(x=year, y=deaths, color=means)) + 
  geom_point()

## Facet by state
state_fact <- ggplot(suicides, aes(x=year, y=deaths, color=means)) + 
  geom_point() + 
  facet_wrap(~state, scales="free")

## Line plot
line_by_state <- ggplot(suicides, aes(x=year, y=deaths, color=means)) + 
  geom_line() + 
  facet_wrap(~state, scales="free")

## Bar plot
bar_plot <- ggplot(suicides, aes(x=year, y=deaths, color=means)) + 
  geom_bar(aes(fill=means), stat="identity") + 
  facet_wrap(~state, scales="free")
