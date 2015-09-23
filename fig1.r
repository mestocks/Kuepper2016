
tiff("fig1.tiff", width = 8, height = 5, units = "in",
     res = 400, pointsize = 5)

layout(matrix(c(1, 2, 3, 13, 13, 13,
                4, 5, 6, 13, 13, 13,
                7, 8, 9, 14, 14, 14,
                10, 11, 12, 14, 14, 14), 4, 6, byrow = TRUE))

allcex.axis <- 1.4
allcex.lab <- 1.5

# b, l, t, r - default: c(5, 4, 4, 2) + 0.1
par(mar = c(3.5, 4, 2, 2) + 0.1,
    cex.lab = allcex.lab, cex.axis = allcex.axis)
source("fig1abcd.r")
par(mar = c(5, 4, 2, 2) + 0.1, mgp = c(2.5, 1, 0),
    cex.lab = 1.8, cex.axis = 1.8)
source("fig1ef.r")

dev.off()
