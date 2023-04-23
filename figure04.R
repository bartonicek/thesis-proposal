library(grid)


draw_node <- function(x, y, r, label) {
  grid.circle(x, y, r, name = label)
  grid.text(label, x, y, gp = gpar(cex = 0.75))
  
}

draw_edge <- function(node1, node2, theta1, theta2, arrow) {
  grid.segments(grobX(node1, theta1), grobY(node1, theta1),
                grobX(node2, theta2), grobY(node2, theta2),
                arrow = arrow)
}

pdf("figure04.pdf", width = 6, height = 3)

grid.newpage()
arrow1 <- arrow(length = unit(0.1, "inches"))
draw_node(6/14, 3/4, 0.1, "Data")
draw_node(8/14, 3/4, 0.1, "Binwidth")
draw_node(6/14, 1/2, 0.1, "Breaks")

draw_edge("Data", "Breaks", 270, 90, arrow1)
draw_edge("Binwidth", "Breaks", 210, 60, arrow1)

draw_node(8/14, 1/2, 0.1, "Selection")
draw_node(6/14, 1/4, 0.1, "Counts")

draw_edge("Breaks", "Counts", 270, 90, arrow1)
draw_edge("Selection", "Counts", 210, 60, arrow1)

dev.off()
