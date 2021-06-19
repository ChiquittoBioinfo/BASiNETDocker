# https://www.r-bloggers.com/2015/09/passing-arguments-to-an-r-script-from-command-lines/

library(BASiNET)
library("optparse")
library(tools)
 
option_list = list(
  make_option(c("--mRNA"), type="character", default=NULL, help="input mRNA file", metavar="file"),
  make_option(c("--lncRNA"), type="character", default=NULL, help="input lncRNA file", metavar="file"),
  make_option(c("--saveParam"), type="character", default=NULL, help="working directory to set", metavar="file")
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
if (is.null(opt$saveParam)){
  print_help(opt_parser)
  stop("Set the save parameter (absolute path)", call.=FALSE)
}

# arqSeqMRNA <- system.file("extdata", opt$mRNA, package = "BASiNET")
# arqSeqLNCRNA <- system.file("extdata", opt$lncRNA, package = "BASiNET")
# classification(mRNA=arqSeqMRNA,lncRNA=arqSeqLNCRNA,word=3,step=3,graphic=FALSE,graphic3D=FALSE)

# setwd(opt$wd)
# print(paste("pwd =", getwd()))

arqSeqMRNA <- file_path_as_absolute(opt$mRNA)
arqSeqLNCRNA <- file_path_as_absolute(opt$lncRNA)
print(paste("  mRNA file=", arqSeqMRNA))
print(paste("lncRNA file=", arqSeqLNCRNA))
#classification(mRNA=arqSeqMRNA,lncRNA=arqSeqLNCRNA)
classification(arqSeqMRNA, arqSeqLNCRNA, save=opt$saveParam)

print(paste("The model has been saved to ", opt$saveParam))
