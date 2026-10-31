# E-commerce Sales Analysis (Olist, 2017–2018)

A small end-to-end analytics project: raw marketplace data → SQL → Excel → an interactive web dashboard.
I built it to practise using data to answer business questions about categories, sellers, and customer experience on an e-commerce platform.

**Live dashboard:** https://kholilahya.github.io/ecommerce-sales-analysis/ *(the dashboard text is in Indonesian)*

## Business questions

1. Which categories drive the most revenue, and is that the same as the most orders?
2. How did orders and revenue develop month by month?
3. How concentrated is revenue among a few sellers?
4. Is delivery time related to customer review scores?

## Key findings

- **Fast growth.** Orders and revenue in Jan–Aug 2018 were about 2.4× those of Jan–Aug 2017. Orders spiked in November 2017 (likely year-end promotions; the data has no promo information, so this is an assumption), then levelled off at roughly 6,000–7,000 per month in 2018.
- **Revenue is fairly spread out.** The largest seller accounts for about 1.7% of revenue; the top 10 sellers for about 13% and the top 20 for about 21%.
- **Categories differ by metric.** `health_beauty` has the highest revenue, while `bed_bath_table` has the most orders but ranks third in revenue, so its average order value is lower.
- **Slow delivery goes with low reviews.** Orders with a 1-star review waited about 21 days on average, versus about 11 days for 5-star reviews. This is a correlation, not proof of cause.

Overall (delivered orders): 96,478 orders, about 13.2 million in item revenue, about 137 average order value.

## Data and definitions

- **Source:** Olist Brazilian E-Commerce Public Dataset on Kaggle. Please see the dataset page for license terms and currency. The raw files are **not** included in this repository.
- **Scope:** only orders with status `delivered`.
- **Revenue:** sum of item price, excluding freight (a proxy for GMV).
- **Trend charts** start in January 2017; 2016 is excluded because it has too few orders.
- Column names in the result files are in Indonesian (`bulan` = month, `pesanan` = orders, `pendapatan` = revenue, `kategori` = category, `peringkat` = rank).

## Method

1. Imported the CSV files into SQLite (DB Browser for SQLite).
2. Checked row counts, order status, duplicates, and missing dates (`sql/00_data_checks.sql`).
3. Wrote five queries (`sql/01` to `sql/05`) and exported the results to CSV (`data/`).
4. Built pivot-style summaries and charts in Excel (`excel/olist_analysis.xlsx`).
5. Built a one-page dashboard in plain HTML, CSS, and JavaScript (`index.html`), hosted with GitHub Pages.

## Repository structure

```
.
├── index.html                 # dashboard (GitHub Pages)
├── sql/                       # data checks and the five analysis queries
├── data/                      # query results (CSV)
├── excel/olist_analysis.xlsx  # results and charts
└── README.md
```

## How to reproduce

1. Download the dataset from Kaggle and import the tables `orders`, `order_items`, `products`, `sellers`, `reviews`, and `category_translation` into SQLite (rename the tables to match the queries).
2. Run the queries in `sql/` in order.

## Limitations

- Data ends in August 2018 and contains delivered orders only, so the latest months may be understated.
- Order counts per category are counted per category; one order can contain several categories, so they must not be summed.
- Some orders have more than one review, so the review count is not the order count.
- The delivery–review relationship is a correlation; other factors (product quality, seller, region) are not controlled for.
- The explanation for the November 2017 spike is an assumption.

## Tools

SQL (SQLite), Microsoft Excel, HTML/CSS/JavaScript, GitHub Pages.

## Author

Ahmad Kholil Ahya Ainul Yaqin · [GitHub](https://github.com/kholilahya)
