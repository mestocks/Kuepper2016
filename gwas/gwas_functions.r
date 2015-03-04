load_and_qc <- function(phe, gen,
                        qc = TRUE,
                        maf = 0.05,
                        call = 0.9) {

  data <- load.gwaa.data(phe = phe, gen = gen, force = T)
	
  if (qc == TRUE) {
    qual <- check.marker(data, 
                         call = call, 
                         p.level = 1e-5, 
                         perid.call = 0, 
                         extr.call = 0, 
                         extr.perid.call = 0, 
                         maf = maf, 
                         ibs.exclude = "none")
    data <- data[qual$idok, qual$snpok]
  }

  data
}

write.pvalues <- function(data, pvalues.out) {
  
  write.table(data[, c("Chromosome", "Position", "P1df", "P2df", "Pc1df")], 
              pvalues.out, 
              quote = FALSE, 
              row.names = FALSE, 
              col.names = TRUE)
  
}

empty.plot <- function(xlabel = NULL, ylabel = NULL,
                       xlimit = NULL, ylimit = NULL,
                       lab.color = NULL, lab.size = NULL) {

  #par(bg = rgb(51, 51, 51, maxColorValue = 255))

  plot(0, 0,
       type = 'n',
       bty = 'n',
       xaxt = 'n',
       yaxt = 'n',
       xlab = xlabel,
       ylab = ylabel,
       xlim = xlimit,
       ylim = ylimit,
       col.lab = lab.color,
       cex.lab = lab.size)

}

plot.manhatten <- function(x, y, point.colors,
                           xlabel = "Position (bps)",
                           ylabel = "-log10(p)",
                           ylimit = c("max"),
                           yaxis = TRUE,
                           pmar = c(5, 5, 4, 1),
                           pch = 20) {

  
  axis.colors <- NULL
  max.x <- max(x, na.rm = T)
  
  log.y <- -log10(y)
  
  if (length(ylimit) == 1) {
    max.y <- max(log.y, na.rm = T)
    ylimit <- c(0, max.y)
  }
  print(ylimit)
  #par(mgp = c(3, 1, 0)) # default c(3, 1, 0)
  #par(mar = pmar + 0.1) # R default c(5, 4, 4, 2) + 0.1
  
  empty.plot(xlabel = xlabel, ylabel = ylabel,
             xlimit = c(0, max(x)), ylimit = ylimit,
             lab.color = axis.colors,
             lab.size = 2)
  
  axis(1,
       col = axis.colors,
       col.axis = axis.colors,
       cex.axis = 2,
       lwd = 2)

  if (yaxis == TRUE) {
    axis(2,
         las = 2,
         col = axis.colors,
         col.axis = axis.colors,
         cex.axis = 2,
         lwd = 2)
  }
  
  points(x, log.y, pch = pch, col = point.colors, cex = 1.5)
	       
}

plot.manhattan.talk <- function(x, y, point.colors,
                                xlabel = "Position (bps)",
                                ylabel = "-log10(p)",
                                ylimit = c("max"),
                                yaxis = TRUE,
                                pmar = c(5, 5, 4, 1),
                                pch = 20) {

  axis.colors <- rgb(249, 242, 215, maxColorValue = 255)
  max.x <- max(x, na.rm = T)
  
  log.y <- -log10(y)
  
  if (length(ylimit) == 1) {
    max.y <- max(log.y)
    ylimit <- c(0, max.y)
  }

  par(mgp = c(3, 1, 0)) # default c(3, 1, 0)
  par(mar = pmar + 0.1) # R default c(5, 4, 4, 2) + 0.1
  
  empty.plot(xlabel = xlabel, ylabel = ylabel,
             xlimit = c(0, max(x)), ylimit = ylimit,
             lab.color = axis.colors,
             lab.size = 2)
  
  axis(1,
       col = axis.colors,
       col.axis = axis.colors,
       cex.axis = 2,
       lwd = 2)

  if (yaxis == TRUE) {
    axis(2,
         las = 2,
         col = axis.colors,
         col.axis = axis.colors,
         cex.axis = 2,
         lwd = 2)
  }
  
  points(x, log.y, pch = pch, col = point.colors, cex = 1.5)
	       

}

