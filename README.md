
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

As of 2025-09-16 using

```
pandas 2.2.3
data.table@frollmedian
polars 1.3.1
```

[mean single](https://github.com/user-attachments/assets/666aea13-0947-4753-a1ab-214b8ec20f6e)
[mean quadruple](https://github.com/user-attachments/assets/f5f29a64-a58a-413d-bb12-1a32269b1ea7)
[median single](https://github.com/user-attachments/assets/9d94f0b7-b4c0-44da-9c34-54bc2a8fb784)
[median quadruple](https://github.com/user-attachments/assets/e328703b-fca9-45a8-b885-a8efb4bcd505)

On Fedora 42 and AMD Ryzen 7 7735HS CPU.

## license

MIT
