# Sales-Performance-Analysis-Python-SQL-Power-bi-Excel-Statistics

# 📊 Sales Performance Analysis

A comprehensive end-to-end data analytics project analyzing sales performance across regions, products, customers, and time — built with Python, SQL, and Power BI.

> **Author:** Bipin Chandra Arya

---

## 🗂️ Table of Contents

- [Project Overview](#-project-overview)
- [Dataset Summary](#-dataset-summary)
- [Project Structure](#-project-structure)
- [Tech Stack](#-tech-stack)
- [Key Findings](#-key-findings)
- [KPI Highlights](#-kpi-highlights)
- [Dashboard Preview](#-dashboard-preview)
- [How to Run](#-how-to-run)
- [Recommendations](#-recommendations)
- [License](#-license)

---

## 📌 Project Overview

This project performs a full-cycle sales performance analysis on a structured retail dataset containing **10,018 records** across 20 columns. The goal is to evaluate business performance, identify growth opportunities, and generate actionable insights.

**Key objectives:**
- Evaluate overall sales and profitability
- Identify top-performing products, customers, and regions
- Understand customer purchasing behavior
- Analyze the impact of discounts on profit
- Track year-over-year growth trends

---

## 📁 Dataset Summary

| Property | Value |
|---|---|
| Total Records | 10,018 rows |
| Total Columns | 20 |
| Date Range | 2021 – 2024 |
| Regions | West, East, Central, South |
| Categories | Technology, Furniture, Office Supplies |
| Segments | Consumer, Corporate, Home Office |

**Key columns include:** Order ID, Order Date, Ship Date, Ship Mode, Customer Name, Segment, Region, Category, Sub-Category, Product Name, Sales, Quantity, Discount, Profit.

---

## 📂 Project Structure

```
sales-performance-analysis/
│
├── data/
│   └── sales_data.csv                # Raw dataset
│
├── notebooks/
│   └── sales_analysis.ipynb          # Main EDA and analysis notebook
│
├── sql/
│   └── kpi_queries.sql               # SQL queries for KPI calculations
│
├── dashboard/
│   └── Sales_Performance.pbix        # Power BI dashboard file
│
├── reports/
│   └── Sales_Performance_Analysis.pdf  # Full project report
│
├── images/
│   └── dashboard_preview.png         # Dashboard screenshot
│
└── README.md
```

---

## 🛠️ Tech Stack

| Tool | Purpose |
|---|---|
| Python (pandas, matplotlib, seaborn, scipy) | EDA, statistical analysis, visualization |
| SQL | KPI calculations, aggregations |
| Power BI | Interactive dashboard |
| Jupyter Notebook | Analysis environment |

---

## 🔍 Key Findings

### Sales & Revenue
- Total Revenue: **$2.29M** | Total Profit: **$286.6K** | Profit Margin: **12.47%**
- Sales are **highly right-skewed** — a few large orders drive most revenue
- Strong **year-end demand surge** every year (Nov–Dec peak)
- Sales grew **29.6% in 2023** and **20.3% in 2024** after a slight dip in 2022

### Regional Performance
- **West** leads in sales ($725K) with a 14.94% margin
- **East** has the highest Average Order Value ($479.89)
- **Central** underperforms with the lowest margin (7.92%)

### Products & Categories
- **Technology** is the top category (36.37% of sales, 17.4% margin)
- **Furniture** has poor profitability despite high sales (only 2.48% margin)
- **Tables, Bookcases, Supplies** are loss-making sub-categories
- Best-selling product: **Canon imageCLASS 2200 Advanced Copier** (~$61.6K)

### Customers
- **800 customers**, 5,026 total orders, avg. 6.28 orders per customer
- **Consumer segment** drives 50.57% of revenue
- **Corporate segment** has the highest Customer Lifetime Value ($2,980)
- Top customer: **Sean Miller** (~$25K in sales)

### Discounts
- 52.1% of orders include discounts; average discount is **30.1%**
- Discounts above 20% consistently lead to **negative profit**
- **1,121 high-discount loss orders** identified

### Shipping
- Average shipping time: **3.96 days** | On-time rate: **81.8%**
- **Standard Class** is the most preferred mode across all segments
- Only **2 orders** exceeded 7 days in shipping

---

## 📈 KPI Highlights

| KPI | Value |
|---|---|
| Total Revenue | $2.29M |
| Total Profit | $286.6K |
| Profit Margin | 12.47% |
| Average Order Value | $457.40 |
| Total Units Sold | 37,985 |
| Total Customers | 800 |
| Avg Orders per Customer | 6.28 |
| YoY Sales Growth (2024) | +20.3% |
| YoY Profit Growth (2024) | +14.2% |
| On-Time Delivery Rate | 81.8% |

---

## 📊 Dashboard Preview

The Power BI dashboard covers:
- Sales Overview by Region (with YoY comparison)
- Sales by State (US map visualization)
- Monthly & Yearly sales trends
- Category and sub-category breakdown
- Customer and segment analysis

---

## ▶️ How to Run

### Python Analysis
```bash
# Clone the repository
git clone https://github.com/your-username/sales-performance-analysis.git
cd sales-performance-analysis

# Install dependencies
pip install pandas matplotlib seaborn scipy jupyter

# Launch the notebook
jupyter notebook notebooks/sales_analysis.ipynb
```

### Power BI Dashboard
1. Open `dashboard/Sales_Performance.pbix` in Power BI Desktop
2. Update the data source path to point to `data/sales_data.csv`
3. Refresh the data

---

## 💡 Recommendations

**Revenue Growth**
1. Prioritize the Consumer segment and high-spending customers
2. Promote top-selling Technology products through targeted campaigns
3. Cap discounts at 20% to protect profit margins
4. Invest in the West and East regions; address Central's low margin

**Business Improvements**
1. Introduce loyalty programs to improve customer retention
2. Phase out or reprice loss-making Furniture sub-categories (Tables, Bookcases)
3. Capitalize on seasonal demand — ramp up inventory and campaigns in Sep–Dec
4. Monitor high-discount orders to reduce the 1,121 loss-making transactions

---

## 📄 License

This project is licensed under the [MIT License](LICENSE).

---

*Made with ❤️ for learning and exploration. Happy Learning! 🚀*
