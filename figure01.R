
wt <- mtcars$wt
mpg <- mtcars$mpg
cyl <- mtcars$cyl
disp <- mtcars$disp
one <- numeric(nrow(mtcars)) + 1

cyl_unique <- c(4, 6, 8)

selected <- ((wt < 2.5) & (mpg > 23))
col <- c("grey80", "indianred")[selected + 1]

bars11 <- tapply(one, cyl, sum)
bars12 <- tapply(one[selected], cyl[selected], sum)

bars21 <- tapply(disp, cyl, mean)
bars22 <- tapply(disp[selected], cyl[selected], mean)

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

pdf("figure01.pdf", width = 6, height = 3)

par(mfrow = c(1, 3), mar = c(5, 4, 2, 0.5))

plot(wt, mpg, pch = 20, col = col, cex = 2,
     axes = FALSE, xlab = "Weight", ylab = "Mileage")
rect(1.425, 24.5, 2.5, 34.5, lty = "dashed")
axis_fun1()

plot(c(2, 10), c(0, max(bars11)), type = "n", 
     axes = FALSE, xlab = "Cylinders", ylab = "Count")
rect(cyl_unique - 0.75, 0, cyl_unique + 0.75, bars11,
     col = "grey80", border = NA)
rect(4 - 0.75, 0, 4 + 0.75, bars12,
     col = "indianred", border = NA)
text(c(4, 6, 8), c(bars12, 0, 0) + 0.75, labels = c("6", "0", "0"),
     col = "indianred")
axis_fun2()

plot(c(2, 10), c(0, max(bars21)), type = "n",
     axes = FALSE, xlab = "Cylinders", ylab = "Mean displacement")
rect(cyl_unique - 0.75, 0, cyl_unique + 0.75, bars21,
     col = "grey80", border = NA)
rect(4 - 0.75, 0, 4 + 0.75, bars22,
     col = "indianred", border = NA)
rect(c(6, 8) - 0.75, 0, c(6, 8) + 0.75, c(100, 100),
     col = NA, border = "indianred", lty = "dashed")
text(c(6, 8), c(50, 50), labels = "?", col = "indianred", cex = 1.5)
text(4, 100, labels = round(bars22), col = "indianred")
axis_fun2()

dev.off()

