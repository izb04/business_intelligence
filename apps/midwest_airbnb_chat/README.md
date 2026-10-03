# Midwest Stay Explorer

Built by Isobel Bartels for ISA 401 at Miami University. Ask plain-English questions about 14,887 Airbnb listings and inspect the resulting SQL, table, and charts.

**Live app:** https://business-intelligence-s9au.onrender.com

## Data

[Inside Airbnb](https://insideairbnb.com/get-the-data/) snapshots: Chicago July 20, 2026 (7,439 listings), Columbus July 23, 2026 (2,587), and Twin Cities July 21, 2026 (4,861). See [the complete dictionary](data/data_desc.md) and [answer rules](data/extra_instructions.md).

## Example questions

### 1. Which Columbus neighbourhood has the priciest entire homes?

Screenshot pending a successful app answer.

### 2. Do superhosts charge more per night than other hosts? Show it as a bar chart.

Screenshot pending a successful app answer.

### 3. How many listings could host a party of ten?

Screenshot pending a successful app answer. Guest capacity does not mean events are allowed.

## Run locally

Open the project in RStudio with OPENAI_API_KEY in the ignored project .Renviron, restart R, then open this folder's app.R and click Run App. Packages: shiny, bslib, DBI, RSQLite, ellmer, shinychat, querychat, DT, ggsql, and bsicons.

## Deploy to Render

Connect this public repository to a Docker Web Service on branch main. Set Root Directory to apps/midwest_airbnb_chat and Instance Type to Free. Add OPENAI_API_KEY in Render's Environment settings, then deploy. Replace the Live app line with the actual onrender.com address after verifying an answer.

Free services may need time to wake after inactivity. Keep API keys out of tracked files.
