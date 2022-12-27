{  
   "title":"Investigations & Assessments (Rate)",
   "subtitle":"",
   "img":"",
   "type":"visualization",
   "visualizationType":"graph",
   "tags":[  
      "safety",
      "investigations and assessments",
      "maltreatment",
      "cps",
      "county",
      "race/ethnicity",
      "allegation"
   ],
   "blurb":"Rate of investigations into suspected child abuse or neglect.",
   "slug":"ia-rates",
   "unit":"Rate: Per 1,000 Households",
   "config":{  
      "table":"sp_ia_trends_rates",
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
      "hideRow":"allEmpty",
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
         "&nbsp;",
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
    <p>66</p>
</div>

<div class="stat">
    <h4>Low: 2008</h4>
    <p>57</p>
</div>

<div class="stat">
    <h4>High: 2018</h4>
    <p>67</p>
</div>

### Summary

This graph examines investigations and assessments of reported child abuse and/or neglect. It
shows how many households, per 1,000, had at least one screened-in report.

#### Questions this graph can answer

- Has the relative rate of households investigated changed over time?

- Which counties had the highest rates of investigation in a given year?

- Which races/ethnicities had the highest rates of investigation in a given year?

#### See also

- [Investigations & Assessments (Count)](https://portal.cssat.org/visualizations/ia-counts), for the
number of investigations and assessments.

- [Households with Children Re-Reported](https://portal.cssat.org/visualizations/ia-re-reports), for
the rate at which households with investigations/assessments were later reported again.

### Notes

All households with a screened-in report of concerns for child safety receive a CPS investigation or are assessed for other services, so the rate of investigations and assessments is a population-based rate of screened-in reports.
