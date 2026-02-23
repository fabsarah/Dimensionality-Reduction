###### Dimensionality Reduction Workshop Sample Code #######
# This code is for visualizing and running singular value decomposition
# (SVD) and principal components analysis (PCA) following the
# Dimensionality Reduction workshop at SFU in October, 2025. 

# Files prepared by Sarah Faber

## Add the required packages
library(psych) 
library(stats)
library(readxl)
library(ggplot2)
library(RColorBrewer)

### 1. Running an SVD
indata <- your_data
SVD = svd(indata)# run the SVD

## Look at it!
# This syntax combines the output from the SVD into a single plot:
# This will plot the singular values:
par(mfrow = c(1, 3))
plot(SVD$d,type = "b", pch = 16,
     main = 'Elbow Plot: SVD',
     xlab = "Singular Values", 
     ylab = "Variance")

# The column scores:
image(t(SVD$v),main="Component Scores: Columns",
      col = brewer.pal(n = 11, name = "RdYlBu"),
      xlab = "Component", ylab = "Y Axis")# add in your own labels here

# and the row scores:
image(t(SVD$u),main = "Component Scores: Rows",
      col = brewer.pal(n = 11, name = "RdYlBu"),
      xlab = "Component", ylab = "Y Axis")
# Here's some sample code for adding labels:
#image(t(SVD_P1$u),main = "Row Scores: Participant 1",
#      col = brewer.pal(n = 11, name = "RdYlBu"),
#      xlab = "Component",
#      xaxt = "n",yaxt = "n")+ # this tuns off the automatic axis labelling
#  axis(1, at = c(seq(from=0,to=1,length.out=8)),# I had 8 columns
#       labels = c(1:8))+ # this will give the ticks numerical labels
#  axis(2, at = c(seq(from=0,to=1,length.out=42)),# and 42 rows
#       labels = c(labels),# and a variable called "labels"
#       las = 1)

## 2. Running a PCA:
# There are MANY ways to do this in R. I went with the version that
# most closely mirrored the MatLab syntax for the purposes of the 
# workshop, but if there's a package you like using that includes PCA,
# use that!

indata = your_data
x = n_dimensions_in_your_data# whichever number is smaller between your rows and your columns

pca_results<-principal(t(indata),nfactors=x,rotate ="none",
                  covar=FALSE,scores=TRUE,missing=FALSE)
## Look at it!
# Feel free to give your plot titles more helpful names
par(mfrow = c(1, 2))
plot(pca_P1$values,type = "b", pch = 16,
     main = 'Skree Plot: PCA 1',
     xlab = "Component", 
     ylab = "% Variance Explained")

image(t(pca$loadings),main = "Component Scores: PCA",
      col = brewer.pal(n = 11, name = "RdYlBu"),
      xlab = "Component")