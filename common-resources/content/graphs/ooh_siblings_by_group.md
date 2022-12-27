{
	"title": "Siblings Placed Together (By Number of Siblings)",
	"subtitle": "On the First Day of the Year",
	"type": "visualization",
	"visualizationType": "graph",
	"tags": ["well-being",
	"siblings",
	"age",
	"county",
	"race/ethnicity"],
	"slug": "siblings-number",
	"related": ["sp_ooh_wb_siblings_by_year",
	"sp_mp_sibling_placement"],
	"blurb": "The percentage of children who are placed with all, some or none of their siblings on the first day of the year.",
	"Unit": "Percent",
	"config": {
		"table": "sp_ooh_wb_siblings_pvt",
		"controls": ["qry_type_first_all",
		"kincare",
		"yearPIT",
		"sib_plc_measure"],
		"params": ["pitAge",
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
		"dependency_cd"],
		"dateParams": [],
		"requiredParams": [],
		"showAllOthers": true,
		"returnRowHeaders": [0,
		1,
		3,
		5,
		7,
		9,
		11,
		13,
		15,
		17,
		19,
		21,
		23,
		25,
		27,
		29,
		31],
		"returnRowDateHeaders": [],
		"returnRowControlHeaders": [0,
		1],
		"headerNames": ["Year*yearPIT",
		"qry_type_poc1_first_all*qry_type_first_all",
		"Age Grouping=pitAge",
		"Race/Ethnicity=ethnicityCensus",
		"Gender=gender",
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
		"Finding=finding",
		"Placement Type=kincare",
		"measure_nbr*sib_plc_measure"],
		"returnRowStart": 33,
		"columnClusterSize": 4,
		"chartType": "column",
		"labels": {
			"x": "Sibling Group Size",
			"y": "",
			"yFormat": "##'%"
		},
		"hideRow": "allEmpty"
	}
}

### Data Highlights

<div class="stat">
    <h4>Two Siblings Together</h4>
    <p>73%</p>
</div>

<div class="stat">
    <h4>Five or More Siblings - All Together</h4>
    <p>19%</p>
</div>

<div class="stat">
    <h4>Five or More Siblings - Some Together</h4>
    <p>58%</p>
</div>

### Summary

This graph illustrates the percentage of children who were placed with all, some, or none of their siblings on the first day of the year. 

#### Questions this graph can answer

- For a group of siblings in a certain county, what was the likelihood they were be placed together?

- If two siblings were in out-of-home care, how likely were they to be placed together? What if there were three siblings?

#### See also

- [Placements in Family Settings](https://portal.cssat.org/visualizations/family-settings), for the percent of children placed in a family setting.

<!-- NOTE: measure is deprecated -->
<!-- - [Siblings Placed Together](https://portal.cssat.org/visualizations/sibling-care-days), for the length of time that siblings in out-of-home care were placed partially or entirely together. -->
