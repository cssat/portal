# Data Portal Content

<!-- MarkdownTOC -->

- Purpose
- Implementation Overview
  - Project Structure
  - File Structure
- Working with the content
  - Editing content
  - Hotfixes & accepting changes
  - Summary of File Structure
- Style Guide
  - Word Usage
  - JSON Elements
  - Markdown Content

<!-- /MarkdownTOC -->


# Purpose

This project provides the text content and configuration information for measures that will be displayed as Google Charts using the [POC Google Charts framework](https://github.com/cssat/portal-visualizations) and as summaries on the [Data Portal index site](https://github.com/cssat/portal-browse).

# Implementation Overview

This project contains all of the config and content information for each page of the Data Portal sites. Each type of content resides in a folder that contains Markdown and RMarkdown files as needed.

## Project Structure

At the top level are folders for each content type: graphs, maps, national-trends (spaghetti plots), pages (help and about static content), and reports (currently just county reports).

Within a folder that contains a **visualization type**, R markdown files should be stored in a folder called 'RMarkdown', while the standard markdown files should be stored at the project root. In other words, the directory should look like this:

```
graphs
|--- RMarkdown
     |--- graph1.Rmd
     |--- graph2.Rmd
|--- graph1.md
|--- graph2.md
|--- README.md

```

## File Structure

Each file consists of JSON front matter and content written in Markdown (new to Markdown? [Use this cheat sheet](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet)!). The RMarkdown files include optional code to dynamically generate numbers within the text.

**Do not edit markdown documents, they will be overwritten by the knitted RMarkdown. Edit the RMarkdown documents directly.**

A generic markdown example should look like this:

```
{
	"title": "Title",
	"subtitle": "",
	"type": "",
	"categories": [ "" ],
	"tags": [
		"tag 1",
		"tag 2"
	],
	"slug": "",
	"config": {...}
	
}
```

# Working with the content

In general, branch management is a little more straightforward from Git Bash or the terminal, so the following instructions **assume that you are working from the command line** and not a GUI.

### Add a new visualization or  report

To add new content to this repo:

**The short way**

1. From the `data-portal` top-level folder, run `bin/dev`
2. Add a new RMarkdown file in the RMarkdown folder
3. Fill out the details and generate a standard markdown file at the project root
4. From `data-portal` run `bin/push`

**The long way**

1. Add a new RMarkdown file in the RMarkdown folder
2. Fill out the details and generate a standard markdown file at the project root
3. `git add . -A && git commit -m "my commit message"`
4. `git branch -f master upstream/master` // Make sure you get any changes that came in while you were working
5. `git checkout my-branch`
6. `git rebase master`
7. `git push origin my-branch`
8. [Take out a pull request](https://github.com/cssat/portal-content/pulls).

Once your new content has been reviewed, it will be merged into the repo.

## Editing content

**Do not edit markdown documents, they will be overwritten by the knitted RMarkdown. Edit the RMarkdown documents directly.**

1. Make sure that you have all of the latest changes from the master branch: `git pull --rebase origin master`
2. Checkout a new branch to do your work: `git checkout -b my-branch`
3. Make your text changes
4. `git add . -A && git commit -m "my commit message"`
5. `git push origin my-branch`
6. [Take out a pull request](https://github.com/cssat/portal-content/pulls).

Once your new content has been reviewed, it will be merged into the repo.

## Hotfixes & accepting changes

Sometimes you will need to make quick fixes that don't need much testing (typos are a good example). When this occurs:

1. Start from the master branch and make sure you have pulled changes
2. Checkout a branch for your hotfix: `git checkout -b hotfix-[name]`
3. Make and commit your changes
4. Checkout the master branch and merge your fix: `git checkout master && git merge hotfix-[name] --no-ff` (the no-ff flag helps keep track of what happened)
5. `git push origin master`


## Summary of File Structure

### JSON front matter

This is the metadata that powers the visualization. Without it, the visualization cannot run or be included in the site index. See below for a list of required and optional pieces of metadata:

| Key (name)		| Required?			| Values				| Explanation			|
| ----------------- | ----------------- | --------------------- | --------------------- |
| title             | **Yes**           | Anything (string)     | The title should describe the visualization succinctly and meaningfully.
| subtitle          | No                | Anything (string)     | Extra explanation of the graph as needed
| visualizationType | **Yes**           | "graph," "map," "report"      | More specific descriptors of the visualization. Allows for easier browsing at the framework/project level.
| tags              | **Yes**               | Anything (array)      | Descriptors for searching. Please reference existing tags before making up new ones.
| slug              | **Yes**           | String with no spaces | URL path for use in permalinks. Often mirrors the file name, but doesn't have to.
| unit				  | no                | String                | A description of the unit of measurement for this visualization
| config            | **Yes**           | Array                 | Config options for the visualization. Please [refer to the documentation](https://github.com/cssat-graveyard/annie-config/wiki/Configuration:-Measurement-Information) for more information on structure.

The front matter is flexible, and everything inside "config" can be customized for a given type of visualization. For example, the Google Charts config options are much longer and more complicated than the maps config options, but the overall structure of the front matter is the same.

### Markdown content

The content below the JSON front matter should be formatted as regular markdown and be separated from the JSON by at least two line breaks. Follow a predictable pattern, such as including a "Summary" section and a "Data" section. Keep it short and sweet because people don't read long text unless that's the purpose of their visit.

As stated above, do not edit the markdown documents, edit the RMarkdown source!

### RMarkdown source

The RMarkdown files should knit to the markdown version. Use the `pocr::rmd_to_md()` function to knit all Rmd files in the RMarkdown directory to md files in the base directory, validate the JSON code, and remove any blank lines from the top of the md file.

The standard format will have one R code chunk with the chunk option `include = FALSE` at the top of the Rmd file. This code chunk should be self-contained, loading packages and connecting to databases as necessary.

# Style Guide

## Word Usage

The following terms should be hyphenated (or not) as below:

- well-being
- care-day
- out-of-home care
- in-home
- screened-in

For reports/intakes/referrals, we prefer the term **report**, with *referral* as a synonym. This term both seems clear and is used by CA on their page [How to Report Child Abuse or Neglect](https://www.dshs.wa.gov/ca/child-safety-and-protection/how-report-child-abuse-or-neglect).

## JSON Elements

Remember what information is visible when, and what is paired with what.

- When browsing cards: title, blurb, and primary tag are visible
- On the summary/info page: title, subtitle, summary content, with data highlights and units in the sidebar
- Viewing the vis: title, subtitle, visualization

### Titles and subtitles

Keep titles as short as possible. Remember that measure cards are displayed alphabetically, so similar measurements should have titles that start the same way so that they are grouped together, e.g., *Out-of-Home Entries (Count)* and *Out-of-Home Entries (Rate)*.

Subtitles will often be used to convey or clarify information on the units of measure.

For both titles and subtitles:

- use *title case* (All Big Words Capitalized)
- no punctuation at end

### Blurbs

Blurbs should be complete sentences with punctuation. Try to make them at least 10 words long, but probably less than 20. They should describe the measurement briefly. They should expand on the title and not exactly echo the title. It is not required for the blurb to specify the units of measure, but some blurbs will.

### Slugs and filenames

The slug does **not** need to be the same as the filename, but in many cases they will be similar. In both cases try to keep it short and reasonably clear.

Filenames are only used internally, they should have a single topic-area prefix (such as `ooh` for out-of-home or `ar` for annual report), followed by a short measure identifier with words separated by dashes.

Slugs should also be short, with words separated by dashes. They should be at least somewhat parseable by users.

### Tags and Keywords

Tags and keywords are both searchable. Tags are see-able and click-able too, so we don't want *too* many of them. Use "correct" language in tags, with "synonyms" in keywords. For example, a measure with the `reports` tag could have `intakes` and `referrals` as keywords. Tags can include spaces, and should be all lower-case.

The first tag in the tag list is the *primary tag*, and will be visible on the measure's card. Good candidates for primary tags are safety, permanency, well-being, and education.

### Units

If the units seem natural, it's fine to keep this short, such as "Count of Children" or even just "Percent". If the percent is, say, a percent of care-days, best to spell that out.

For rates, make both the numerator and denominator clear.

- **Bad:** Rate per 1,000 Households
- **Good:** Reports per 1,000 Households with Chilren

Use title case for rates, "per" and other prepositions lowercase (unless they are the first word).

## Markdown Content

After the JSON config content, the file should include

1. Data Highlights (H3, denoted by 3 hashes: `###`)
     - 2 or 3 data highlights.
         - Data should be dynamic (based pulled in the R code chunk at the top of the document)
         - Each enclosed in `<div, class = "stat">` with the label in `<h4>` and the value in `<p>`
2. Data Summary (H3, denoted by 3 hashes: `###`)
    - Aim for 30 to 50 words (one or two sentences) about the measurement
3. Questions This [content type] Answers (H4, 4 hashes `####`)
    - Bulleted list of two or three questions
4. See Also [optional section](H4, 4 hashes `####`)
    - Bulleted list with links to one or two other [content types] a user might be interested in
    - Describe the links **briefly**, especially pointing out how the differ from the current [content type]
    - Use relatiave links. The link to any visualization is `/visualizations/slug`
5. Notes [optional section--use only if necessary](H4, 4 hashes `####`)
    - short paragraphs with caveats or technical clarifications
    
### Worked Example:

This omits the actual `config` section which is documented elsewhere.

```
{  
   "title":"Re-Entering Out-of-Home Care",
   "subtitle":"By Exit Cohort",
   "img":"",
   "type":"visualization",
   "visualizationType":"graph",
   "tags":[  
      "safety",
      "out-of-home",
      "age",
      "county",
      "race/ethnicity",
      "cohort"
   ],
   "keywords":[
      "reentry",
      "re-entry"
   ],
   "blurb":"Children who exited out-of-home care to a permanency (reunification, adoption, guardianship) outcome but later re-entered care.",
   "slug":"ooh-re-entry",
   "unit":"Percent"
}

### Data Highlights

<div class="stat">
    <h4>Reunification </h4>
    <p>`r reunification `%</p>
</div>

<div class="stat">
    <h4>Adoption </h4>
    <p>`r adoption `%</p>
</div>

<div class="stat">
    <h4>Guardianship</h4>
    <p>`r guardianship`%</p>
</div>

### Summary

This graph examines re-entry into out-of-home care. It shows the percentage of children who exited out-of-home care to a permanent outcome (reunification, adoption, or guardianship) but later re-entered out-of-home care.

#### Questions this graph can answer

- From what type of permanency outcome have most children re-entered out-of-home care?

- For how long after a permanency outcome are children at high risk of re-entering out-of-home care?

#### See also

- [Children Entering Out-of-Home Care (Count)](https://portal.cssat.org/visualizations/ooh-entry-counts), for a count of children who entered out-of-home care.

### Notes

This measure uses cohort data based on the year children exit care. Recent cohorts (in the last 4 years) have less data available due to the shorter follow-up time.

If a child has a name change associated with an adoption, then it is not possible to link the pre-adoption record to a post-adoption re-entry. Thus the displayed re-entry rate following adoption is an underestimate of the true rate.
