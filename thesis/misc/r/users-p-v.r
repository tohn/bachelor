data <- read.table("./users-p-v.dat", header=T, sep="|")
#counts <- table(data$Provider, data$Lifestyle)
counts <- table(data$Lifestyle, data$Provider)
#counts <- table(data$Vegan)
#counts <- table(data["Vegan"], data["Vegetarisch"],
#				data["Karnistisch"])
png(filename="./users-p-v.png", height=500, width=500, bg="white")
desc = paste("Verteilung der", sum(counts), "Tester*innen auf die
			 Anbieter*innen inkl. Lebensweise", sep = " ")

print(table(data$Provider))
print(counts)

barplot(counts, main=desc, col=c("#c05b59", "#468848", "#c09853"),
		legend = rownames(counts))
title(xlab="Anbieter*in")
title(ylab="Anzahl Tester*innen")
# TODO: add legende
#barplot(counts, main=desc, col=c("#468848", "#c09853", "#c05b59"))


#, names.arg=(unique(sort(data$Provider))))
#,
#		col=c("darkblue","red","green","yellow"))
#barplot(counts, main=desc, names.arg=(data$Provider),
#		col=c("#171515", "#cf3e2c", "#45619d", "#00aced"))
