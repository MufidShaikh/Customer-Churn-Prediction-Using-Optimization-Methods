library(ggplot2)
library(readr)
library(GA)
library(dplyr)
library(geosphere)

VRP_data <- read_csv("vrpData.csv")

summary(VRP_data)

# Function to load data and compute distance matrix

loadAndComputeDistMatrix <- function(filePath, encoding = "ISO-8859-1") {
  # Load dataset
  #data <- read.csv("vrpData.csv")
  data <- read.csv("vrpData.csv", fileEncoding = encoding, stringsAsFactors = FALSE)
  # Assuming 'XCOORD' and 'YCOORD' are the columns with coordinates
  # This is just a precaution and may need to be adjusted based on your data's specifics
  data$XCOORD <- as.numeric(gsub("[^0-9.-]", "", data$XCOORD))
  data$YCOORD <- as.numeric(gsub("[^0-9.-]", "", data$YCOORD))
  
  coords <- data.frame(lon = data$XCOORD, lat = data$YCOORD)
  
  # Compute distance matrix
  distMatrix <- distm(coords[,c("lon", "lat")], fun = distVincentySphere)
  
  return(distMatrix)
}

# Example usage
filePath <- "vrpData.csv" # Update this path to the location of your dataset
distMatrix <- loadAndComputeDistMatrix(filePath, encoding = "ISO-8859-1")
# Example: Calculating a distance matrix
#compute_distance_matrix <- function(locations) {
  # A simple Euclidean distance calculation
 # dist_matrix <- as.matrix(dist(locations))
  #return(dist_matrix) }


tourLength <- function(tour, distMatrix) {
  tour <- c(tour, tour[1])
  route <- embed(tour, 2)[,2:1]
  tourlength <- sum(distMatrix[route])
  return(tourlength)
}

tspFitness <- function(tour, ...) {
  return (1/tourLength(tour, ...))
}

# Adjust the upper limit based on the number of locations (customers) in your dataset
numLocations <- nrow(distMatrix) 

GAresult <- ga(type = "permutation",
               fitness = tspFitness, 
               distMatrix = distMatrix, 
               lower = 1, 
               upper = numLocations, 
               popSize = 50, 
               maxiter = 50, 
               pcrossover = 0.8, 
               pmutation = 0.2, 
               seed = 1)


#plotTSPSolution <- function(solution) {
  # Assuming solution plotting remains similar but you may not have 'labels'
  # If you don't have specific labels, you can use the customer numbers as labels
 # labels <- as.character(1:length(solution))
  
  # Adjust plotting based on your needs
  # This example assumes you have 'x' and 'y' as coordinates
 # plot(distMatrix[,1], distMatrix[,2], type = "n", asp = 1, xlab = "", ylab = "")
  # Your plotting logic here...
#}
