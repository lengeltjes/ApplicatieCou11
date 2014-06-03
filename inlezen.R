conf_file <- read.table("conf.txt")
file <- read.table(as.character(conf_file$V1[1]), header=TRUE)
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

