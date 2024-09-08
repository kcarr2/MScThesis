library(GENIE3)
library(Matrix)
a = load('networks/Rosette30d_network_nTrees_500_reattempt2.RData')
newNet <- GENIE3::getLinkList(Rosette30d_net)
araboxcis <- read.csv('gboxNetwork22C.csv', header = T)

genesInNet = unique(c(newNet[,1], newNet[,2]))
araboxcisFiltered <- araboxcis[which(araboxcis[,1] %in% genesInNet & araboxcis[,2] %in% genesInNet),]

newNetTopEdges <- newNet[1:length(araboxcisFiltered[,1]),]
edgesNew <- paste(newNetTopEdges[,1], newNetTopEdges[,2], sep = '_')


tfsNew <- table(newNetTopEdges[,1])
Rosette30dTopTFs <- sort(tfsNew, decreasing = T)[1:20]
write.csv(Rosette30dTopTFs, file = '20HighestDegreeTFsRosette30d.csv')

library(igraph)
library(network)

library(pheatmap)

simple_network <- graph_from_edgelist(as.matrix(Rosette21dNet_TopEdges[,c(1,2)]))
node_betweenness_all <- betweenness(simple_network)
node_betweenness <- node_betweenness_all[which(node_betweenness_all>0)]
Rosette21dHighestBetweenness <- sort(node_betweenness, decreasing = T)[1:20]
write.csv(Rosette21dHighestBetweenness, file = '20HighestBetweenness/Rosette21d.csv')

node_centrality_all <- alpha_centrality(simple_network, alpha = 0.9)
node_centrality <- node_centrality_all[which(node_centrality_all>0)]
Rosette30d_HighestCentrality <- sort(node_centrality, decreasing = T)[1:20]
write.csv(Rosette30d_HighestCentrality, file = '20HighestCentrality/Rosette30d.csv')

node_hub_all <- hub_score(simple_network)$vector
node_hub <- node_hub_all[which(node_hub_all>0)]
Rosette30dHighestHub <- sort(node_hub, decreasing = T)[1:20]
write.csv(Rosette30dHighestHub, file = '20HighestHub/Rosette30d.csv')

