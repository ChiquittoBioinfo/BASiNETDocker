# https://www.r-bloggers.com/2015/09/passing-arguments-to-an-r-script-from-command-lines/

library(BASiNET)
library("optparse")
library(tools)
 
option_list = list(
  make_option(c("--mRNA"), type="character", default=NULL, help="input mRNA file", metavar="file"),
  make_option(c("--lncRNA"), type="character", default=NULL, help="input lncRNA file", metavar="file"),
  make_option(c("--loadParam"), type="character", default=NULL, help="model to use", metavar="file")
); 
 
opt_parser = OptionParser(option_list=option_list);
opt = parse_args(opt_parser);

if (is.null(opt$mRNA)){
  print_help(opt_parser)
  stop("At least one argument must be supplied (input file).n", call.=FALSE)
}
if (is.null(opt$lncRNA)){
  print_help(opt_parser)
  stop("At least one argument must be supplied (input file).n", call.=FALSE)
}
if (is.null(opt$loadParam)){
  print_help(opt_parser)
  stop("Set the load parameter (absolute path)", call.=FALSE)
}

arqSeqMRNA <- file_path_as_absolute(opt$mRNA)
arqSeqLNCRNA <- file_path_as_absolute(opt$lncRNA)
print(paste("  mRNA file=", arqSeqMRNA))
print(paste("lncRNA file=", arqSeqLNCRNA))
classification(arqSeqMRNA, arqSeqLNCRNA, load=opt$loadParam)

print(paste("Input data were classified using the input model ", opt$loadParam))
