pdf("fig1ef.pdf", width = 8, height = 10)

data1ef <- read.table("fig1ef.csv", header = T, sep = ",")

#data1ef$dayofyear <- as.factor(data1ef$dayofyear)

get.df <- function(data, column) {

    day <- as.factor(data[, "dayofyear"])
    value <- data[, column]

    mu <- tapply(value, day, mean, na.rm = TRUE)
    std <- sqrt(tapply(value, day, var, na.rm = TRUE))
    lower <- mu - std
    lower[lower < 0] <- 0
    upper <- mu + std

    df <- data.frame(day = as.integer(rownames(mu[!(is.na(mu))])),
                     mu = mu[!(is.na(mu))],
                     lower = lower[!(is.na(mu))],
                     upper = upper[!(is.na(mu))])
    df
}

plot.df <- function(data, color) {

    points(data$day, data$mu,
           col = color, pch = 20, cex = 1.3)

    arrows(data$day, data$mu,
           data$day, data$upper,
           angle = 90, length = 0.05,
           col = color, lwd = 2)

    arrows(data$day, data$mu,
           data$day, data$lower,
           angle = 90, length = 0.05,
           col = color, lwd = 2)

    lines(data$day, data$mu,
          col = color, lwd = 2)

    xat <- c(90, 120, 151, 181)
    dates <- seq(as.Date("2013-04-01"), as.Date("2013-07-01"), by = "month")
    axis(1, at = xat, labels = format(dates, "%B 1st"))
    axis(2, las = 2)
}

ind.col <- "indianred"
sat.col <- "steelblue"
fae.col <- "grey20"

ind <- data1ef[data1ef$Morph == "I", ]
sat <- data1ef[data1ef$Morph == "S", ]
fae <- data1ef[data1ef$Morph == "F", ]

par(mfrow = c(2, 1), mar = c(5, 4, 2, 2) + 0.1)

xlabel <- "Date"
xlimit <- c(76, 189)

# A4 concentration

ind.df <- get.df(ind, "A4")
sat.df <- get.df(sat, "A4")
fae.df <- get.df(fae, "A4")

a4.ylab <- "A4 concentration (ng/ml)"
a4.ylim <- c(0, 12)

plot(0, 0, type = 'n', bty = 'l', xaxt = 'n', yaxt = 'n',
     xlim = xlimit, ylim = a4.ylim,
     xlab = xlabel, ylab = a4.ylab)

plot.df(ind.df, ind.col)
plot.df(sat.df, sat.col)
plot.df(fae.df, fae.col)

legend(75, 12, c("Independents", "Satellites", "Faeders"),
       col = c(ind.col, sat.col, fae.col), lwd = 2, bty = 'n')

mtext("e", font = 2, line = 0.25, cex = 1.4,
        at = par("usr")[1] - 10)

# T + DHT concentration

ind.df <- get.df(ind, "T")
sat.df <- get.df(sat, "T")
fae.df <- get.df(fae, "T")

a4.ylab <- "T + DNT concentration (ng/ml)"
a4.ylim <- c(0, 8)

plot(0, 0, type = 'n', bty = 'l', xaxt = 'n', yaxt = 'n',
     xlim = xlimit, ylim = a4.ylim,
     xlab = xlabel, ylab = a4.ylab)

plot.df(ind.df, ind.col)
plot.df(sat.df, sat.col)
plot.df(fae.df, fae.col)

mtext("f", font = 2, line = 0.25, cex = 1.4,
        at = par("usr")[1] - 10)

dev.off()
