

# loading reuiqred libraries

library(RODBC)
library(pocr)

# con <- odbcConnect("annie")
# con <- odbcConnect("review_annie")
con <- odbcConnect("test_annie")

# The purpose of this script is to centralize the process of updating the portal-content sub directories which include:
#   - content
#     - graphs
#       - RMarkdown
#     - maps
#       - RMarkdown
#     - national-trends
#       - RMarkdown
#     - pages
#     - reports
#   - data
#     - county-reports
#     - dashboard
#     - graphs
#     - maps
#       - geography
#     - shiny
#     - spaghetti

# getting current working directory

cur_dir <- getwd()

############
## GRAPHS ##
############

# Update content for graphs

rmd_to_md(base_path = 'content/graphs')

##########
## MAPS ##
##########

# Maps use csvs and need those updated before the content can be updated

# Update data for maps

source('data/maps/update_maps_data.R')

# Update content for maps

rmd_to_md(base_path = 'content/maps')

#####################
## NATIONAL TRENDS ##
#####################

# Update content for national trends

rmd_to_md(base_path = 'content/national-trends')

####################
## COUNTY REPORTS ##
####################

# Getting directory for county reports

county_rep_dir <- paste(str_remove(cur_dir, '/portal-content'), 'countyreports/reports', sep = '/')

setwd(county_rep_dir)

# run county reports code

source("template_write_reports.R")

# move county report pdfs to portal-content/data/county-reports

files <- list.files(pattern = 'county_report_[A-z][a-z]+.pdf|county_report_[A-z][a-z]+ [A-z][a-z]+.pdf')

for (i in 1:length(files)){
  file.copy(from = files[i], to = paste(cur_dir, "data/county-reports", sep = "/"), overwrite = TRUE) 
}

# return to root directory

setwd(cur_dir)

###############
## DASHBOARD ##
###############

con <- odbcConnect("test_annie")

dashboard_json <- get_site_dashboard_data(con = con)

dashboard_dir <- "data/dashboard"

write(dashboard_json, paste(dashboard_dir, "dashboard.json", sep = "/"))


