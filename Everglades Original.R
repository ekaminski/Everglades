saveAsPng <- TRUE
cat("Reading in large Everglades file...")
con <- url('http://sofia.usgs.gov/exchanget/gdesmond/haed/HAED_v01.csv')
everglades_df <- read.csv(con)
dim(everglades_df)
str(everglades_df)
surveyMethod <- everglades_df$SUR_METHOD
elevation <- everglades_df$ELEV_M 
habitat <- everglades_df$VEG_FS
x <- everglades_df$X_UTM
y <- everglades_df$Y_UTM
quad <- everglades_df$Quad_Name
summary(surveyMethod)
summary(elevation)
summary(habitat)
summary(quad)
old_par <- par()
if (saveAsPng) {png(file="Everglades_elevation.png", width = 500, height = 500)}
layout(matrix(seq(2)), heights = c(0.7,0.3))
par(mar=c(0,4.1,4.1,2.1))
hist(elevation, breaks=100, axes=FALSE, main = "Everglades Elevations", xlab="", ylab = "")
par(mar=c(5.1, 4.1, 0, 2.1), mgp=c(3,0.5,0.0))
boxplot(elevation, horizontal = TRUE, axes=FALSE)
axis(1)
mtext("elevation (m)", side=1, line=2.5, font=2)
par(old_par)
if (saveAsPng) { dev.off() }
if (saveAsPng) {png(file="Everglades_elevationByHabitat.png", width = 500, height = 500)}
par(mar=c(3.1, 12.1, 4.1, 2.1), las=1)
boxplot(elevation ~ habitat, horizontal=TRUE)
title("Distribution of Elevation by Habitat Type")
par(old_par)
if (saveAsPng) {dev.off()}
if (saveAsPng) {png(file="Everglades_elevationByQuad2.png", width = 500, height = 750)}
par(mar=c(3.1,12.1,4.1,2.1), las=1)
boxplot(elevation ~ quad, horizontal=TRUE, outline=FALSE, cex.axis=0.4)
title("Distribution of Elevation by Quad Name")
par(old_par)
if (saveAsPng) { dev.off() }
