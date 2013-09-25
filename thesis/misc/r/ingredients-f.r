data  <- read.table("./ingredients-f.dat", header=T, sep="|")
counts <- table(data$fixed, data$veganity_id)
#counts <- table(data$veganity_id, data$fixed)
#counts <- table(data$veganity_id, data$fixed, data$hide)
#diff <- data$Quantity - data$fixed
#counts <- table(data$fixed, diff)

png(filename="./ingredients-f.png", height=500, width=500, bg="white")
desc = paste("Verteilung der", sum(counts), "Zutaten auf die Veganitäten", sep = " ")
#barplot(counts, density=4, ylim=c(1,round_up(max(counts), 50)), main=desc, names.arg=(data$Veganity),
barplot(counts, ylim=c(1,round_up(max(counts), 50)), main=desc, names.arg=(data$Veganity),
#barplot(counts, ylim=c(0,220), main=desc, names.arg=(data$Veganity),
		#col=c("#468847", "#c05b59", "#c09853", "#3a87ad"), legend =
		col=c("#468847", "#c05b59"), legend =
		#col=counts, legend =
		rownames(counts))
title(xlab="Veganität")
title(ylab="Anzahl Zutaten")
