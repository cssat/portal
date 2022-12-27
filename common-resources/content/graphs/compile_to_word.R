library(rmarkdown)
library(pocr)
library(stringr)

# for each file
add_md_item = function(file, out_file) {
    
    raw = readLines(file)
    md_begin = min(which(str_detect(raw, pattern = "^##")))
    json = jsonlite::fromJSON(txt = raw[1:(md_begin - 1)])
    json_output = sprintf("## Title: %s\n\n", json$title)
    
    fields = c("subtitle", "blurb", "slug", "unit")
    json_output = c(json_output, unlist(sapply(fields, FUN = function(x) {
        if (x %in% names(json)) sprintf("**%s:** %s\n\n", str_to_title(x), json[[x]])
    })))

        cat(json_output, file = out_file, append = TRUE)
    
    # handle data highlights
    # remove <p>, </p>
    raw = str_replace_all(raw, pattern = "\\s*\\</?p\\>", replacement = "")
    #
    raw = str_replace_all(raw, pattern = "\\</h4\\>", replacement = ":")
    raw = str_replace_all(raw, pattern = "\\s*\\<h4\\>", replacement = "")
    raw = str_replace_all(raw, pattern = "\\</?div( class.*)?\\>", replacement = "")
    
    cat(raw[md_begin:length(raw)], file = out_file, sep = "\n", append = TRUE)
    
    cat("\n---\n\n", file = out_file, append = TRUE)
    invisible()
}

md_files = list.files(path = "./public/content-data/content", pattern = "\\.md$", recursive = T, full.names = T)
md_files = md_files[!str_detect(md_files, pattern = "README\\.md$")]
md_files = md_files[!str_detect(md_files, pattern = "pages/")]
md_files = md_files[!str_detect(md_files, pattern = "RMarkdown/")]

# Prepare output
out_file = "C:/Portal_Text.md"

header = sprintf(
'---
title: "Compilation of Measure Text"
author: "POC Data Portal"
date: "%s"
output: word_document
---\n
', pretty_date(Sys.Date())   
)

cat(header, file = out_file)
#cat("\n# Graphs\n\n", file = out_file, append = TRUE)

lapply(md_files, add_md_item, out_file = out_file)

# compile to word
# won't run if you have a previous version open in Word
render(input = out_file, output_dir = "C:/")

