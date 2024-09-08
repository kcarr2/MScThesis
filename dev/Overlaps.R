#Load in the Araboxcis network
araboxcis <- read.csv('gboxNetwork22C.csv', header = T)

#Load in all networks
load('UnfilteredNetworks/SiliqueNetwork.RData')
load('UnfilteredNetworks/Seed0dNetwork.RData')
load('UnfilteredNetworks/Seedling3dNetwork.RData')
load('UnfilteredNetworks/Seedling6dNetwork.RData')
load('UnfilteredNetworks/Seedling12dNetwork.RData')
load('UnfilteredNetworks/Rosette21dNetwork.RData')
load('UnfilteredNetworks/Rosette30dNetwork.RData')
load('UnfilteredNetworks/StemNetwork.RData')
load('UnfilteredNetworks/FlowerNetwork.RData')

# #For each network filter AraBOXCis to only contain genes present in that 
# network. Then, scale the new network to the same size as the filtered 
# araboxcis. 


genesInFlower <- unique(c(FlowerNet[,1], FlowerNet[,2]))
araboxcisFilered <- araboxcis[which(araboxcis[,1] %in% genesInFlower & araboxcis[,2] %in% genesInFlower),]

FlowerTopEdges <- FlowerNet[1:length(araboxcisFilered[,1]),]

genesInRosette21d <- unique(c(Rosette21d_net[,1], Rosette21d_net[,2]))
araboxcisFiltered <- araboxcis[which(araboxcis[,1] %in% genesInRosette21d & araboxcis[,2] %in% genesInRosette21d),]

Rosette21dTopEdges <- Rosette21d_net[1:length(araboxcisFiltered[,1]),]
save(Rosette21dTopEdges, file = 'networks/LinkLists/Rosette21dTopEdges.RData')

Rosette21dTopEdges <- paste(Rosette21dTopEdges[,1], Rosette21dTopEdges[,2], sep = '_')
edgesOld <- paste(araboxcisFilered[,1], araboxcisFilered[,2], sep = '_')

length(which(FlowerTopEdges %in% edgesOld))

genesInRosette30d <- unique(c(Rosette30dNet[,1], Rosette30dNet[,2]))
araboxcisFiltered <- araboxcis[which(araboxcis[,1] %in% genesInRosette30d & araboxcis[,2] %in% genesInRosette30d),]

Rosette30dTopEdges <- Rosette30dNet[1:length(araboxcisFiltered[,1]),]
edgesOld <- paste(araboxcisFiltered[,1], araboxcisFiltered[,2], SEP = '_')
Rosette30dEdges <- paste(Rosette30dTopEdges[,1], Rosette30dTopEdges[,2], sep = '_')

save(Rosette30dTopEdges, file = 'networks/LinkLists/Rosette30dTopEdges.RData')

length(which(Rosette30dEdges %in% edgesOld))
length(which(FlowerEdges %in% Rosette30dEdges))
length(which(FlowerEdges %in% edgesOld))


genesInSeed0d <- unique(c(Seed0dNet[,1], Seed0dNet[,2]))
araboxcisFiltered <- araboxcis[which(araboxcis[,1] %in% genesInSeed0d & araboxcis[,2] %in% genesInSeed0d),]

Seed0dTopEdges <- Seed0dNet[1:length(araboxcisFiltered[,1]),]
save(Seed0dTopEdges, file = 'networks/LinkLists/Seed0dTopEdges.RData')

Seed0dEdges <- paste(Seed0dTopEdges[,1], Seed0dTopEdges[,2], sep = '_')
edgesOld <- paste(araboxcisFiltered[,1], araboxcisFiltered[,2], sep = '_')

length(which(Seed0dEdges %in% edgesOld))
length(which(Seed0dEdges %in% FlowerEdges))
length(which(Seed0dEdges %in% Rosette30dEdges))

genesInSeedling3d <- unique(c(Seedling3dNet[,1], Seedling3dNet[,2]))
araboxcisFiltered <- araboxcis[which(araboxcis[,1] %in% genesInSeedling3d & araboxcis[,2] %in% genesInSeedling3d),]

Seedling3dTopEdges <- Seedling3dNet[1:length(araboxcisFiltered[,1]),]
save(Seedling3dTopEdges, file = 'networks/LinkLists/Seedling3dTopEdges.RData')

Seedling3dEdges <- paste(Seedling3dTopEdges[,1], Seedling3dTopEdges[,2], sep = '_')
edgesOld <- paste(araboxcisFiltered[,1], araboxcisFiltered[,2], sep = '_')

length(which(Seedling3dEdges %in% edgesOld))
length(which(Seedling3dEdges %in% Seed0dEdges))
length(which(Seedling3dEdges %in% Rosette30dEdges))
length(which(Seedling3dEdges %in% FlowerEdges))



genesInSeedling6d <- unique(c(Seedling6dNet[,1], Seedling6dNet[,2]))
araboxcisFiltered <- araboxcis[which(araboxcis[,1] %in% genesInSeedling6d & araboxcis[,2] %in% genesInSeedling6d),]

Seedling6dTopEdges <- Seedling6dNet[1:length(araboxcisFiltered[,1]),]
save(Seedling6dTopEdges, file = 'networks/LinkLists/Seedling6dTopEdges.RData')

Seedling6dEdges <- paste(Seedling6dTopEdges[,1], Seedling6dTopEdges[,2], sep = '_')
edgesOld <- paste(araboxcisFiltered[,1], araboxcisFiltered[,2], sep = '_')

length(which(Seedling6dEdges %in% edgesOld))
length(which(Seedling6dEdges %in% FlowerEdges))
length(which(Seedling6dEdges %in% Seedling3dEdges))
  length(which(Seedling6dEdges %in% Seed0dEdges))
length(which(Seedling6dEdges %in% Rosette30dEdges))  


genesInSeedling12d <- unique(c(Seedling12dNet[,1], Seedling12dNet[,2]))
araboxcisFiltered <- araboxcis[which(araboxcis[,1] %in% genesInSeedling12d & araboxcis[,2] %in% genesInSeedling12d),]

Seedling12dTopEdges <- Seedling12dNet[1:length(araboxcisFiltered[,1]),]
save(Seedling12dTopEdges, file = 'networks/LinkLists/Seedling12dTopEdges.RData')

Seedling12dEdges <- paste(Seedling12dTopEdges[,1], Seedling12dTopEdges[,2], sep = '_')
edgesOld <- paste(araboxcisFiltered[,1], araboxcisFiltered[,2], sep = '_')

length(which(Seedling12dEdges %in% edgesOld))
length(which(Seedling12dEdges %in% FlowerEdges))
length(which(Seedling12dEdges %in% Rosette30dEdges))
length(which(Seedling12dEdges %in% Seed0dEdges))
length(which(Seedling12dEdges %in% Seedling3dEdges))
length(which(Seedling12dEdges %in% Seedling6dEdges))

genesInSilique <- unique(c(SiliqueNet[,1], SiliqueNet[,2]))
araboxcisFiltered <- araboxcis[which(araboxcis[,1] %in% genesInSilique & araboxcis[,2] %in% genesInSilique),]

SiliqueTopEdges <- SiliqueNet[1:length(araboxcisFiltered[,1]),]
save(SiliqueTopEdges, file = 'networks/LinkLists/SiliqueTopEdges.RData')

SiliqueEdges <- paste(SiliqueTopEdges[,1], SiliqueTopEdges[,2], sep = '_')
edgesOld <- paste(araboxcisFiltered[,1], araboxcisFiltered[,2], sep = '_')

length(which(SiliqueEdges %in% edgesOld))
length(which(SiliqueEdges %in% FlowerEdges))
length(which(SiliqueEdges %in% Rosette30dEdges))
length(which(SiliqueEdges %in% Seed0dEdges))
length(which(SiliqueEdges %in% Seedling3dEdges))
length(which(SiliqueEdges %in% Seedling6dEdges))
length(which(SiliqueEdges %in% Seedling12dEdges))

genesInStem <- unique(c(StemNet[,1], StemNet[,2]))
araboxcisFiltered <- araboxcis[which(araboxcis[,1] %in% genesInStem & araboxcis[,2] %in% genesInStem),]

StemTopEdges <- StemNet[1:length(araboxcisFiltered[,1]),]
save(StemTopEdges, file = 'networks/LinkLists/StemTopEdges.RData')

StemEdges <- paste(StemTopEdges[,1], StemTopEdges[,2], sep = '_')
edgesOld <- paste(araboxcisFiltered[,1], araboxcisFiltered[,2], sep = '_')

length(which(StemEdges %in% edgesOld))
length(which(StemEdges %in% FlowerEdges))
length(which(StemEdges %in% Rosette30dEdges))
length(which(StemEdges %in% Seed0dEdges))
length(which(StemEdges %in% Seedling3dEdges))
length(which(StemEdges %in% Seedling6dEdges))
length(which(StemEdges %in% Seedling12dEdges))
length(which(StemEdges %in% SiliqueEdges))

FlowerR30 <- FlowerEdges[which(FlowerEdges %in% Rosette30dEdges)]
write.csv(FlowerR30, file = 'OverlappingEdges/FlowerR30.csv')

R30Silique <- SiliqueEdges[which(SiliqueEdges %in% Rosette30dEdges)]
write.csv(R30Silique, file = 'OverlappingEdges/R30Silique.csv')

StemSeed0d <- StemEdges[which(StemEdges %in% Seed0dEdges)]
write.csv(StemSeed0d, file = 'OverlappingEdges/StemSeed0d.csv')

FlowerSilique <- FlowerEdges[which(FlowerEdges %in% SiliqueEdges)]
write.csv(FlowerSilique, file = 'OverlappingEdges/FlowerSilique.csv')

Seed0dSilique <- Seed0dEdges[which(Seed0dEdges %in% SiliqueEdges)]
write.csv(Seed0dSilique, file = 'OverlappingEdges/Seed0dSilique.csv')

Seedling3dSeedling12d <- Seedling3dEdges[which(Seedling3dEdges %in% Seedling12dEdges)]
write.csv(Seedling3dSeedling12d, file = "OverlappingEdges/Seedling3dSeedling12d.csv")

