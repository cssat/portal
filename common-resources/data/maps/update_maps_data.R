
con <- odbcConnect("test_annie")

dir <- 'data/maps/'

######################
## Child Population ##
######################

pop_data_counties <- sqlQuery(con, 
"SELECT measurement_year AS date
	  , age_grouping_cd AS ageCensus
    , cd_race AS ethnicityCensus
    , county_cd AS geog
    , pop_cnt AS datacol
FROM test_annie.ref_lookup_census_population 
WHERE measurement_year BETWEEN 2006 
  AND 2019
	AND county_cd != 0
    AND pk_gndr = 0
ORDER BY measurement_year DESC 
	, age_grouping_cd
    , cd_race
    , county_cd;"
)

write.csv(x = pop_data_counties, paste0(dir, "ooh_population_counties.csv"), row.names = FALSE)

pop_data_regions <- sqlQuery(con, 
"SELECT measurement_year AS date
	  , age_grouping_cd AS ageCensus
    , cd_race AS ethnicityCensus
    , old_region_cd AS geog
    , SUM(pop_cnt) AS datacol
FROM test_annie.ref_lookup_census_population AS pop
LEFT JOIN test_annie.ref_lookup_county_region AS geo
	ON pop.county_cd = geo.county_cd
WHERE measurement_year BETWEEN 2006
  AND 2019
	AND old_region_cd != 0
    AND pk_gndr = 0
GROUP BY measurement_year 
	, age_grouping_cd
    , cd_race
    , old_region_cd
ORDER BY measurement_year DESC 
	, age_grouping_cd
    , cd_race
    , old_region_cd;"
)

write.csv(x = pop_data_regions, file = paste0(dir, "ooh_population_regions.csv"), row.names = FALSE)

##########################
## Household Population ##
##########################

hh_dat_counties <- sqlQuery(con,
"SELECT measurement_year AS date
	  ,cd_sib_age_grp AS ageSib
    ,cd_race AS ethnicityCensus
    ,county_cd AS geog
    ,pop_cnt AS datacol
FROM test_annie.prm_household_census_population
WHERE measurement_year BETWEEN 2006 AND 2019
    AND county_cd != 0
ORDER BY measurement_year DESC
    ,cd_sib_age_grp
    ,cd_race
    ,county_cd;"
)

write.csv(x = hh_dat_counties, file = paste0(dir, "ia_population_counties.csv"), row.names = FALSE)

hh_dat_regions <- sqlQuery(con, 
"SELECT measurement_year AS date
	  ,cd_sib_age_grp AS ageSib
    ,cd_race AS ethnicityCensus
    ,old_region_cd AS geog
    ,SUM(pop_cnt) AS datacol
FROM test_annie.prm_household_census_population AS pop
LEFT JOIN test_annie.ref_lookup_county_region AS geo
	ON pop.county_cd = geo.county_cd
WHERE measurement_year BETWEEN 2006 AND 2019
	AND old_region_cd != 0
GROUP BY measurement_year
	,cd_sib_age_grp
    ,cd_race
    ,old_region_cd
ORDER BY measurement_year DESC
	,cd_sib_age_grp
    ,cd_race
    ,old_region_cd;"
)

write.csv(x = hh_dat_regions, file = paste0(dir, "ia_population_regions.csv"), row.names = FALSE)

############
## IA Map ##
############

ia_query_counties <- stored_procedure(sp = "ia_trends_rates", age = 0:4, ethnicity = c(0:6, 8:12), county = 1:39)

ia_rates_opened_counties <- 
  sqlQuery(con, ia_query_counties) %>%
  filter(qry_type_poc2 == 2, date_type == 2) %>%
  select(date = Date
         , ageSib = age_grouping_cd
         , ethnicityCensus = ethnicity_cd
         , geog = county_cd
         , datacol = `Opened Investigations & Assessments`) %>%
  mutate(date = str_sub(date, start = 1, end = 4)) %>%
  filter(date %in% 2006:2019) %>%
  arrange(desc(date))

write.csv(x = ia_rates_opened_counties, file = paste0(dir, "ia_rates_opened_counties.csv"), row.names = FALSE)

ia_query_regions <- stored_procedure(sp = "ia_trends_counts", age = 0:4, ethnicity = c(0:6, 8:12), county = 1:39)

ia_rates_opened_regions <- 
  sqlQuery(con, ia_query_regions) %>%
  filter(qry_type_poc2 == 2, date_type == 2) %>%
  select(date = Date
         , ageSib = age_grouping_cd
         , ethnicityCensus = ethnicity_cd
         , county_cd
         , count = `Opened Investigations & Assessments`) %>%
  mutate(date = str_sub(date, start = 1, end = 4)
         ,date = as.integer(date)) %>% 
  left_join(select(ref_lookup_county_region
                   , county_cd
                   , old_region_cd)) %>%
  group_by(date
           , ageSib
           , ethnicityCensus
           , geog = old_region_cd) %>%
  summarise(count = sum(count)) %>%
  left_join(hh_dat_regions) %>%
  mutate(datacol = count / datacol * 1000) %>%
  select(-count) %>%
  arrange(desc(date))

write.csv(x = ia_rates_opened_regions, file = paste0(dir, "ia_rates_opened_regions.csv"), row.names = FALSE)

###################
## OOH Entry Map ##
###################

ooh_query_counties <- stored_procedure(sp = "ooh_flow_entries_rates", date = 2, age = 0:4, ethnicity = 0:12, county = 1:39)

ooh_entry_rates_counties <- 
  sqlQuery(con, ooh_query_counties) %>%
  filter(qry_type_poc1 == 2, date_type == 2) %>%
  select(date = `Cohort Period`
         , ageCensus = age_grouping_cd
         , ethnicityCensus = ethnicity_cd
         , geog = county_cd
         , datacol = `Rate of Entries`) %>%
  mutate(date = str_sub(date, start = 1, end = 4)) %>%
  filter(date %in% 2006:2019) %>%
  arrange(desc(date))

write.csv(x = ooh_entry_rates_counties, file = paste0(dir, "ooh_entry_rates_counties.csv"), row.names = FALSE)

ooh_query_regions <- stored_procedure(sp = "ooh_flow_entries_counts", date = 2, age = 0:4, ethnicity = 0:12, county = 1:39)

ooh_entry_rates_regions <- 
  sqlQuery(con, ooh_query_regions) %>%
  filter(qry_type_poc1 == 2, date_type == 2) %>%
  select(date = `Cohort Period`
         , ageCensus = age_grouping_cd
         , ethnicityCensus = ethnicity_cd
         , county_cd
         , count = `Number of Entries`) %>%
  mutate(date = str_sub(date, start = 1, end = 4)
         ,date = as.integer(date)
         ) %>%
  filter(date %in% 2006:2019) %>%
  left_join(select(ref_lookup_county_region
                   , county_cd
                   , old_region_cd)) %>%
  group_by(date
           , ageCensus
           , ethnicityCensus
           , geog = old_region_cd) %>%
  summarise(count = sum(count)) %>%
  arrange(desc(date)) %>%
  left_join(pop_data_regions) %>%
  mutate(datacol = count / datacol * 1000) %>%
  select(-count)

write.csv(x = ooh_entry_rates_regions, file = paste0(dir, "ooh_entry_rates_regions.csv"), row.names = FALSE)
