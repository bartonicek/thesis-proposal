
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

hist(mtcars$mpg, col = "grey80", border = NA, axes = FALSE,
    main = "", xlab = "Mileage")
hist(mtcars$mpg[selected], add = TRUE, col = "indianred", border = NA)
text(27.5, 10, labels = c("Brushing:\nRecompute\nselected bins only"), col = "indianred")
axis_fun1()

hist(mtcars$mpg, breaks = 10, col = "grey80", border = NA, axes = FALSE,
     main = "", xlab = "Mileage")
text(25.5, 6, labels = c("Changing binwidth:\nRecompute selected\nAND original bins"),
     col = "indianred")
hist(mtcars$mpg[selected], breaks = 10, add = TRUE, col = "indianred", border = NA)
axis_fun1()

dev.off()
