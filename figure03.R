
wt <- mtcars$wt
mpg <- mtcars$mpg

selected <- ((wt < 2.5) & (mpg > 23))
col <- c("grey80", "indianred")[selected + 1]

axis_fun1 <- function() {
  axis(1, tick = FALSE, line = -0.5)
  axis(2, tick = FALSE, las = 1, line = -0.5)
  box(bty = "L")
}

pdf("figure03.pdf", width = 6, height = 3)

par(mfrow = c(1, 3), mar = c(5, 4, 2, 0.5))

plot(wt, mpg, col = col, pch = 19, cex = 1.5,
     axes = FALSE, xlab = "Weight", ylab = "Mileage")
rect(1.425, 24.5, 2.5, 34.5, lty = "dashed")
axis_fun1()

breaks <- seq(10, 34, 2)
hist(mtcars$mpg, col = "grey80", breaks = breaks,
     border = NA, axes = FALSE, main = "", xlab = "Mileage")
hist(mtcars$mpg[selected], breaks = breaks, add = TRUE, col = "indianred", border = NA)
text(26, 6, labels = c("Brushing:\nRecompute bin\ncounts only"), col = "indianred")
axis_fun1()

breaks <- seq(10, 34, 1)
hist(mtcars$mpg, breaks = breaks, 
     col = "grey80", border = NA, axes = FALSE, main = "", xlab = "Mileage")
text(25.5, 3.5, labels = c("Changing binwidth:\nRecompute breaks\nAND bin counts"),
     col = "indianred")
hist(mtcars$mpg[selected], breaks = breaks, add = TRUE, col = "indianred", border = NA)
axis_fun1()

dev.off()
