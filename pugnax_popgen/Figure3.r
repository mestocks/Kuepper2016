# default c(b, l, t, r) mar = c(5, 4, 4, 2) + 0.1

tiff("Figure3v2.tiff", width = 9, height = 6, units = "in",
     res = 400, pointsize = 5)

layout(matrix(c(1, 1, 1, 1, 1, 1,
                1, 1, 1, 1, 1, 1, 
                2, 2, 5, 5, 6, 6,
                2, 2, 5, 5, 6, 6,
                3, 3, 5, 5, 6, 6,
                3, 3, 7, 7, 8, 8, 
                4, 4, 7, 7, 8, 8, 
                4, 4, 7, 7, 8, 8), 8, 6, byrow = TRUE))

par(mar = c(2, 4, 2, 2) + 0.1,
    cex = 1.2, cex.lab = 1.2, cex.axis = 1.5)
source("Figure3a.r")

par(mar = c(5, 4, 4, 2) + 0.1,
    cex = 1)
source("Figure3bcd.r")

par(mar = c(6, 4, 1, 2.5) + 0.1,
    cex = 1.2, cex.axis = 1.25)
source("Figure3efgh.r")

dev.off()
