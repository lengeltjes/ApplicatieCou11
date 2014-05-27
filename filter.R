library("seqinr")

ortho_file <- read.table("LP_genes2.txt", header=TRUE)
vec <- read.table("vec.txt")
vec <- lapply(vec, as.character)$V1
WC_id <- substr(as.character(ortho_file$WCFS1), 11, 17)
NC_id <- substr(as.character(ortho_file$NC8), 17, 24)

df <- data.frame(v1=WC_id, v2=NC_id)

func1 <- function(file, output, vec){
  annotation <- getAnnot(file)
  vec2 <- c()
  vec3 <- c()
  sink(paste(output, ".fa", sep="")) 
  for(j in 1:length(vec)){
  	index <- grep(vec[j], annotation, ignore.case=T)
  	pirna <- file[index]
  	seq <- getSequence(pirna, as.string=TRUE) 
  	seq2 <- as.character(unlist(seq))
    if(length(seq2) == 1){
      cat(paste(">", vec[j], "\n", sep=""))
      cat(paste(toupper(seq2), "\n", sep=""))
    }
  }
  sink()
}

func2 <- function(file, output, vec, df){
  annotation <- getAnnot(file)
  vec2 <- c()
  vec3 <- c()
  sink(paste(output, ".fa", sep="")) 
  for(j in 1:length(vec)){
    nc_index<- grep(vec[j], df[,1])
    nc <- as.character(df[nc_index,2])
    if(length(nc) == 1){
      index <- grep(nc, annotation, ignore.case=T)
      pirna <- file[index]
      seq <- getSequence(pirna, as.string=TRUE) 
      seq2 <- as.character(unlist(seq))
      if(length(seq2) == 1){
        cat(paste(">", nc, "\n", sep=""))
        cat(paste(toupper(seq2), "\n", sep=""))
      }
    }
  }
  sink()
}

WC_file1 <- read.fasta(file = "WCFS1_glc_1_tss.fa")
func1(WC_file1, "WC_output1", vec)
WC_file2 <- read.fasta(file = "WCFS1_glc_2_tss.fa")
func1(WC_file2, "WC_output2", vec)
NC_file1 <- read.fasta(file = "NC8_glc_1_tss.fa")
func2(NC_file1, "NC_output1", vec, df)
NC_file2 <- read.fasta(file = "NC8_glc_2_tss.fa")
func2(NC_file2, "NC_output2", vec, df)
