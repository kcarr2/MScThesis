#load packages: 
library(GENIE3)
library(Matrix)
library(network)
library(igraph)
library(pheatmap)
source('dev/dataprocessingHelperFunctions.R')

#Import all networks and verify they look okay: 
Flower <- load('networks/Flower_network_nTrees_500_reattempt.RData')
Flower <- Flower_net
rm(Flower_net)
hist(Flower[,3])
FlowerEdges <- getLinkList(Flower)

Seed0d <- load('networks/Seed0d_network_nTrees_500_reattempt.RData')
Seed0d <- Seed0d_net
rm(Seed0d_net)


Seed0dEdges <- getLinkList(Seed0d)

Seedling3d <- load('networks/Seedling3d_network_nTrees_500_reattempt.RData')
Seedling3d <- Seedling3d_net
rm(Seedling3d_net)

Seedling3dEdges <- getLinkList(Seedling3d)

Seedling6d <- load('networks/Seedling6d_network_nTrees_500_reattempt.RData')
Seedling6d <- Seedling6d_net
rm(Seedling6d_net)


Seedling6dEdges <- getLinkList(Seedling6d)

Seedling12d <- load('networks/Seedling12d_network_nTrees_500_reattempt.RData')
Seedling12d <- Seedling12d_net
rm(Seedling12d_net)

Seedling12dEdges <- getLinkList(Seedling12d)

Rosette21d <- load('networks/Rosette21d_network_nTrees_500_reattempt.RData')
Rosette21d <- Rosette21d_net
rm(Rosette21d_net)

Rosette21dEdges <- getLinkList(Rosette21d)

Araboxcis <- read.csv('gboxNetwork22C.csv', header = T)

# Rosette30d <- load('networks/Rosette30d_network_nTrees_500_reattempt.RData')
# Rosette30d <- Rosette30d_net
# rm(Rosette30d_net)
# 
# Rosette30dEdges <- getLinkList(Rosette30d)

Silique <- load('networks/SiliqueNetwork_nTree_1000_reattempt.RData')
Silique <- SiliqueReattempt
rm(SiliqueReattempt)

SiliqueEdges <- getLinkList(Silique)

Stem <- load('networks/Stem_network_nTrees_500_reattempt.RData')
Stem <- Stem_net
rm(Stem_net)

StemEdges <- getLinkList(Stem)


#Convert all to adjacency: 

# Flower <- convertToAdjacency(Flower, thresh = 0)
# Seed0d <- convertToAdjacency(Seed0d, thresh = 0)
# Seedling3d <- convertToAdjacency(Seedling3d, thresh = 0)
# Seedling6d <- convertToAdjacency(Seedling6d, thresh = 0)
# Seedling12d <- convertToAdjacency(Seedling12d, thresh = 0)
# Silique <- convertToAdjacency(Silique, thresh = 0)
# Stem <- convertToAdjacency(Stem, thresh = 0)
# Rosette21d <- convertToAdjacency(Rosette21d, thresh = 0)
# Rosette30d <- convertToAdjacency(Rosette30d, thresh = 0)
#Seedling12d and Stem are much larger than the other networks. Create histograms 
#of edge scores for those two to determine an appropriate cutoff, looking for 
#1000 - 2000 top edges. 

hist(Stem[,3])
hist(Seedling12d[,3])
hist(Silique[,3])

#histogram of the 3rd column of Seedling12d (contains edge scores) 
#both seem to cut off around .03, so use that as the threshold value in convert to adjacency
#the resulting stem network has 2058 edges, and the resulting Seedling12d network has 
# 1072 edges. 
#Silique is suspiciously small, and contains "NA" values. Repeat network code for Silique. 




#Make the stupid bar graph: 

BigNet <- rbind(FlowerEdges, Seed0dEdges)
BigNet <- rbind(BigNet, Seedling3dEdges)
BigNet <- rbind(BigNet, Seedling6dEdges)
BigNet <- rbind(BigNet,Seedling12dEdges)
BigNet <- rbind(BigNet, Rosette21dEdges)
 #BigNet <- rbind(BigNet, Rosette30d)
BigNet <- rbind(BigNet, StemEdges)
BigNet <- rbind(BigNet, SiliqueEdges)

edges = paste(BigNet[,1], BigNet[,2])
plot(table(table(edges)))

table(table(edges))

#Save the edges that only appear in x networks

OneNetEdges <- edges[which(table(edges) == 1)]
write.csv(OneNetEdges, file = 'OneNetEdges.csv')

TwoNetEdges <- edges[which(table(edges) == 2)]
write.csv(TwoNetEdges, file = 'TwoNetEdges.csv')

ThreeNetEdges <- edges[which(table(edges) == 3)]
write.csv(ThreeNetEdges, file = 'ThreeNetEdges.csv')



#Find 20 highest degree TF's for each 
tfsFlower <- table(FlowerEdges[,1])
FlowerHighestDegreeTF <- sort(tfsFlower, decreasing = TRUE)[1:20]
write.csv(FlowerHighestDegreeTF, file = '20HighestDegreeTFs/Flower.csv')

tfsSeed0d <- table(Seed0dEdges[,1])
Seed0dHD <- sort(tfsSeed0d, decreasing = TRUE)[1:20]
write.csv(Seed0dHD, file = '20HighestDegreeTFs/Seed0d.csv')

tfsSeedling3d <- table(Seedling3dEdges[,1])
Seedling3dHD <- sort(tfsSeedling3d, decreasing = TRUE)[1:20]
write.csv(Seedling3dHD, file = '20HighestDegreeTFs/Seedling3d.csv')

tfsSeedling6d <- table(Seedling6dEdges[,1])
Seedling6dHD <- sort(tfsSeedling6d, decreasing = TRUE)[1:20]
write.csv(Seedling6dHD, file = '20HighestDegreeTFs/Seedling6d.csv')

tfsSeedling12d <- table(Seedling12dEdges[,1])
Seedling12dHD <- sort(tfsSeedling12d, decreasing = TRUE)[1:20]
write.csv(Seedling12dHD, file = '20HighestDegreeTFs/Seedling12d.csv')

tfsRosette21d <- table(Rosette21dEdges[,1])
Rosette21dHD <- sort(tfsRosette21d, decreasing = TRUE)[1:20]
write.csv(Rosette21dHD, file = '20HighestDegreeTFs/Rosette21d.csv')

# tfsRosette30d <- table(Rosette30d[,1])
# Rosette30dHD <- sort(tfsRosette30d, decreasing = TRUE)[1:20]
# write.csv(Rosette30dHD, file = '20HighestDegreeTFs/Rosette30d.csv')

tfsSilique <- table(SiliqueEdges[,1])
SiliqueHD <- sort(tfsSilique, decreasing = TRUE)[1:20]
write.csv(SiliqueHD, file = '20HighestDegreeTFs/Silique.csv')

tfsStem <- table(StemEdges[,1])
StemHD <- sort(tfsStem, decreasing = TRUE)[1:20]
write.csv(StemHD, file = '20HighestDegreeTFs/Stem.csv')

