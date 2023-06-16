FROM rstudio/plumber
COPY api.R /plumber.R
COPY .env .env
RUN apt-get update
RUN apt-get install libpq-dev -y
RUN R -e 'install.packages("RPostgreSQL")'
RUN R -e 'install.packages("dotenv")'
CMD ["./plumber.R"]