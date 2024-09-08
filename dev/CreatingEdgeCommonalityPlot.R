# This script is used to generate the bar graph figure showing the 
# number of networks in which each edge appears



# load in all networks. Note: these are the filtered networks 
# consisting of only the top 50,000 edges.
load('Networks/SiliqueTopEdges.RData')
load('Networks/Seed0dTopEdges.RData')
load('Networks/Seedling3dTopEdges.RData')
load('Networks/Seedling6dTopEdges.RData')
load('Networks/Seedling12dTopEdges.RData')
load('Networks/Rosette21dTopEdges.RData')
load('Networks/Rosette30dTopEdges.RData')
load('Networks/StemTopEdges.RData')
load('Networks/FlowerTopEdges.RData')
#combine all networks into a big network

BigNet <- rbind(SiliqueTopEdges, Seed0dTopEdges)
BigNet <- rbind(BigNet, Seedling3dTopEdges)
BigNet <- rbind(BigNet, Seedling6dTopEdges)
BigNet <- rbind(BigNet, Seedling12dTopEdges)
BigNet <- rbind(BigNet, Rosette21dNet_TopEdges)
BigNet <- rbind(BigNet, Rosette30dTopEdges)
BigNet <- rbind(BigNet, StemTopEdges)
BigNet <- rbind(BigNet, FlowerTopEdges)
#plot a table of the edges in each network: 
BigNet <- unique(BigNet)
edges <- paste(BigNet[,1], BigNet[,2])
plot(table(table(edges)), 
     xlab = "Number of Networks Containing Edge", 
     ylab = "Number of Edges", 
     main = "Edge Commonality Plot")
