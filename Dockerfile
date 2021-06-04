# Adapted from https://www.r-bloggers.com/2019/02/running-your-r-script-in-docker/

FROM r-base:latest
LABEL version="1.0.0" description="Container para BASiNET" maintainer="Alisson Chiquitto<chiquitto@gmail.com>"

VOLUME ["/app"]
VOLUME ["/host"]

## copy files
COPY /BASiNETInstall.R /app/BASiNETInstall.R

# Run in docker build
RUN apt-get update \
   && apt-get install -y \
   libcurl4-openssl-dev \
   curl \
   r-cran-rjava \
   && Rscript /app/BASiNETInstall.R

# Run in docker run
# CMD Rscript BASiNET.R

