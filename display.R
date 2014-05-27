ratio <- scan("ratio.txt")

png(filename= "scatterplot_.png")
plot(ratio,main= "Scatterplot before filtering", ylab= "log2 ratio", xlab="tag")
dev.off()

png(filename= "boxplot_.png")
boxplot(ratio, main= "Boxplot before filtering", ylab= "log2 ratio", xlab="tag")
dev.off()

vec1 <- scan("vec1.txt")

png(filename= "scatterplot2.png")
plot(vec1,main= "Scatterplot after filtering", ylab= "log2 ratio", xlab="tag")
dev.off()

png(filename= "boxplot2.png")
boxplot(vec1, main= "Boxplot after filtering", ylab= "log2 ratio", xlab="tag")
dev.off()

vec4 <- scan("vec4.txt")

png(filename= "scatterplot3.png")
plot(vec4,main= "Scatterplot after filtering (without FDR filtering)", ylab= "log2 ratio", xlab="tag")
dev.off()

png(filename= "boxplot3.png")
boxplot(vec4, main= "Boxplot after filtering (without FDR filtering)", ylab= "log2 ratio", xlab="tag")
dev.off()

vec6 <- scan("vec6.txt")

png(filename= "scatterplot4.png")
plot(vec6,main= "Scatterplot after filtering (without ratio filtering)", ylab= "log2 ratio", xlab="tag")
dev.off()

png(filename= "boxplot4.png")
boxplot(vec6, main= "Boxplot after filtering (without ratio filtering)", ylab= "log2 ratio", xlab="tag")
dev.off()

