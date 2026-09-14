# apps/job_scout_chat/app.R
library(querychat)

con = DBI::dbConnect(RSQLite::SQLite(), "/Users/ib/Documents/PROJECTS/Senior Fall/ISA401/GitHub/business_intelligence/apps/job_scout_chat/data /scout.db")

client = ellmer::chat_openai(
  model  = "gpt-5.6-luna",
  params = ellmer::params(reasoning_effort = "none")
)

qc = querychat(
  con, "scout_postings",
  client   = client,
  tools    = c("filter", "query", "visualize"),
  greeting = "Ask me about the 1,891 job postings
              ChatISA Job Scout collected."
)

qc$app()
