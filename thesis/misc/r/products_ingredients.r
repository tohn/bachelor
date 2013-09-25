# Read car and truck values from tab-delimited autos.dat
data <- read.table("./products_ingredients.dat", header=T, sep="|")
#data <- read.table("./products_ingredients2.dat", header=T, sep="|")
#data <- read.table("./autos.dat", header=T, sep="\t")

# Compute the largest y value used in the data (or we could
# just use range again)
# http://stackoverflow.com/questions/77434/how-to-access-the-last-value-in-a-vector
max_x <- tail(data$inganz, n=1)
max_y <- max(data$anz)
med <- median(data$anz)

#print(max_x)
#print(max_y)

# http://stackoverflow.com/questions/14424565/how-to-fill-date-gaps-in-data-frame
#print(data)
#print(data$anz)
#print(data$inganz)
hh <- data.frame(i=seq(min(1), max(max_x), by=1))
#print(hh)
res <- merge(data,hh,by.x='inganz',by.y='i',all.x=T,all.y=T)
#print(res)
# Define colors to be used for cars, trucks, suvs
plot_colors <- c("red")

# Start PNG device driver to save output to figure.png
#png(filename="./products_ingredients.png", height=295, width=300,
png(filename="./products_ingredients.png")
#, height=500, width=500, bg="white")

# Graph autos using y axis that ranges from 0 to max_y.
# Turn off axes and annotations (axis labels) so we can
# specify them ourself
plot(res$anz, type="h", col=plot_colors[1],
   ylim=c(1,max_y), xlim=c(1,max_x), axes=FALSE, ann=FALSE)

#plot(data$anzahl, data$inganz)
#abline(lm(data$anzahl~data$inganz))

# Make x axis using Mon-Fri labels
#axis(1, at=1:5, lab=c("Mon", "Tue", "Wed", "Thu", "Fri"))
axis(1, las=1, at=1*0:max_x)

# Make y axis with horizontal labels that display ticks at
# every 4 marks. 4*0:max_y is equivalent to c(0,4,8,12).
axis(2, las=1, at=1*0:max_y)
# Create box around plot
#box()

# Graph trucks with red dashed line and square points
#lines(data$count, type="o", pch=22, lty=2,
#   col=plot_colors[1])

# Graph suvs with green dotted line and diamond points
#lines(data$suvs, type="o", pch=23, lty=3,
#   col=plot_colors[3])

# Create a title with a red, bold/italic font
desc = paste("Häufigkeiten der Zutatenanzahl in", sum(data$anz),
			 "Produkten", sep=" ")
title(main=desc)

# Label the x and y axes with dark green text
title(xlab="Anzahl Zutaten in Produkt")
title(ylab="Häufigkeit")

# Create a legend at (1, max_y) that is slightly smaller
# (cex) and uses the same line colors and points used by
# the actual plots
#legend(1, max_y, names(data), cex=0.8, col=plot_colors,
#   pch=21:23, lty=1:3);

# Turn off device driver (to flush output to png)
dev.off()
