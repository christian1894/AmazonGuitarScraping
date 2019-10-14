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
url = "http://books.toscrape.com/catalogue/tipping-the-velvet_999/index.html"
selector_nombre<-"h1"
pagina_web<-read_html(url)
nombre_nodo<-html_node(pagina_web, selector_nombre)
nombre_texto<-html_text(nombre_nodo)
nombre_texto

#PRODUCT REVIEWS
opiniones<-"p.star-rating"
opiniones_nodo<-html_node(pagina_web, opiniones)
opiniones_texto<-html_attr(opiniones_nodo, "class")
opiniones_texto = substr(opiniones_texto, 13, 17)
opiniones_number = switch(opiniones_texto, "Zero" = 0,"One" = 1, "Two" = 2, "Three" = 3, "Four" = 4, "Five" = 5,)
opiniones_number


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

book_results = c(nombre_texto, precio_texto, opiniones_texto_number, as.character(res_table$Availability))
book_results

# BOOK DETAILS FUNCTION
getArticulo = function(url){
  page = read_html(url)
  #BOOK NAME
  selector_nombre<-"h1"
  nombre_nodo<-html_node(page, selector_nombre)
  nombre_texto<-html_text(nombre_nodo)
  
  #PRODUCT REVIEWS
  opiniones<-"p.star-rating"
  opiniones_nodo<-html_node(page, opiniones)
  opiniones_texto<-html_attr(opiniones_nodo, "class")
  opiniones_texto = substr(opiniones_texto, 13, 17)
  opiniones_number = switch(opiniones_texto, "Zero" = 0,"One" = 1, "Two" = 2, "Three" = 3, "Four" = 4, "Five" = 5,)

  #PRODUCT PRICE
  selector_precio <-"p.price_color"
  precio_nodo<-html_node(page, selector_precio)
  precio_texto<-html_text(precio_nodo)
  #PRODUCT DETAIL
  selector_details = ".table"
  details_nodo<-html_node(page, selector_details)
  if(!is.na(details_nodo)){
    table_tab<-html_table(details_nodo)
    val<-table_tab$X2
    table = data.frame(t(val))
    table_names = table_tab$X1
    colnames(table) = table_names
  } 
  colnames = c("Availability")
  if(is.na(details_nodo)){
    table = data.frame(colnames(colnames))
    table = rbind(table, c("-1"))
    colnames(table) = colnames
  }else{
    zero = matrix("-1", nrow= 1, ncol= 1)
    data_frame_zero = data.frame(zero)
    colnames(data_frame_zero) = colnames
    availability = as.character(table$Availability)
    if(length(availability) == 0) availability = "-1"
    data_frame_zero$Availability = availability
    table = data_frame_zero
    colnames(table) = colnames
  }
  book = c(nombre_texto, opiniones_number, precio_texto, as.character(table$Availability))
}

test = getArticulo(vLinkBooks[20])
test
