{  
   "title":"Children in Out-of-Home Care (Count)",
   "subtitle":"On the First Day of the Year or Quarter",
   "img":"",
   "type":"visualization",
   "visualizationType":"graph",
   "tags":[
      "permanency",
      "out-of-home",
      "county",
      "foster care",
      "age",
      "race/ethnicity"
   ],
   "blurb":"Total count of out-of-home children on the first day of the year or quarter.",
   "slug":"ooh-counts",
   "unit":"Count",
   "config":{  
      "table":"sp_ooh_pit_counts",
      "transform":{  
         "Function":"daterow",
         "dateField":"Date",
         "valueFields":[  
            "Total in Out-of-Home Care 1st Day"
         ],
         "removeFields":[]
      },
      "controls":[  
         "qry_type_first_all",
         "date_type_pit"
      ],
      "params":[  
         "dynamicMonthStart",
         "pitAgeCensus",
         "ethnicityCensus",
         "gender",
         "initSetng",
         "longSetng",
         "pitCounty",
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
      "requiredParams":[  
         "dynamicMonthStart"
      ],
      "showAllOthers":true,
      "returnRowHeaders":[  
         0,
         1,
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
         30
      ],
      "returnRowDateHeaders":[  
         0
      ],
      "returnRowControlHeaders":[  
         1
      ],
      "headerNames":[  
         "&nbsp;",
         "*qry_type_first_all",
         "Age Grouping=pitAgeCensus",
         "Gender=gender",
         "Race/Ethnicity",
         "Initial Placement=initSetng",
         "Longest Placement=longSetng",
         "County=pitCounty",
         "Dependency=dependency_cd",
         "Length of Service Desc=ooh_los",
         "Placement Count Desc=nbr_placement",
         "In-Home Service Desc=ihs_services_ooh",
         "Reporter Desc=reporter_type",
         "Access type desc=access_type",
         "Allegation=allegation",
         "Finding=finding"
      ],
      "returnRowStart":31,
      "hideRow":"allEmpty",
      "chartType":"line",
      "labels":{  
         "x":"",
         "y":""
      },
      "numberFormat":{  
         "fractionDigits":0
      }
   }
}

### Data Highlights

<div class="stat">
    <h4>January 01, 2020</h4>
    <p>8,108</p>
</div>

<div class="stat">
    <h4>January 01, 2000</h4>
    <p>8,940</p>
</div>

### Summary

This graph examines the total count of children who were in out-of-home care on the first day of each year or quarter. 

#### Questions this graph can answer

- How many children were in out-of-home care on a specific day?

- Which years since 2000 had the most and the fewest children in out-of-home care on January 1?

#### See also

- [Children Entering Out-of-Home Care (Counts)](https://portal.cssat.org/visualizations/ooh-entry-counts), for the number of children who entered out-of-home care each year.

- [Children in Out-of-Home Care (Rates)](https://portal.cssat.org/visualizations/ooh-rates), for the number of children in out-of-home care per 1,000 children in the general population.

### Notes

 To filter for longer episode durations, use the advanced filter *duration of out-of-home stay*.

