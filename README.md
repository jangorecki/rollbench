
# mini rolling statistics benchmark

Compares python pandas and R data.table by:

- input size: `1e6, 1e7, 1e8`
- rolling window size: `1e3, 1e4, 1e5`
- rolling functions: `mean` and `median`
- batching: `single` computation and `quadruple` (2 columns x 2 windows) computation

## running

```sh
python3 pandas2.py
Rscript data.table.R
```

## results

As of 2023-10-04 using

```
pandas 2.0.3
data.table@rollmedian
```

### single computation

```
    rolling length window data.table pandas pd2dt
     <char>  <num>  <int>      <num>  <num> <num>
 1:    mean  1e+06    100      0.005  0.023  4.60
 2:    mean  1e+06   1000      0.006  0.017  2.83
 3:    mean  1e+06  10000      0.005  0.017  3.40
 4:    mean  1e+07    100      0.071  0.175  2.46
 5:    mean  1e+07   1000      0.046  0.190  4.13
 6:    mean  1e+07  10000      0.046  0.188  4.09
 7:    mean  1e+08    100      0.393  1.727  4.39
 8:    mean  1e+08   1000      0.368  1.746  4.74
 9:    mean  1e+08  10000      0.367  1.741  4.74
10:  median  1e+06    100      0.063  0.485  7.70
11:  median  1e+06   1000      0.064  0.710 11.09
12:  median  1e+06  10000      0.089  1.077 12.10
13:  median  1e+07    100      0.601  4.833  8.04
14:  median  1e+07   1000      0.683  7.038 10.30
15:  median  1e+07  10000      0.859 10.851 12.63
16:  median  1e+08    100      6.037 47.857  7.93
17:  median  1e+08   1000      7.027 69.763  9.93
18:  median  1e+08  10000      8.594 94.668 11.02
```

### 2 columns x 2 windows computation

```
    rolling length window data.table  pandas pd2dt
     <char>  <num>  <int>      <num>   <num> <num>
 1:    mean  1e+06    100      0.006   0.076 12.67
 2:    mean  1e+06   1000      0.006   0.078 13.00
 3:    mean  1e+06  10000      0.004   0.079 19.75
 4:    mean  1e+07    100      0.052   0.841 16.17
 5:    mean  1e+07   1000      0.054   0.850 15.74
 6:    mean  1e+07  10000      0.052   0.853 16.40
 7:    mean  1e+08    100      0.557   8.374 15.03
 8:    mean  1e+08   1000      0.557   9.711 17.43
 9:    mean  1e+08  10000      0.544   9.420 17.32
10:  median  1e+06    100      0.109   1.888 17.32
11:  median  1e+06   1000      0.134   2.776 20.72
12:  median  1e+06  10000      0.198   3.683 18.60
13:  median  1e+07    100      1.347  19.097 14.18
14:  median  1e+07   1000      2.066  27.983 13.54
15:  median  1e+07  10000      2.742  43.061 15.70
16:  median  1e+08    100     16.265 194.275 11.94
17:  median  1e+08   1000     20.835 281.547 13.51
18:  median  1e+08  10000     27.177 434.483 15.99
```
