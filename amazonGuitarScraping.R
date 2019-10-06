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