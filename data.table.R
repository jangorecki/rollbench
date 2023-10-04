library(data.table)
set.seed(108)
# mean
test1 = function(N, W) {
  for (n in N) {
    x = rnorm(n)
    for (w in W) {
      t = system.time(
        ans <- frollmean(x, w)
      )[["elapsed"]]
      cat("data.table,mean,single,",n,",",w,",",t,"\n",sep="")
    }
  }
}
test4 = function(N, W) {
  for (n in N) {
    x = replicate(2L, rnorm(n), simplify=FALSE)
    for (w in W) {
      ww = w + c(-10L,10L)
      t = system.time(
        ans <- frollmean(x, ww)
      )[["elapsed"]]
      cat("data.table,mean,quadruple,",n,",",w,",",t,"\n",sep="")
    }
  }
}
test1(N = c(1e6, 1e7, 1e8), W = c(1e2, 1e3, 1e4))
test4(N = c(1e6, 1e7, 1e8), W = c(1e2, 1e3, 1e4))
# median
test1 = function(N, W) {
  for (n in N) {
    x = rnorm(n)
    for (w in W) {
      t = system.time(
        ans <- frollmedian(x, w)
      )[["elapsed"]]
      cat("data.table,median,single,",n,",",w,",",t,"\n",sep="")
    }
  }
}
test4 = function(N, W) {
  for (n in N) {
    x = replicate(2L, rnorm(n), simplify=FALSE)
    for (w in W) {
      ww = w + c(-10L,10L)
      t = system.time(
        ans <- frollmedian(x, ww)
      )[["elapsed"]]
      cat("data.table,median,quadruple,",n,",",w,",",t,"\n",sep="")
    }
  }
}
test1(N = c(1e6, 1e7, 1e8), W = c(1e2, 1e3, 1e4))
test4(N = c(1e6, 1e7, 1e8), W = c(1e2, 1e3, 1e4))
q(status=0)
