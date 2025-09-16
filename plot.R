d = data.table::fread("time.csv",
  col.names=c("solution","rolling","dim","rows","window","seconds"),
  colClasses=c("factor","factor","factor","numeric","numeric","numeric"))
d[, c("rows","window") := .(as.factor(rows), as.factor(paste("w =", window)))]

tp = function(.rolling, .dim) {
  png(filename = sprintf("rollbench_%s_%s.png", .rolling, .dim),
      width = 8, height = 8, units = "in", res = 100)
  tinyplot::plt(
    seconds ~ solution | solution,
    facet = rows ~ window, facet.args = list(free=TRUE),
    data = d, subset = dim==.dim & rolling==.rolling,
    fill = c("#1B9E77","#D95F02","#7570B3"), col = NA,
    type = "barplot", grid = TRUE, legend = TRUE,
    main = paste("Rolling", .rolling, ":", .dim)
  )
  dev.off()
}
for (.rolling in c("mean","median"))
  for (.dim in c("single","quadruple"))
    tp(.rolling, .dim)
