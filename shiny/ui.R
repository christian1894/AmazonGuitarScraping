

pageWithSidebar(
  headerPanel('Books Scraping k-means clustering'),
  sidebarPanel(
    selectInput('xcol', 'X Variable', names(dataset)),
    selectInput('ycol', 'Y Variable', names(dataset),
                selected=names(dataset)[[2]]),
    numericInput('clusters', 'Cluster count', 3,
                 min = 1, max = 9)
  ),
  mainPanel(
    plotOutput('plot1')
  )
)

