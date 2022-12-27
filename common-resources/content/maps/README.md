# Maps Content

## Purpose

This project provides the text content and configuration information for measures that will be displayed as choropleth maps using the [POC D3 Maps framework](https://github.com/pocdata/d3_maps) and as summaries on the [Data Portal index site](https://github.com/cssat/portal-browse).

## Implementation Overview

This project consists of standard markdown files, R markdown files, and this README.

Each instance of the tool (often referred to as "measures") consists of two files: an R markdown file that pulls numbers from the database, and a standard markdown file that is generated from the R markdown file and parsed by the visualization framework to display the content.

### Project Structure

R markdown files should be stored in a folder called 'RMarkdown', while the standard markdown files should be stored at the project root. In other words, the directory should look like this:

```
googlecharts-content
|--- RMarkdown
     |--- graph1.Rmd
     |--- graph2.Rmd
|--- map1.md
|--- map2.md
|--- README.md

```

### File Structure

Each file consists of JSON front matter and content written in Markdown (new to Markdown? [Use this cheat sheet](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet)!). The RMarkdown files include optional code to dynamically generate numbers within the text.

A generic example should look like this:

```
{
	"title": "Title",
	"subtitle": "",
	"type": "visualization",
	"categories": [ "map" ],
	"tags": [
		"tag 1",
		"tag 2"
	],
	"slug": "",
	"config": {...}
	
}

# Summary 

This is some content written in Markdown. It will be parsed and output as HTML wherever it shows up on the Data Portal.

```

#### JSON front matter

This is the metadata that powers the visualization. Without it, the visualization cannot run or be included in the site index. See below for a list of required and optional pieces of metadata:

| Key (name)		| Required?			| Values				| Explanation			|
| ----------------- | ----------------- | --------------------- | --------------------- |
| title             | **Yes**           | Anything (string)     | The title should describe the visualization succinctly and meaningfully.
| subtitle          | No                | Anything (string)     | Extra explanation of the graph as needed
| type              | **Yes**           | "visualization", "report", or "page"  | Describes the content type so that visualizations of all types can be grouped together
| categories        | No                | "graph" or "map"      | More specific descriptors of the visualization. Allows for easier browsing at the framework/project level.
| tags              | No                | Anything (array)      | Descriptors for searching. Please reference existing tags before making up new ones.
| slug              | **Yes**           | String with no spaces | URL path for use in permalinks. Often mirrors the file name, but doesn't have to.
| config            | **Yes**           | Array                 | Config options for the visualization. Please [refer to the documentation](https://github.com/cssat-graveyard/annie-config/wiki/Configuration:-Measurement-Information) for more information on structure.

The front matter is flexible, and everything inside "config" can be customized for a given type of visualization. For example, the Google Charts config options are much longer and more complicated than the maps config options, but the overall structure of the front matter is the same.

#### Markdown content

The content below the JSON front matter should be formatted as regular markdown and be separated from the JSON by at least two line breaks. Follow a predictable pattern, such as including a "Summary" section and a "Data" section. Keep it short and sweet because people don't read long text unless that's the purpose of their visit.

## Add new content

To add new content to this repo:

1. Clone it and check out a new branch named for the work you are about to do
2. Add a new RMarkdown file in the RMarkdown folder
3. Fill out the details and generate a standard markdown file at the project root
4. Commit your changes, push the branch and take out a pull request [documentation here](https://help.github.com/articles/creating-a-pull-request/).

Once your new content has been reviewed, it will be merged into the repo.


## Include content in a project

Coming soon...