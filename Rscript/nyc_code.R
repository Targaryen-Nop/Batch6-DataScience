library(nycflights13)


# load data
data("flights")
flights

# glimpse data
glimpse(flights)

View(flights)

# filter September 9 
flights %>%
  filter(month == 9, day == 9)

flights %>%
  count(month) %>%
  summarise(mean(n))

## which carrier had most flights in May 2013
flights %>%
  filter(month == 5, year == 2013) %>%
  count(carrier) %>%
  arrange(desc(n)) %>%
  left_join(air, by = c("carrier" = "short_name") ) %>%
  head(5)

## HOMEWORK 01 - flights
## Five Business Question 

write_csv(flights, "flights.csv")







