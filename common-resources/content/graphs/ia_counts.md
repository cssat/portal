{  
   "title":"Investigations & Assessments (Count)",
   "subtitle":"",
   "img":"ia-trends-counts.png",
   "type":"visualization",
   "visualizationType":"graph",
   "tags":[  
      "safety",
      "investigations and assessments",
      "maltreatment",
      "cps",
      "age",
      "race/ethnicity",
      "entry point",
      "county",
      "allegation"
   ],
   "blurb":"Number of investigations into suspected child abuse or neglect.",
   "slug":"ia-counts",
   "unit":"Count of Households",
   "config":{  
      "table":"sp_ia_trends_counts",
      "transform":{  
         "Function":"daterow",
         "dateField":"Date",
         "valueFields":[  
            "Opened Investigations & Assessments"
         ],
         "removeFields":[  
            "Closed Investigations & Assessments"
         ]
      },
      "controls":[  
         "qry_type_poc2",
         "date_type"
      ],
      "params":[  
         "dynamicMonthStart",
         "ageSib",
         "ethnicityCensus",
         "Ref_Serv_County",
         "reporter_type",
         "access_type",
         "allegation",
         "finding"
      ],
      "requiredParams":[  
         "dynamicMonthStart"
      ],
      "dateParams":[  

      ],
      "returnRowHeaders":[  
         1,
         2,
         4,
         6,
         8,
         10,
         12,
         14,
         16
      ],
      "returnRowDateHeaders":[  
         0
      ],
      "returnRowControlHeaders":[  
         1,
         2
      ],
      "headerNames":[  
         " ",
         "*qry_type_poc2",
         "Age Grouping=ageSib",
         "Race/Ethnicity",
         "County=Ref_Serv_County",
         "Reporter Desc=reporter_type",
         "Access type desc=access_type",
         "Allegation=allegation",
         "Finding=finding"
      ],
      "returnRowStart":17,
      "columnClusterSize":2,
      "showAllOthers":true,
      "chartType":"line",
      "labels":{  
         "x":"",
         "y":"",
         "yFormat":"##'"
      },
      "numberFormat":{  
         "fractionDigits":2,
         "suffix":""
      }
   }
}

### Data Highlights

<div class="stat">
    <h4>Recent: 2019</h4>
    <p>49,265</p>
</div>

<div class="stat">
    <h4>Low: 2008</h4>
    <p>43,347</p>
</div>

<div class="stat">
    <h4>High: 2018</h4>
    <p>49,580</p>
</div>

### Summary

This graph examines investigations of reported child abuse and/or neglect. It
shows the count of households that had at least one child reported, screened-in,
and investigated.

#### Questions this graph can answer

- How many investigations occurred each year or quarter?

- Which counties had the most investigations in a given year?

- Which race/ethnicities had the most investigations in a given year?

#### See also

- [Investigations & Assessments (Rate)](https://portal.cssat.org/visualizations/ia-rates), for a population-based rate of these data.

- [Households with Children Re-Reported](https://portal.cssat.org/visualizations/ia-re-reports), for
how often households with investigated children are later reported again.

### Notes

All households with a screened-in report of concerns for child safety receive a CPS investigation or are assessed for other services, so the number of *investigations and assessments* will be equivalent to the number of *screened-in reports*.
