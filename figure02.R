
wt <- mtcars$wt
mpg <- mtcars$mpg
cyl <- mtcars$cyl
disp <- mtcars$disp
one <- numeric(nrow(mtcars)) + 1

cyl_unique <- c(4, 6, 8)

# group1 <- ((wt < 4.1) & (mpg > 12.5) & (mpg < 25))
# group2 <- ((wt < 2.5) & (mpg > 23))
# group3 <- (wt > 4.5)

# group2 <- (wt < 3) & (mpg > 15)
group1 <- (wt > 2.5) & (wt < 4.5) & (mpg < 18.5)
group2 <- (wt > 2.5) & (wt < 4.5) & (mpg > 18.5)

group <- group1 * 1 + group2 * 2 + 1
cols <- c("grey80", "steelblue", "indianred")
col <- cols[group]


axis_fun1 <- function() {
  axis(1, tick = FALSE, line = -0.5)
  axis(2, tick = FALSE, las = 1, line = -0.5)
  box(bty = "L")
}

axis_fun2 <- function() {
  axis(1, at = c(4, 6, 8), tick = FALSE, line = -0.5)
  axis(2, tick = FALSE, las = 1, line = -0.5)
  box(bty = "L")
}

bars11 <- tapply(one, cyl, sum)
bars12 <- tapply(one, list(cyl, group), sum)
bars12[is.na(bars12)] <- 0

bars21 <- tapply(disp, cyl, mean)

pdf("figure02.pdf", width = 6, height = 3)

par(mfrow = c(1, 3), mar = c(5, 4, 2, 0.5))

plot(wt, mpg, pch = 19, col = col, cex = 1.5,
     axes = FALSE, xlab = "Weight", ylab = "Mileage")
axis_fun1()

plot(c(2, 10), c(0, max(bars11)), type = "n",
     axes = FALSE, xlab = "Cylinders", ylab = "Count")
rect(cyl_unique - 0.75, 0, cyl_unique + 0.75, bars11, 
     col = "grey80", border = NA)
for (i in 1:3) {
  counts <- bars12[i, ]
  y0 <- cumsum(c(0, counts[-length(counts)]))
  y1 <- cumsum(counts)
  
  rect(cyl_unique[i] - 0.75, y0, cyl_unique[i] + 0.75, y1, 
       col = cols, border = NA)
} 
text(c(4, 4, 6, 6, 8, 8, 8), c(8, 11, 2, 7, 3, 12, 14) - 0.75, 
     labels = c("+8", "+3", "+2", "+5", "+3", "+9", "+2"), 
     col = c("grey40", "white", "white", "white", "grey40", 
             "white", "white"))
axis_fun2()

plot(c(2, 10), c(0, max(bars21)), type = "n",
     axes = FALSE, xlab = "Cylinders", ylab = "Mean displacement")
rect(cyl_unique - 0.75, 0, cyl_unique + 0.75, bars21, 
     col = "grey80", border = NA)
text(rep(c(4, 6, 8), each = 3), rep(25 * 1:3, 3), labels = "?",
     col = rep(c("grey40", "steelblue", "indianred"), 3))
axis_fun2()

dev.off()
