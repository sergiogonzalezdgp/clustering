#######################################################
######----UC matriz contingencia componente----s#######
#######################################################

#Tabla de contingencia USUARIO-COMPONENTE
fisher.test(UC, simulate.p.value=TRUE, B=2e3) #test independencia entre variables
chisq.test(UC, simulate.p.value = T)
prop.table(UC) #proporción de ocurrencias
mosaicplot(UC, color=TRUE, main="Test de independencia", las = 1,  dir ="V", border = NA) ## shade=TRUE standarized residuals


#Cluster y contexto del evento
UCE_escalado <- UCE
UCE_escalado = as.data.frame.matrix(scale(UCE)) #Escalar
UCE_escalado

#Elbow
set.seed(123)
fviz_nbclust(UCE_escalado, kmeans, method = "wss")

#Sillhoutte
set.seed(123)
fviz_nbclust(UCE_escalado, kmeans, method = "silhouette")

#GAP STAT
set.seed(123)
fviz_nbclust(UCE_escalado, kmeans, method = "gap_stat")

# Extracción de Cluster
cl_1 <- kmeans(UCE_escalado,1,nstart = 50, iter.max = 15)
cl_2 <- kmeans(UCE_escalado,2,nstart = 50, iter.max = 15)
cl_3 <- kmeans(UCE_escalado,3,nstart = 50, iter.max = 15)
cl_4 <- kmeans(UCE_escalado,4,nstart = 50, iter.max = 15)

#ALMACENAR K=1:K=4
p_cl1 <- fviz_cluster(cl_1, data = UCE_escalado,
                      palette = c("#00AFBB","#2E9FDF", "#E7B800"),
                      ggtheme = theme_minimal(),
                      main = "K=1"
) + theme(plot.margin = unit(c(1, 1, 1, 1), "cm")) + theme(plot.title = element_text(hjust = 0.5))

p_cl2 <- fviz_cluster(cl_2, data = UCE_escalado,
                      palette = c("#00AFBB","#2E9FDF", "#E7B800"),
                      ggtheme = theme_minimal(),
                      main = "K=2"
) + theme(plot.margin = unit(c(1, 1, 1, 1), "cm")) + theme(plot.title = element_text(hjust = 0.5))

p_cl3 <- fviz_cluster(cl_3, data = UCE_escalado,
                      palette = c("#00AFBB","#2E9FDF", "#E7B800"),
                      ggtheme = theme_minimal(),
                      main = "K=3"
) + theme(plot.margin = unit(c(1, 1, 1, 1), "cm")) + theme(plot.title = element_text(hjust = 0.5))

p_cl4 <- fviz_cluster(cl_4, data = UCE_escalado,
                      palette = c("#00AFBB","#2E9FDF", "#E7B800", "#ff5e78"),
                      ggtheme = theme_minimal(),
                      main = "K=4"
) + theme(plot.margin = unit(c(1, 1, 1, 1), "cm")) + theme(plot.title = element_text(hjust = 0.5))


library(gridExtra)
grid.arrange(p_cl1, p_cl2, p_cl3, p_cl4, nrow = 2, margin())

#CLUSTER UCE Girado
library(gplots)
UCE_girado <- t(UCE)
balloonplot(t(UCE_girado), main ="Contexto", xlab ="", ylab="", label = FALSE, show.margins = FALSE) #Frecuencias

UCE_girado = as.data.frame.matrix(scale(UCE_girado)) #Escalar

#Elbow
set.seed(123)
fviz_nbclust(UCE_girado, kmeans, method = "wss")

#Sillhoutte
set.seed(123)
fviz_nbclust(UCE_girado, kmeans, method = "silhouette")

#GAP STAT
set.seed(123)
fviz_nbclust(UCE_girado, kmeans, method = "gap_stat")

#EXTRACCION
cl_UCE_2 <- kmeans(UCE_girado,2,nstart = 50, iter.max = 15)
cl_UCE_3 <- kmeans(UCE_girado,3,nstart = 50, iter.max = 15)

p_UCE_cl2 <- fviz_cluster(cl_UCE_2, data = UCE_girado,
                      palette = c("#00AFBB","#2E9FDF", "#E7B800"),
                      ggtheme = theme_minimal(),
                      main = "K=2"
) + theme(plot.margin = unit(c(1, 1, 1, 1), "cm")) + theme(plot.title = element_text(hjust = 0.5))

p_UCE_cl3 <- fviz_cluster(cl_UCE_3, data = UCE_girado,
                      palette = c("#00AFBB","#2E9FDF", "#E7B800"),
                      ggtheme = theme_minimal(),
                      main = "K=3"
) + theme(plot.margin = unit(c(1, 1, 1, 1), "cm")) + theme(plot.title = element_text(hjust = 0.5))


#CLUSTER ANALISIS
UC_escalado = as.data.frame.matrix(scale(UC)) #Escalar
UC_escalado
set.seed(123)
cl_2 <- kmeans(UC_escalado,2,nstart = 50, iter.max = 15)
cl_3 <- kmeans(UC_escalado,3,nstart = 50, iter.max = 15)
cl_4 <- kmeans(UC_escalado,4,nstart = 50, iter.max = 15)
cl_5 <- kmeans(UC_escalado,5,nstart = 50, iter.max = 15)
library(factoextra)
fviz_nbclust(UC_escalado, kmeans, method = "wss")

fviz_cluster(cl_4, data = UC_escalado,
             palette = c("#00AFBB","#2E9FDF", "#E7B800"),
             ggtheme = theme_minimal(),
             main = "Partitioning Clustering Plot"
) + theme(plot.margin = unit(c(1, 1, 1, 1), "cm")) + theme(plot.title = element_text(hjust = 0.5))

#CLUSTER2
UC_escalado2 = as.data.frame.matrix(scale(UCE)) #Escalar
UC_escalado2
set.seed(123)
fviz_nbclust(UC_escalado2, kmeans, method = "wss")
cl2_2 <- kmeans(UC_escalado2,2,nstart = 50, iter.max = 15)
fviz_cluster(cl2_2, data = UC_escalado2,
             palette = c("#00AFBB","#2E9FDF", "#E7B800"),
             ggtheme = theme_minimal(),
             main = "Partitioning Clustering Plot"
) +theme(plot.margin = unit(c(1, 1, 1, 1), "cm")) + theme(plot.title = element_text(hjust = 0.5))

#UC_gir
UC_escalado3 = as.data.frame.matrix(scale(UC_gir)) #Escalar
UC_escalado3
set.seed(123)
cl3_2 <- kmeans(UC_escalado3,2,nstart = 50, iter.max = 15)
fviz_cluster(cl3_2, data = UC_escalado3,
             palette = c("#00AFBB","#2E9FDF", "#E7B800"),
             ggtheme = theme_minimal(),
             main = "Partitioning Clustering Plot"
) +theme(plot.margin = unit(c(1, 1, 1, 1), "cm")) + theme(plot.title = element_text(hjust = 0.5))


#Análisis de correspondencia
library(FactoMineR)
library(gplots)
UC_gir <- t(UCE) 
#UC_gir <- t(UC_gir) #girar
#UC_gir <- UC_gir[, -11] #eliminar col11 = OUTLIER(Usuario)
#UC_gir <- t(UC_gir) #volver a girar
balloonplot(t(UCE), main ="Usuarios y Contexto", xlab ="", ylab="",
            label = FALSE, show.margins = FALSE,text.size=0.5)
UC_ca <- CA(UCE, graph = FALSE) #Análisis correspondencia
eigen <- get_eigenvalue(UC_ca) #almacena eigenvalues
fviz_screeplot(UC_ca, addlabels = TRUE, ylim = c(0, 50)) #
fviz_screeplot(UC_ca) + geom_hline(yintercept=12.5, linetype=2, color="red")  #1/(ncol(UC_ca)-1) = 1/8 = 12.5%

#Grado de similitud entre variables cualitativas
fviz_ca_biplot(UC_ca, repel = TRUE)

#Graficación de las variables
filas <- get_ca_row(UC_ca) #Filas
filas
head(filas$coord)
fviz_ca_row(UC_ca, repel = TRUE)
head(filas$cos2, 12) #Grado de asociación entre filas y columnas en el eje
#####---If a row item is well represented by two dimensions, the sum of the cos2 is closed to one.
#Calidad de la representación de las filas
fviz_ca_row(UC_ca, col.row = "cos2",
            gradient.cols = c("#00AFBB", "#E7B800", "#FC4E07"), 
            repel = TRUE)
fviz_cos2(UC_ca, choice = "row", axes = 1:2)
fviz_contrib(UC_ca, choice = "row", axes = 1, top = 9)
fviz_contrib(UC_ca, choice = "row", axes = 2, top = 9)
fviz_contrib(UC_ca, choice = "row", axes = 1:2, top = 9)

fviz_ca_row(UC_ca, col.row = "contrib",
            gradient.cols = c("#00AFBB", "#E7B800", "#FC4E07"), 
            repel = TRUE)


#COLUMNAS
col <- get_ca_col(UC_ca)
col
fviz_ca_col(UC_ca)
fviz_ca_col(UC_ca, col.col = "cos2", 
            gradient.cols = c("#00AFBB", "#E7B800", "#FC4E07"),
            repel = TRUE)
fviz_cos2(UC_ca, choice = "col", axes = 1:3)
fviz_contrib(UC_ca, choice = "col", axes = 1:3)
fviz_ca_biplot(UC_ca, repel = TRUE)

