library("seqinr")

file <- read.table("LP_DEG_glc.txt", header=TRUE)
ratio <- file$WCFS1.glc.over.NC8.glc
fdr <- file$fdr.WCFS1.glc.over.NC8.glc
id <- file$ID
vec <- c()
vec0 <- c()
vec1 <- c()
vec4 <- c()
vec5 <- c()
vec6 <- c()

write(ratio, file = "ratio.txt")

for(i in 1:length(ratio)){
	if (ratio[i] >= -1 & ratio[i] <= 1){
		vec0 <- c(vec0, as.character(id[i]))
		if (fdr[i] <= 0.05){
			vec <- c(vec, as.character(id[i]))
		}
	}   
}

write(vec, file = "vec.txt")

for(i in 1:length(ratio)){
	if (fdr[i] <= 0.05){
		vec5 <- c(vec5, as.character(id[i]))
	}  
}

for(y in 1:length(vec)){
	ind <- grep(vec[y], file$ID)
	vec1 <- c(vec1, file$WCFS1.glc.over.NC8.glc[ind])
}

write(vec1, file = "vec1.txt")

for(z in 1:length(vec0)){
	ind1 <- grep(vec0[z], file$ID)
	vec4 <- c(vec4, file$WCFS1.glc.over.NC8.glc[ind1])
}

write(vec4, file = "vec4.txt")

for(a in 1:length(vec5)){
	ind1 <- grep(vec5[a], file$ID)
	vec6 <- c(vec6, file$WCFS1.glc.over.NC8.glc[ind1])
}

write(vec6, file = "vec6.txt")

ortho_file <- read.table("LP_genes2.txt", header=TRUE)
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
