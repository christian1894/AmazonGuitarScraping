library(rvest)
library(purrr)

#PRODUCT URL
url = "https://www.amazon.es/s?k=guitarra&__mk_es_ES=%C3%85M%C3%85%C5%BD%C3%95%C3%91&ref=nb_sb_noss"
pagina<-read_html(url)
selector = ".index\\=7 > div:nth-child(1) > div:nth-child(1) > div:nth-child(2) > div:nth-child(3) > div:nth-child(1) > div:nth-child(1) > h2:nth-child(1) > a:nth-child(1)"
nodo<-html_node(pagina, selector)
nodo_text<-html_text(nodo)
nodo_links<-html_attr(nodo, "href")
nodo_links

urlcompleta<-paste0("www.amazon.es",nodo_links)
urlcompleta

#PAGINATION

#https://www.amazon.es/s?k=guitarra&page=2&__mk_es_ES=%C3%85M%C3%85%C5%BD%C3%95%C3%91&qid=1570986793&ref=sr_pg_2
#https://www.amazon.es/s?k=guitarra&page=4&__mk_es_ES=%C3%85M%C3%85%C5%BD%C3%95%C3%91&qid=1570987191&ref=sr_pg_4


library(stringr)
pag = "https://www.amazon.es/s?k=guitarra&page=4&__mk_es_ES=%C3%85M%C3%85%C5%BD%C3%95%C3%91&qid=1570987191&ref=sr_pg_4"
lista_paginas<-c(1:7)
pag<-str_replace(pag, "page=4", paste0("page=",lista_paginas))
pag<-str_replace(pag, "sr_pg_4", paste0("sr_pg_",lista_paginas))
pag

#URL LIST AFTER PAGINATION
dameLinksPagina<-function(url){
  selector = "div:nth-child(1) > div:nth-child(1) > div:nth-child(2) > div:nth-child(3) > div:nth-child(1) > div:nth-child(1) > h2:nth-child(1) > a:nth-child(1)"
  pagina<-read_html(url)
  nodo<-html_nodes(pagina, selector)
  nodo_text<-html_text(nodo)
  nodo_links<-html_attr(nodo, "href")
  nodo_links
  
}

test = dameLinksPagina(pag[1])
linksGuit<-sapply(pag, dameLinksPagina)
flat = flatten(linksGuit)
vLinkGuitarras<-paste0("https://www.amazon.es/", flat)
vLinkGuitarras

#PRODUCT NAME
url = "https://www.amazon.es//Strong-Wind-Guitarra-ac%C3%BAstica-completo/dp/B06ZZ7SQL5/ref=sr_1_14?__mk_es_ES=%C3%85M%C3%85%C5%BD%C3%95%C3%91&keywords=guitarra&qid=1570989330&sr=8-14" 
selector_nombre<-"#productTitle"
pagina_web<-read_html(url)
nombre_nodo<-html_node(pagina_web, selector_nombre)
nombre_texto<-html_text(nombre_nodo)
nombre_texto

#PRODUCT REVIEWS
opiniones<-"#acrCustomerReviewText"
opiniones_nodo<-html_node(pagina_web, opiniones)
opiniones_texto<-html_text(opiniones_nodo)
opiniones_texto

#PRODUCT PRICE
selector_precio <-"#productTitle"
precio_nodo<-html_node(pagina_web, selector_precio)
precio_texto<-html_text(precio_nodo)
precio_texto


