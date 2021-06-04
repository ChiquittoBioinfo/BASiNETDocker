# arqSeqMRNA <- system.file("extdata", "empty.fasta", package = "BASiNET")
# arqSeqLNCRNA <- system.file("extdata", "~/gencode-files/gencode.v21.lncRNA_transcripts.fa", package = "BASiNET")
# classification(mRNA=arqSeqMRNA,lncRNA=arqSeqLNCRNA,word=3,step=3,graphic=FALSE,graphic3D=FALSE)

if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")
BiocManager::install("Biostrings")
install.packages("optparse")
install.packages("BASiNET")
