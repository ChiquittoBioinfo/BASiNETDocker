# BASiNETDocker

Use this to run https://github.com/EricIto/BASiNET with Docker

## Install
```bash
git clone https://github.com/chiquitto/BASiNETDocker.git
cd BASiNETDocker
docker build -t chiquitto/basinet:v1 .
```

## Run
```bash
# Run examples
cd BASiNETDocker
docker run -it -v "$(pwd):/app" -v "$HOME:/host" chiquitto/basinet:v1 Rscript /app/BASiNET.R --mRNA=app/example/mRNA.fa --lncRNA=app/example/lncRNA.fa
```