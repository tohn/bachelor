data  <- read.table("./products.dat", header=T, sep="|")
counts <- data$Quantity
png(filename="./products.png", height=500, width=500, bg="white")
# http://stackoverflow.com/questions/7201341/how-can-2-strings-be-concatenated-in-r
desc = paste("Verteilung der", sum(counts), "Produkte auf die Veganitäten", sep = " ")
barplot(counts, main=desc, ylim=c(0, round_up(max(counts))), names.arg=(data$Veganity),
#		col=c("#468847", "#c05b59", "#c09853", "#3a87ad"))
		col=c("#3a87ad", "#c09853", "#c05b59", "#468847"))
title(xlab="Veganität")
title(ylab="Anzahl Produkte")
