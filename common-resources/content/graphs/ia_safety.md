{  
   "title":"Screened-In Re-Reports",
   "subtitle":"Following an Investigation or Assessment",
   "img":"",
   "type":"visualization",
   "visualizationType":"graph",
   "tags":[  
      "safety",
      "investigations and assessments",
      "out-of-home",
      "foster care",
      "age",
      "cohort",
      "county",
      "race/ethnicity"
   ],
   "blurb":"Investigations/assessments that have a subsequent screened-in report.",
   "slug":"ia-re-reports",
   "unit":"Percent",
   "config":{  
      "table":"sp_ia_safety",
      "transform":{  
         "Function":"daterow",
         "dateField":"Months Since Screened-In Investigation/Assessment",
         "valueFields":[  
            "Percent"
         ],
         "removeFields":[],
         "table":"sp_ia_safety"
      },
      "controls":[  
         "qry_type_first_unique_ia_safety",
         "cohort_year_ia_safety"
      ],
      "params":[  
         "ageSib",
         "ethnicityCensus",
         "Ref_Serv_County",
         "reporter_type",
         "access_type",
         "allegation",
         "finding"
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
         16
      ],
      "returnRowDateHeaders":[],
      "returnRowControlHeaders":[],
      "headerNames":[  
         "&nbsp;",
         "qry_type*qry_type_first_unique_ia_safety",
         "Cohort Period*cohort_year_ia_safety",
         "Age Grouping=ageSib",
         "Race/Ethnicity",
         "County=Ref_Serv_County",
         "Reporter Desc=reporter_type",
         "Access type desc=access_type",
         "Allegation=allegation",
         "Finding=finding"
      ],
      "returnRowStart":17,
      "hideRow":"allEmpty",
      "chartType":"line",
      "labels":{  
         "x":"Months Since Screened-In Investigation/Assessment",
         "y":"",
         "yFormat":"##'%"
      },
      "numberFormat":{  
         "fractionDigits":2,
         "suffix":"%"
      }
   }
}

### Data Highlights

<div class="stat">
    <h4>12 Months since 1st Investigation</h4>
    <p>24%</p>
</div>

<div class="stat">
    <h4>24 Months since 1st Investigation</h4>
    <p>33%</p>
</div>

<div class="stat">
    <h4>36 Months since 1st Investigation</h4>
    <p>37%</p>
</div>

### Summary

This graph follows a cohort of households with screened-in reports of child abuse/neglect to see if they had another screened-in report.

#### See also

- [Investigation & Assessments (Count)](https://portal.cssat.org/visualizations/ia-counts), for total counts of investigations & assessments (i.e., households with screened-in reports).

- [Investigations & Assessments (Rate)](https://portal.cssat.org/visualizations/ia-rates), for
population-based rates of investigations & assessments (i.e., households with screened-in reports).

### Notes

All households with a screened-in report of concerns for child safety receive a CPS investigation or are assessed for other services.
