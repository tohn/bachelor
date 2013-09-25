# http://stackoverflow.com/questions/6461209/how-to-round-up-to-the-nearest-10-or-100-or-x
#library(plyr)

data  <- read.table("./integrity.dat", header=T, sep="|")
counts <- table(data$integrity)

#print(counts)
source("round.r")

#diff <- data$Quantity - data$fixed
#counts <- table(data$fixed, diff)
png(filename="./integrity.png", height=500, width=500, bg="white")
#print(max(counts))
#print(ceiling(max(counts)))
#print(round_any(max(counts), 10, f = ceiling))
barpos <- barplot(counts, ylim=c(0,round_up(max(counts))), main="Vollständigkeit der Produktangaben (in %)", col=c("#468847"))
#print(barpos)
#text(barpos, counts, labels=counts)
title(xlab="Vollständigkeit in %")
title(ylab="Häufigkeit")
