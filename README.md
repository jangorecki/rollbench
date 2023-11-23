
# mini rolling statistics benchmark

Compares python pandas and R data.table and polars by:

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

As of 2023-11-21 using

```
pandas 2.1.3
data.table@rollmedian
polars 0.10.1
```

Fedora 39 (= recent toolchain) and i5-10210Y cpu.

Timings are in seconds. Columns `pd2dt` and `ps2dt` are times of pandas and polars divided by time of data.table to present how many times data.table is faster.

### single computation

![single](https://github.com/jangorecki/rollbench/assets/3627377/c1cf357a-70da-4b63-8c1a-489eebaa72de)

```
    rolling length window data.table pandas  polars pd2dt ps2dt
 1:    mean  1e+06    100      0.004  0.031   0.008  7.75  2.00
 2:    mean  1e+06   1000      0.005  0.022   0.009  4.40  1.80
 3:    mean  1e+06  10000      0.004  0.022   0.009  5.50  2.25
 4:    mean  1e+07    100      0.062  0.174   0.071  2.81  1.15
 5:    mean  1e+07   1000      0.040  0.187   0.072  4.68  1.80
 6:    mean  1e+07  10000      0.039  0.187   0.074  4.79  1.90
 7:    mean  1e+08    100      0.392  1.933   0.722  4.93  1.84
 8:    mean  1e+08   1000      0.370  2.435   0.712  6.58  1.92
 9:    mean  1e+08  10000      0.368  2.094   0.829  5.69  2.25
10:  median  1e+06    100      0.065  0.491   0.167  7.55  2.57
11:  median  1e+06   1000      0.067  0.739   0.311 11.03  4.64
12:  median  1e+06  10000      0.079  1.115   1.517 14.11 19.20
13:  median  1e+07    100      0.590  4.906   1.481  8.32  2.51
14:  median  1e+07   1000      0.729  7.042   2.798  9.66  3.84
15:  median  1e+07  10000      0.866 10.849  14.316 12.53 16.53
16:  median  1e+08    100      6.253 48.645  14.580  7.78  2.33
17:  median  1e+08   1000      7.350 68.938  27.551  9.38  3.75
18:  median  1e+08  10000      9.104 95.918 145.899 10.54 16.03
```

### quadruple computation

![quadruple](https://github.com/jangorecki/rollbench/assets/3627377/e10abfa1-4d95-4178-add8-20861dd61cef)

```
    rolling length window data.table  pandas  polars pd2dt ps2dt
 1:    mean  1e+06    100      0.006   0.098   0.019 16.33  3.17
 2:    mean  1e+06   1000      0.006   0.096   0.020 16.00  3.33
 3:    mean  1e+06  10000      0.010   0.097   0.021  9.70  2.10
 4:    mean  1e+07    100      0.055   0.944   0.180 17.16  3.27
 5:    mean  1e+07   1000      0.059   0.969   0.195 16.42  3.31
 6:    mean  1e+07  10000      0.056   0.969   0.208 17.30  3.71
 7:    mean  1e+08    100      0.657  14.427   2.177 21.96  3.31
 8:    mean  1e+08   1000      0.807  27.017   2.363 33.48  2.93
 9:    mean  1e+08  10000      0.776  12.753   2.317 16.43  2.99
10:  median  1e+06    100      0.107   1.928   0.324 18.02  3.03
11:  median  1e+06   1000      0.138   2.770   0.656 20.07  4.75
12:  median  1e+06  10000      0.222   3.881   3.656 17.48 16.47
13:  median  1e+07    100      1.344  19.269   3.635 14.34  2.70
14:  median  1e+07   1000      2.234  27.619   7.015 12.36  3.14
15:  median  1e+07  10000      2.852  37.945  38.491 13.30 13.50
16:  median  1e+08    100     16.539 193.638  37.390 11.71  2.26
17:  median  1e+08   1000     22.452 290.607  70.992 12.94  3.16
18:  median  1e+08  10000     27.820 406.971 377.634 14.63 13.57
```

## license

MIT
