library(rvest)
library(purrr)

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
  
}


links_as_matrix = sapply(pag, linkGetter)
flat = flatten(links_as_matrix)
links_as_vector = as.vector(links_as_matrix)

linksVector = paste0("https://www.amazon.com/", flat)

#GET PRODUCT NAME

url = "https://www.amazon.com//Donner-DAG-1C-Beginner-Acoustic-Cutaway/dp/B073XC3Y5J/ref=sr_1_1?keywords=guitars&qid=1570681119&sr=8-1"
page = read_html(url)
selector = "#productTitle"
name_node = html_node(page, selector)
product_name = html_text(name_node)
product_name

#GET # REVIEWS
selector = "#averageCustomerReviews_feature_div > div:nth-child(2) > span:nth-child(3) > a:nth-child(1) > span:nth-child(1)"
review_node = html_node(page, selector)
product_reviews = html_text(review_node)
product_reviews

#GET PRICE
selector = "#priceblock_ourprice"
price_node = html_node(page, selector)
product_price = html_text(price_node)
product_price

#GET DETAILS TABLE
selector = "#priceblock_ourprice"
table_node = html_node(page, selector)
product_details = html_text(table_node)
product_details






