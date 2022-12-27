
# External Script to point visualization scripts to the correct database

library(RODBC)

## @knitr con

con <- odbcConnect('test_annie')

# con <- odbcConnect('review_annie')

# con <- odbcConnect('annie')

# db <- 'annie'



