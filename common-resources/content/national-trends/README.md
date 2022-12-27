# Spaghetti Plots Content

The files in this folder power individual visualizations (instances) of the [spaghetti plot framework](https://github.com/pocdata/spaghetti-plots). They also can be used to index these instances in the POC Data Portal website.

## Structure

Content files for the spaghetti plots include standard metadata and a handful of custom configuration options to make the plot run.

```
{
	"title": "Visualization title",
	"subtitle": "Visualization subtitle (optional)",
	"slug": "slug (corresponds to filename)",
	"tags": [],
	"config": {
		"fileName": "",
        "yLabel": "",
        "xLabel": "",
        "defaultName": "",
        "rankTextBegin": "",
        "rankTextMiddle": "",
        "rankTextEnd": ""
	}
}
```

Below is an explanation of each config option:

| Name          | Required       | Description
| ------------- | -------------- | ------------
| filename      | **Yes**        | The name of the file that holds the data for the visualization.
| yLabel        | No             | The Y axis label
| xLabel        | No             | The X axis label
| defaultName   | Yes            | The geographic entity that loads as the default for the visualization (usually "Washington")
| rankTextBegin | Yes            | The snippet of text before the first dynamic number/ranking
| rankTextMiddle | Yes           | The snippet of text between ranking numbers
| rankTextEnd   | Yes            | The snippet of text after the second ranking


### Rank blurb in depth

The blurb allows you to pick out the first and last number of each line with some contextualizing text. So if you are creating a visualization about rates of entry into out-of-home care by state and age, you might write something like:

```
[Washington]                        <-- defaultName
[ranks]                             <-- rankTextBegin
[4]                                 <-- dynamically generated from the data
[for children under 1 year old and] <--- rankTextMiddle
[39]                                <-- dynamically generated from the data
[for children over 17]              <-- rankTextEnd
```
