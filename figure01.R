
wt <- mtcars$wt
mpg <- mtcars$mpg
cyl <- mtcars$cyl
disp <- mtcars$disp
one <- numeric(nrow(mtcars)) + 1

cyl_unique <- c(4, 6, 8)

selected <- ((wt < 2.5) & (mpg > 23))
col <- c("grey80", "firebrick")[selected + 1]

bars11 <- tapply(one, cyl, sum)
bars12 <- tapply(one[selected], cyl[selected], sum)

bars21

par(mfrow = c(1, 3))

axis_fun <- function() {
  axis(1, tick = FALSE)
  axis(2, tick = FALSE, las = 1)
  box(bty = "L")
}

plot(wt, mpg, pch = 20, col = col,
     axes = FALSE, xlab = "Weight", ylab = "Mileage")
axis_fun()

plot(c(2, 10), c(0, max(bars11)), type = "n", 
     axes = FALSE, xlab = "Cylinders", ylab = "Count")
rect(cyl_unique - 0.75, 0, cyl_unique + 0.75, bars11,
     col = "grey80", border = NA)
rect(4 - 0.75, 0, 4 + 0.75, bars12,
     col = "firebrick", border = NA)
axis_fun()




