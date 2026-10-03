FROM rocker/shiny:4.6.0
RUN apt-get update && apt-get install -y --no-install-recommends \
    libcurl4-openssl-dev libssl-dev libxml2-dev libuv1t64 \
    && rm -rf /var/lib/apt/lists/*
RUN R -q -e "options(repos = c(CRAN = 'https://p3m.dev/cran/__linux__/noble/2026-09-01')); install.packages(c('shiny','bslib','DBI','RSQLite','ellmer','shinychat','querychat','DT','ggsql','bsicons'))"
RUN R -q -e "for (p in c('shiny','bslib','DBI','RSQLite','ellmer','querychat','DT','ggsql','bsicons','fs')) stopifnot(requireNamespace(p, quietly = TRUE))"
WORKDIR /app
COPY app.R app.R
COPY data/ data/
EXPOSE 7860
CMD ["R", "-q", "-e", "shiny::runApp('/app', host = '0.0.0.0', port = as.integer(Sys.getenv('PORT', '7860')))"]
