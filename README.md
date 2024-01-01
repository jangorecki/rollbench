
# mini rolling statistics benchmark

Compares python pandas, R data.table and R polars by:

- input size: `1e6, 1e7, 1e8`
- rolling window size: `1e2, 1e3, 1e4`
- rolling functions: `mean` and `median`
- batching: `single` computation and `quadruple` (2 columns x 2 windows) computation

For comprehensive benchmark of rolling functions see [db-benchmark](https://github.com/duckdblabs/db-benchmark/pull/9) project.

## running

```sh
python pandas2.py
Rscript data.table.R
Rscript polars.R
```

## results

As of 2024-01-01 using

```
pandas 2.1.4
data.table@rollmedian
polars 0.12.0
```

Fedora 39 (= recent toolchain) and i5-10210Y cpu.

Timings are in seconds. Columns `pd2dt` and `ps2dt` are times of pandas and polars divided by time of data.table to present how many times data.table is faster.

### single computation

![single](https://github.com/jangorecki/rollbench/assets/3627377/f9b48f3b-4a62-4143-925e-b248f95af44b)

```
    rolling length window data.table  pandas polars pd2dt ps2dt
 1:    mean  1e+06    100      0.004   0.020  0.008  5.00  2.00
 2:    mean  1e+06   1000      0.005   0.019  0.008  3.80  1.60
 3:    mean  1e+06  10000      0.004   0.020  0.008  5.00  2.00
 4:    mean  1e+07    100      0.057   0.162  0.070  2.84  1.23
 5:    mean  1e+07   1000      0.039   0.179  0.074  4.59  1.90
 6:    mean  1e+07  10000      0.039   0.180  0.075  4.62  1.92
 7:    mean  1e+08    100      0.385   1.640  1.088  4.26  2.83
 8:    mean  1e+08   1000      0.361   1.654  1.045  4.58  2.89
 9:    mean  1e+08  10000      0.389   1.679  0.979  4.32  2.52
10:  median  1e+06    100      0.077   0.599  0.206  7.78  2.68
11:  median  1e+06   1000      0.080   0.819  0.212 10.24  2.65
12:  median  1e+06  10000      0.095   1.153  0.219 12.14  2.31
13:  median  1e+07    100      0.672   5.535  1.485  8.24  2.21
14:  median  1e+07   1000      0.796   7.865  1.596  9.88  2.01
15:  median  1e+07  10000      1.078  10.657  1.792  9.89  1.66
16:  median  1e+08    100      6.984  50.476 15.300  7.23  2.19
17:  median  1e+08   1000      8.232  76.502 16.230  9.29  1.97
18:  median  1e+08  10000      9.664 103.798 17.864 10.74  1.85
```

### quadruple computation

![quadruple](https://github.com/jangorecki/rollbench/assets/3627377/cd4057cd-5de7-4883-b83c-b21f8ad4f21c)

```
    rolling length window data.table  pandas polars pd2dt ps2dt
 1:    mean  1e+06    100      0.006   0.100  0.022 16.67  3.67
 2:    mean  1e+06   1000      0.009   0.095  0.022 10.56  2.44
 3:    mean  1e+06  10000      0.007   0.091  0.022 13.00  3.14
 4:    mean  1e+07    100      0.054   1.151  0.190 21.31  3.52
 5:    mean  1e+07   1000      0.054   0.836  0.210 15.48  3.89
 6:    mean  1e+07  10000      0.057   0.857  0.223 15.04  3.91
 7:    mean  1e+08    100      0.707  11.051  2.509 15.63  3.55
 8:    mean  1e+08   1000      0.982  12.226  2.689 12.45  2.74
 9:    mean  1e+08  10000      0.958  10.307  2.636 10.76  2.75
10:  median  1e+06    100      0.107   2.058  0.305 19.23  2.85
11:  median  1e+06   1000      0.157   2.977  0.372 18.96  2.37
12:  median  1e+06  10000      0.214   4.039  0.447 18.87  2.09
13:  median  1e+07    100      1.439  20.502  3.675 14.25  2.55
14:  median  1e+07   1000      2.439  29.814  4.304 12.22  1.76
15:  median  1e+07  10000      3.204  40.898  4.638 12.76  1.45
16:  median  1e+08    100     18.609 202.199 38.113 10.87  2.05
17:  median  1e+08   1000     24.413 298.827 41.854 12.24  1.71
18:  median  1e+08  10000     30.966 427.257 47.321 13.80  1.53
```

## license

MIT

