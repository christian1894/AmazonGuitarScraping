library(rvest)
url = "https://www.amazon.com/s?k=guitars&ref=nb_sb_noss"
webPage= read_html(url)
selector = ".index\\=25 > div:nth-child(1) > div:nth-child(1) > div:nth-child(2) > div:nth-child(3) > div:nth-child(1) > div:nth-child(1) > h2:nth-child(1) > a:nth-child(1)"
hrefNode = html_node(webPage, selector)
hrefText = html_text(hrefNode)
href= html_attr(hrefNode, "href")
href

fullUrl = paste0("www.amazon.com", href)
fullUrl


# https://www.amazon.com/s?k=guitars&page=2&qid=1570470487&ref=sr_pg_2
# https://www.amazon.com/s?k=guitars&page=3&qid=1570470487&ref=sr_pg_3

library(stringr)
pag = "https://www.amazon.com/s?k=guitars&page=3&qid=1570470487&ref=sr_pg_3"
pages_list = c(1:7)
pag = str_replace(pag, "page=3", paste0("page=", pages_list))
pag = str_replace(pag, "sr_pg_3", paste0("sr_pg_", pages_list))

linkGetter = function(url){
  webPage= read_html(url)
  selector = "div:nth-child(1) > div:nth-child(1) > div:nth-child(2) > div:nth-child(3) > div:nth-child(1) > div:nth-child(1) > h2:nth-child(1) > a:nth-child(1)"
  hrefNode = html_nodes(webPage, selector)
  hrefText = html_text(hrefNode)
  href= html_attr(hrefNode, "href")
  href
}


links_as_matrix = sapply(pag, linkGetter)
links_as_vector = as.vector(links_as_matrix)

linksVector = paste0("https://www.amazon.com/", links_as_vector)
head(linksVector)

