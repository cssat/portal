## This script checks the links in markdown configuration files
## against slugs that it can find.

## At some point it should probably be incorporated into pocr

####################
## set your working directory to a content folder that contains
## graphs, maps, reports, and national-trends subdirectories with md files to check
setwd("C:/xampp/htdocs/data-portal/portal-browse/public/content-data/content/")

## Then run the rest of the code!

# get all .md files
md_files = list.files(pattern = "*\\.md$", ignore.case = TRUE, recursive = TRUE)
# omit README files
md_files = md_files[!stringr::str_detect(md_files, pattern = "README")]
# omit anything in RMarkdown or pages directories
md_files = md_files[!stringr::str_detect(md_files, pattern = "RMarkdown/")]
md_files = md_files[!stringr::str_detect(md_files, pattern = "pages/")]

# This will be nice when functionalized
if (length(md_files) == 0) {
    warning("No markdown files found.")
    invisible()
}

# read in the text
md_text = lapply(md_files, readLines)

# identify all slugs
slugs = vapply(md_text, function(x) x[str_detect(x, '"slug"')], FUN.VALUE = "char")
slugs = slugs %>% str_replace_all(pattern = '((slug)|\\"|:|,)', replacement = '') %>% str_trim

# identify the files that lines that have links
with_links = lapply(md_text, function(x) x[str_detect(x, "\\[.+\\]\\(/?visualizations.+\\)")])

# extract link descriptions and links
descriptions = lapply(with_links, str_extract, pattern = "\\[.+\\]")
links = lapply(with_links, str_extract, pattern = "\\(/visualizations/[^ ]+\\)")

# create data frame with links, descriptions, and source file name
df = data_frame(
    link = unlist(links),
    description =  unlist(descriptions),
    source = rep(md_files, times = sapply(links, length))
)

# flag the ones that look good
df = df %>% mutate(
    link_slug = str_replace_all(link, pattern = "(\\(/visualizations/)|\\)", replacement = ""),
    looks_good = link_slug %in% slugs
)

# these are the ones to check!
filter(df, !looks_good) %>% select(source, link_slug) %>% print.data.frame
