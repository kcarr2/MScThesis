library(ggplot2)
library(gridExtra)
#PIF overlaps

# First, filter CHIP-Seq data to only include G-Box binding PIFs. Save the lists 
# as csv files for each PIF. Then load them into RStudio and transform to the proper
# format for edge overlap comparison. 


PIF1 <- read.csv('All PIF Analysis/PIF1_GBox_Edges.csv', header = T)
PIF3 <- read.csv('All PIF Analysis/PIF3_GBox_Edges.csv', header = T)
PIF4 <- read.csv('All PIF Analysis/PIF4_GBox_Edges.csv', header = T)
PIF5 <- read.csv('All PIF Analysis/PIF5_GBox_Edges.csv', header = T)

PIF1Edges <- unique(paste(PIF1[,1], PIF1[,2], sep = "_"))
PIF3Edges <- unique(paste(PIF3[,1], PIF3[,2], sep = "_"))
PIF4Edges <- unique(paste(PIF4[,1], PIF4[,2], sep = '_'))
PIF5Edges <- unique(paste(PIF5[,1], PIF5[,2], sep = '_'))

#Next, load in all networks and join to a bigNet, to make it possible 
#To filter out any genes that aren't in the big networks

load('networks/LinkLists/Silique.RData')
load('networks/LinkLists/Seed0d.RData')
load('networks/LinkLists/Seedling3d.RData')
load('networks/LinkLists/Seedling6d.RData')
load('networks/LinkLists/Seedling12d.RData')
load('networks/LinkLists/Rosette30d.RData')
load('networks/LinkLists/Stem.RData')
load('networks/LinkLists/Flower.RData')
load('networks/Rosette21dNetwork.RData')
Rosette21dNet <- GENIE3::getLinkList(Rosette21d_net)

BigNet <- rbind(SiliqueNet, Seed0dNet)
BigNet <- rbind(BigNet, Seedling3dNet)
BigNet <- rbind(BigNet, Seedling6dNet)
BigNet <- rbind(BigNet, Seedling12dNet)
BigNet <- rbind(BigNet, Rosette21dNet)
BigNet <- rbind(BigNet, Rosette30dNet)
BigNet <- rbind(BigNet, StemNet)
BigNet <- rbind(BigNet, FlowerNet)

# Next, load in all of the networks (top edges) and reformat the edges to be the 
# same as the PIF edges. 

load('networks/LinkLists/Seed0dTopEdges.RData')
load('networks/LinkLists/Seedling3dTopEdges.RData')
load('networks/LinkLists/Seedling6dTopEdges.RData')
load('networks/LinkLists/Seedling12dTopEdges.RData')
load('Rosette21dTopEdges.RData')
load('networks/LinkLists/Rosette30dTopEdges.RData')
load('networks/LinkLists/StemTopEdges.RData')
load('networks/LinkLists/FlowerTopEdges.RData')
load('networks/LinkLists/SiliqueTopEdges.RData')

Seed0d_Edges <- paste(Seed0dTopEdges[,1], Seed0dTopEdges[,2], sep = '_')
Seedling3d_Edges <- paste(Seedling3dTopEdges[,1], Seedling3dTopEdges[,2], sep = '_')
Seedling6d_Edges <- paste(Seedling6dTopEdges[,1], Seedling6dTopEdges[,2], sep = '_')
Seedling12d_Edges <- paste(Seedling12dTopEdges[,1], Seedling12dTopEdges[,2], sep = '_')
Rosette21d_Edges <- paste(Rosette21dNet_TopEdges[,1], Rosette21dNet_TopEdges[,2], sep = '_')
Rosette30d_Edges <- paste(Rosette30dTopEdges[,1], Rosette30dTopEdges[,2], sep = '_')
Stem_Edges <- paste(StemTopEdges[,1], StemTopEdges[,2], sep = '_')
Flower_Edges <- paste(FlowerTopEdges[,1], FlowerTopEdges[,2], sep = '_')
Silique_Edges <- paste(SiliqueTopEdges[,1], SiliqueTopEdges[,2], sep = '_')


# Next, calculate the number of overlapping edges between each PIF and
# each network

PIF1_overlap <- c(length(which(PIF1Edges %in% Silique_Edges)),
length(which(PIF1Edges %in% Seed0d_Edges)),
length(which(PIF1Edges %in% Seedling3d_Edges)),
length(which(PIF1Edges %in% Seedling6d_Edges)),
length(which(PIF1Edges %in% Seedling12d_Edges)),
length(which(PIF1Edges %in% Rosette21d_Edges)),
length(which(PIF1Edges %in% Rosette30d_Edges)),
length(which(PIF1Edges %in% Stem_Edges)),
length(which(PIF1Edges %in% Flower_Edges)))

length(PIF1[,2] %in% BigNet[,2])
length(PIF3[,2] %in% BigNet[,2])
length(PIF4[,2] %in% BigNet[,2])
length(PIF5[,2] %in% BigNet[,2])
#make a bar graph of this data: 
devStages <- c('Silique', 'Seed 0d', 'Seedling 3d', 'Seedling 6d', 
               'Seedling 12d', 'Rosette 21d', 'Rosette 30d', "Stem", 
               'Flower')

PIF1Graph <- data.frame(name = devStages, 
                        value = PIF1_overlap)
write.csv(PIF1Graph, file = 'All PIF Analysis/PIF1Overlaps.csv')
P1 <- ggplot(PIF1Graph, aes(x = name, y = value)) + 
  geom_bar(stat = 'identity', fill = 'darkseagreen3') +
  ggtitle('PIF1 Overlapping Edges') + 
  labs(x = 'Developmental Stage', y = 'Number of Overlapping Edges') +
  ylim(0,length(PIF1Edges %in% BigNet[,2])) +
  theme_minimal() + 
  theme(plot.title = element_text( hjust = 0.5, face = 'bold'), 
        axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1))


# Repeat for PIF3

PIF3_overlap <- c(length(which(PIF3Edges %in% Silique_Edges)),
length(which(PIF3Edges %in% Seed0d_Edges)),        
length(which(PIF3Edges %in% Seedling3d_Edges)),
length(which(PIF3Edges %in% Seedling6d_Edges)),
length(which(PIF3Edges %in% Seedling12d_Edges)),
length(which(PIF3Edges %in% Rosette21d_Edges)),
length(which(PIF3Edges %in% Rosette30d_Edges)),
length(which(PIF3Edges %in% Stem_Edges)),
length(which(PIF3Edges %in% Flower_Edges)))


PIF3Graph <- data.frame(name = devStages, value = PIF3_overlap)
write.csv(PIF3Graph, file = 'All PIF Analysis/PIF3Overlaps.csv')
P3 <- ggplot(PIF3Graph, aes(x = name, y = value)) + 
  geom_bar(stat = 'identity', fill = 'darkseagreen3') +
  ggtitle('PIF3 Overlapping Edges') + 
  labs(x = 'Developmental Stage', y = 'Number of Overlapping Edges') +
  ylim(0,length(PIF3Edges)) +
  theme_minimal() + 
  theme(plot.title = element_text( hjust = 0.5, face = 'bold'), 
        axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1))

#length(PIF3[,2] %in% Network[,2] )

#Repeat for PIF4

PIF4_overlap <- c(length(which(PIF4Edges %in% Silique_Edges)),
length(which(PIF4Edges %in% Seed0d_Edges)),
length(which(PIF4Edges %in% Seedling3d_Edges)),
length(which(PIF4Edges %in% Seedling6d_Edges)),
length(which(PIF4Edges %in% Seedling12d_Edges)),
length(which(PIF4Edges %in% Rosette21d_Edges)),
length(which(PIF4Edges %in% Rosette30d_Edges)),
length(which(PIF4Edges %in% Stem_Edges)),
length(which(PIF4Edges %in% Flower_Edges)))


PIF4Graph <- data.frame(name = devStages, 
                        value = PIF4_overlap)
write.csv(PIF4Graph, file = 'All PIF Analysis/PIF4Overlaps.csv')

P4 <- ggplot(PIF4Graph, aes(x = name, y = value)) + 
  geom_bar(stat = 'identity', fill = 'darkseagreen3') +
  ggtitle('PIF4 Overlapping Edges') + 
  ylim(0, length(PIF4Edges)) + 
  labs(x = 'Developmental Stage', y = 'Number of Overlapping Edges') +
  theme_minimal() + 
  theme(plot.title = element_text( hjust = 0.5, face = 'bold'), 
        axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1))


#Repeat for PIF5
PIF5_overlap <- c(length(which(PIF5Edges %in% Silique_Edges)),
length(which(PIF5Edges %in% Seed0d_Edges)),
length(which(PIF5Edges %in% Seedling3d_Edges)),
length(which(PIF5Edges %in% Seedling6d_Edges)),
length(which(PIF5Edges %in% Seedling12d_Edges)),
length(which(PIF5Edges %in% Rosette21d_Edges)),
length(which(PIF5Edges %in% Rosette30d_Edges)),
length(which(PIF5Edges %in% Stem_Edges)),
length(which(PIF5Edges %in% Flower_Edges)))  

PIF5Overlaps <- data.frame(name = devStages, 
                           values = PIF5_overlap)
write.csv(PIF5Overlaps, file = "All PIF Analysis/PIF5Overlaps.csv")

PIF5Graph <- data.frame(name = devStages, value = PIF5_overlap)

P5 <- ggplot(PIF5Graph, aes(x = name, y = value)) + 
  geom_bar(stat = 'identity', fill = 'darkseagreen3') +
  ggtitle('PIF5 Overlapping Edges') + 
  labs(x = 'Developmental Stage', y = 'Number of Overlapping Edges') +
  ylim(0, length(PIF5Edges)) +
  theme_minimal() + 
  theme(plot.title = element_text( hjust = 0.5, face = 'bold'), 
        axis.text.x = element_text(angle = 90, vjust = 0.5, hjust =1 ))


# Next, make the plots more interesting and find a way to mesh them all into
# one plot for the sake of the report. I think the best way to do this is by
# looking at the proportion of overlapping edges for each PIF for each stage. 

PIF1_percentage <- c(.148, 19.56, 30.92, 34.39, 23.17, 29.23, 32.03, 0.443, 5.17)

PIF1PercentGraph <- data.frame(name = devStages, value = PIF1_percentage)

P1_percent <- ggplot(PIF1PercentGraph, aes(x = name, y = value)) + 
  geom_bar(stat = 'identity', fill = 'darkseagreen') +
  ggtitle('PIF1 Overlap') + 
  labs(x = 'Developmental Stage', y = 'Percentage of Overlapping Edges') +
  ylim(0, 100) +
  theme_minimal() + 
  theme(plot.title = element_text( hjust = 0.5, face = 'bold'), 
        axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1))

PIF4_percentage <- c(1.15, 29.96, 29.58, 30.99, 30.35, 30.09, 30.35, 29.32, 15.88)

PIF4PercentGraph <- data.frame(name = devStages, value = PIF4_percentage)

P4_percent <- ggplot(PIF4PercentGraph, aes(x = name, y = value)) + 
  geom_bar(stat = 'identity', fill = 'darkseagreen') +
  ggtitle('PIF4 Overlap') + 
  labs(x = 'Developmental Stage', y = 'Percentage of Overlapping Edges') +
  ylim(0, 100) +
  theme_minimal() + 
  theme(plot.title = element_text( hjust = 0.5, face = 'bold'), 
        axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1))


PIF5_percentage <- c(21.15, 30.31, 30.02, 30.21, 29.73, 29.92, 30.12, 24.17, 9.75)

PIF5PercentGraph <- data.frame(name = devStages, 
                               value = PIF5_percentage)

P5_percent <- ggplot(PIF5PercentGraph, aes(x = name, y = value)) + 
  geom_bar(stat = 'identity', fill = 'darkseagreen') +
  ggtitle('PIF5 Overlap') + 
  labs(x = 'Developmental Stage', y = 'Percentage of Overlapping Edges') +
  ylim(0, 100) +
  theme_minimal() + 
  theme(plot.title = element_text( hjust = 0.5, face = 'bold'), 
        axis.text.x = element_text(angle = 90, vjust = 0.1, hjust = 1))

# Use the grid.arrange function to make a figure with all three plots
# side by side. 

grid.arrange(P1, P4, P5, ncol = 3)

grid.arrange(P1_percent, P4_percent, P5_percent, ncol = 3)
