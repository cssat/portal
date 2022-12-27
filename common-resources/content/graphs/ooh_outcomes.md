{  
   "title":"Permanency Outcomes (Cohort)",
   "subtitle":"Year-Long Out-of-Home Entry Cohort",
   "img":"ooh-outcomes.png",
   "type":"visualization",
   "visualizationType":"graph",
   "tags":[
      "permanency",
      "cohort",
      "age",
      "race/ethnicity",
      "placement setting",
      "allegation",
      "county",
      "adoption",
      "reunification"
   ],
   "keywords": [
      "exits",
      "guardianship",
      "emancipation"
   ],
   "blurb":"Following an out-of-home cohort to see the timing of permanency outcomes (reunification, adoption, guardianship, emancipation).",
   "slug":"permanency-cohort",
   "Unit":"Percent",
   "config":{  
      "table":"sp_ooh_outcomes",
      "transform":{  
         "Function":"daterow",
         "dateField":"Months Since Entering Out-of-Home Care",
         "valueFields":[  
            "Percent"
         ],
         "removeFields":[]
      },
      "controls":[  
         "qry_type_first_unique_ooh_outcomes",
         "discharge_type_outcomes",
         "cohort_year"
      ],
      "params":[  
         "ageEntry",
         "ethnicityCensus",
         "gender",
         "initSetng",
         "longSetng",
         "exitCounty",
         "ooh_los",
         "nbr_placement",
         "ihs_services_ooh",
         "reporter_type",
         "access_type",
         "allegation",
         "finding",
         "dependency_cd"
      ],
      "dateParams":[],
      "requiredParams":[],
      "showAllOthers":true,
      "returnRowHeaders":[  
         0,
         1,
         2,
         4,
         6,
         8,
         10,
         12,
         14,
         16,
         18,
         20,
         22,
         24,
         26,
         28,
         30,
         31
      ],
      "returnRowDateHeaders":[],
      "returnRowControlHeaders":[  
         1,
         2
      ],
      "headerNames":[  
         " ",
         "Cohort Period*cohort_year",
         "qry_type_poc1_first_unique*qry_type_first_unique_ooh_outcomes",
         "Age Grouping=ageEntry",
         "Race/Ethnicity",
         "Gender=gender",
         "Initial Placement=initSetng",
         "Longest Placement=longSetng",
         "County=exitCounty",
         "Dependency=dependency_cd",
         "Length of Service Desc=ooh_los",
         "Placement Count Desc=nbr_placement",
         "In-Home Service Desc=ihs_services_ooh",
         "Reporter Desc=reporter_type",
         "Access type desc=access_type",
         "Allegation=allegation",
         "Finding=finding",
         "cd_discharge_type*discharge_type_outcomes"
      ],
      "returnRowStart":33,
      "hideRow":"allEmpty",
      "chartType":"line",
      "labels":{  
         "x":"Months Since Entering Out-of-Home Care",
         "y":""
      },
      "numberFormat":{  
         "fractionDigits":2,
         "suffix":"%"
      }
   }
}

### Data Highlights

<div class="stat">
    <h4>36 Months After Entering Care</h4>
    <p>Still in Care: 19%</p>
</div>

<div class="stat">
    <h4></h4>
    <p>Reunified: 58%</p>
</div>

<div class="stat">
    <h4></h4>
    <p>Adopted: 14%</p>
</div>

### Summary

This graph follows cohorts of children who entered out-of-home care in a given year to determine how long they spent in care and what permanency outcome they achieved.

#### Questions this graph can answer

- How long have children spent in out-of-home care in various years?

- How has the speed of adoption compared to the speed of reunification?

#### See also

- [Out-of-Home Entry Counts](https://portal.cssat.org/visualizations/ooh-entry-counts), for the count of children and youth in a given entry cohorts.

<!-- NOTE: measure is deprecated -->
<!-- - [Timely Permanency](https://portal.cssat.org/visualizations/timely-permanency), for a simplified view of permanency rates within one year of entering care. -->

- [Permanency Counts](https://portal.cssat.org/visualizations/permanency-counts), for raw counts of children achieving permanency each year.

### Notes

A *trial return home* is not counted as an exit for this measure.

If you select a more recent year (i.e., a year less than 48 months ago), the plot line will be truncated due to shorter follow-up time.
