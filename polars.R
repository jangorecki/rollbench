library(polars, lib="/home/jan/git/r-polars/lib")
set.seed(108)
# mean
test1 = function(N, W) {
  for (n in N) {
    x = pl$DataFrame(list(V1=rnorm(n)))
    for (w in W) {
      t = system.time(
        ans <- x$select(pl$col("V1")$rolling_mean(window_size=w))
      )[["elapsed"]]
      cat("polars,mean,single,",n,",",w,",",t,"\n",sep="")
    }
  }
}
test4 = function(N, W) {
  for (n in N) {
    x = pl$DataFrame(setNames(replicate(2L, rnorm(n), simplify=FALSE), c("V1","V2")))
    for (w in W) {
      ww = w + c(-10L,10L)
      t = system.time(
        ans <- list(
          x$select(pl$col(c("V1","V2"))$rolling_mean(window_size=ww[1])),
          x$select(pl$col(c("V1","V2"))$rolling_mean(window_size=ww[2]))
        )
      )[["elapsed"]]
      cat("polars,mean,quadruple,",n,",",w,",",t,"\n",sep="")
    }
  }
}
test1(N = c(1e6, 1e7, 1e8), W = c(1e2, 1e3, 1e4))
test4(N = c(1e6, 1e7, 1e8), W = c(1e2, 1e3, 1e4))
# median
test1 = function(N, W) {
  for (n in N) {
    df = pl$DataFrame(list(V1=rnorm(n)))
    for (w in W) {
      t = system.time(
        ans <- df$select(pl$col("V1")$rolling_median(window_size=w))
      )[["elapsed"]]
      cat("polars,median,single,",n,",",w,",",t,"\n",sep="")
    }
  }
}
test4 = function(N, W) {
  for (n in N) {
    x = pl$DataFrame(setNames(replicate(2L, rnorm(n), simplify=FALSE), c("V1","V2")))
    for (w in W) {
      ww = w + c(-10L,10L)
      t = system.time(
        ans <- list(
          x$select(pl$col(c("V1","V2"))$rolling_median(window_size=ww[1])),
          x$select(pl$col(c("V1","V2"))$rolling_median(window_size=ww[2]))
        )
      )[["elapsed"]]
      cat("polars,median,quadruple,",n,",",w,",",t,"\n",sep="")
    }
  }
}
test1(N = c(1e6, 1e7, 1e8), W = c(1e2, 1e3, 1e4))
test4(N = c(1e6, 1e7, 1e8), W = c(1e2, 1e3, 1e4))
q(status=0)
