library(rvest)
library(purrr)

#PRODUCT URL
url = "http://books.toscrape.com/index.html"
pagina<-read_html(url)
selector = "li.col-xs-6:nth-child(1) > article:nth-child(1) > h3:nth-child(3) > a:nth-child(1)"
nodo<-html_node(pagina, selector)
nodo_text<-html_text(nodo)
nodo_links<-html_attr(nodo, "href")
nodo_links

urlcompleta<-paste0("http://books.toscrape.com/",nodo_links)
urlcompleta

#PAGINATION

# http://books.toscrape.com/catalogue/page-3.html

library(stringr)

pag = "http://books.toscrape.com/catalogue/page-3.html"
lista_paginas<-c(1:50)
pag<-str_replace(pag, "page-3", paste0("page-",lista_paginas))
pag

#URL LIST AFTER PAGINATION
dameLinksPagina<-function(url){

  selector = "article > h3 > a"
  pagina<-read_html(url)
  nodo<-html_nodes(pagina, selector)
  nodo_text<-html_text(nodo)
  nodo_links<-html_attr(nodo, "href")
  nodo_links
  
}

test = dameLinksPagina(pag[3])
linksBooks<-sapply(pag, dameLinksPagina)
vlink<- as.vector(linksBooks)
vLinkBooks<-paste0("http://books.toscrape.com/catalogue/", vlink)
vLinkBooks

#BOOK NAME
url = "http://books.toscrape.com/catalogue/deliciously-ella-every-day-quick-and-easy-recipes-for-gluten-free-snacks-packed-lunches-and-simple-meals_801/index.html"
selector_nombre<-"h1"
pagina_web<-read_html(url)
nombre_nodo<-html_node(pagina_web, selector_nombre)
nombre_texto<-html_text(nombre_nodo)
nombre_texto

#PRODUCT REVIEWS
opiniones<-"p.star-rating"
opiniones_nodo<-html_node(pagina_web, opiniones)
opiniones_texto<-html_attr(opiniones_nodo, "class")
opiniones_texto

#PRODUCT PRICE
selector_precio <-"p.price_color"
precio_nodo<-html_node(pagina_web, selector_precio)
precio_texto<-html_text(precio_nodo)
precio_texto

#PRODUCT DETAIL
selector_details = ".table"
details_nodo<-html_node(pagina_web, selector_details)
table_tab<-html_table(details_nodo)
table_tab
val<-table_tab$X2
val
t(val)
res_table = data.frame(t(val))
res_table
table_names = table_tab$X1
table_names
colnames(res_table) = table_names
res_table
str(res_table)

book_results = c(nombre_texto, precio_texto, as.character(res_table$Availability))
