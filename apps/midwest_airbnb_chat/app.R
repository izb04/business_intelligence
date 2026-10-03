library(shiny)
library(bslib)
library(querychat)

con = DBI::dbConnect(RSQLite::SQLite(), "data/midwest_airbnb.db")
client = ellmer::chat_openai(
  model = "gpt-5.6-luna",
  params = ellmer::params(reasoning_effort = "none")
)
qc = querychat::querychat(
  con, "listings", client = client,
  tools = c("filter", "query", "visualize"),
  greeting = "Ask me about 14,887 Airbnb listings in Chicago, Columbus, and the Twin Cities. Try comparing neighbourhood prices or asking for a bar chart.",
  data_description = "data/data_desc.md",
  extra_instructions = "data/extra_instructions.md"
)

ui = page_navbar(
  title = "Midwest Stay Explorer", id = "navigation",
  theme = bs_theme(version = 5, bg = "#F7F5EF", fg = "#233D35",
                   primary = "#276552", secondary = "#BD6B43"),
  nav_panel("Explore",
    page_sidebar(
      sidebar = sidebar(qc$ui(), width = 410, fillable = TRUE),
      card(card_header("Listings and query results"),
           DT::DTOutput("results"), full_screen = TRUE),
      card(card_header("SQL behind this answer"),
           verbatimTextOutput("sql")),
      p(class = "text-muted", "Historical July 2026 snapshots. Prices and availability may have changed.")
    )
  ),
  nav_panel("About",
    card(
      card_header("Explore the Midwest, one question at a time"),
      card_body(
        h2("Midwest Stay Explorer"),
        p("Built by Isobel Bartels for ISA 401 at Miami University."),
        p("Ask questions about prices, neighbourhoods, room types, guest capacity, and host characteristics. The app returns a table and displays the SQL used; request a chart in the chat."),
        h3("Data source"),
        p("The course database contains 14,887 listings from ",
          a("Inside Airbnb", href = "https://insideairbnb.com/get-the-data/", target = "_blank"), "."),
        tags$ul(
          tags$li("Chicago: July 20, 2026 — 7,439 listings"),
          tags$li("Columbus: July 23, 2026 — 2,587 listings"),
          tags$li("Twin Cities: July 21, 2026 — 4,861 listings")
        ),
        h3("Questions to try"),
        tags$ul(
          tags$li("Which Columbus neighbourhood has the priciest entire homes?"),
          tags$li("Do superhosts charge more per night than other hosts? Show it as a bar chart."),
          tags$li("How many listings could host a party of ten?")
        ),
        h3("How to read the results"),
        p("Prices are nightly US dollars. Missing values are not zero. Unavailable nights can be booked or blocked by hosts. Estimated revenue is modeled, and comparisons describe association rather than causation."),
        p("Capacity for ten guests does not mean a listing permits parties or events.")
      )
    )
  )
)
server = function(input, output, session) {
  result = qc$server()
  output$results = DT::renderDT(result$df(), rownames = FALSE,
                              options = list(pageLength = 10, scrollX = TRUE))
  output$sql = renderText({
    sql = result$sql()
    if (is.null(sql) || !nzchar(sql)) "SELECT * FROM listings" else sql
  })
}
shinyApp(ui, server)
