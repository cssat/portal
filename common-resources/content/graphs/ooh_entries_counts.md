{  
   "title":"Entering Out-of-Home Care (Count)",
   "subtitle":"During a Year or Quarter",
   "img":"",
   "type":"visualization",
   "visualizationType":"graph",
   "tags":[  
      "out-of-home",
      "foster care",
      "county",
      "age",
      "race/ethnicity"
   ],
   "keywords":[
      "enter",
      "entering",
      "entry"
   ],
   "blurb":"Count of children who entered out-of-home care during a year or quarter.",
   "slug":"ooh-entry-counts",
   "unit":"Count",
   "config":{  
      "table":"sp_ooh_flow_entries_counts",
      "transform":{  
         "Function":"daterow",
         "dateField":"Cohort Period",
         "valueFields":[  
            "Number of Entries"
         ],
         "removeFields":[]
      },
      "controls":[  
         "qry_type_entries",
         "date_type"
      ],
      "params":[  
         "dynamicMonthStart",
         "ageCensus",
         "ethnicityCensus",
         "gender",
         "initSetng",
         "longSetng",
         "removalCounty",
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
         "qry_type_poc1*qry_type_entries",
         "Age Grouping=ageCensus",
         "Gender=gender",
         "Race/Ethnicity",
         "Initial Placement=initSetng",
         "Longest Placement=longSetng",
         "County=removalCounty",
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
    <h4>Recent: 2019</h4>
    <p>5,532</p>
</div>

<div class="stat">
    <h4>Low: 2019</h4>
    <p>5,532</p>
</div>

<div class="stat">
    <h4>High: 2000</h4>
    <p>8,204</p>
</div>

### Summary

This graph represents the yearly or quarterly total of children (as opposed to households) who entered out-of-home care.

#### Questions this graph can answer

- How many children from Spokane County entered out-of-home care in 2014?

- In 2014, how many children under age 5 entered out-of-home care?

- Which year had the most children enter out-of-home care? The fewest?

#### See also

- [Children Entering Out-of-Home Care (Rate)](https://portal.cssat.org/visualizations/ooh-entry-rates), for the same data by rate.

- [Children in Out-of-Home Care (Count)](https://portal.cssat.org/visualizations/ooh-counts), for the count of children in out-of-home care at a particular point in time.


### Notes

All episodes of out-of-home care have been included by default. Use the advanced filter, *duration of out-of-home stay*, to exclude short episodes. 





