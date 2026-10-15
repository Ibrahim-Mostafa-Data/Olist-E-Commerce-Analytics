# 📊 Olist E-Commerce Analytics Hub

![SQL Server](https://img.shields.io/badge/SQL%20Server-CC292B?style=for-the-badge&logo=microsoftsqlserver&logoColor=white)
![Python](https://img.shields.io/badge/Python-3670A0?style=for-the-badge&logo=python&logoColor=ffdd54)
![Pandas](https://img.shields.io/badge/pandas-%23150458.svg?style=for-the-badge&logo=pandas&logoColor=white)
![Power BI](https://img.shields.io/badge/Power_BI-F2C811?style=for-the-badge&logo=powerbi&logoColor=black)
![Figma](https://img.shields.io/badge/Figma-F24E1E?style=for-the-badge&logo=figma&logoColor=white)

---

An end-to-end data analytics project examining Brazilian E-Commerce public data (Olist) to extract actionable business insights across sales performance, customer logistics, churn rate, and merchant operations.

---

## 🛠️ Tech Stack & Tools
- **Database Management:** SQL Server (Data extraction, complex aggregation, CTEs)
- **Data Processing & Cleaning:** Python (Pandas, NumPy)
- **Data Visualization & Dashboarding:** Power BI (DAX, Data Modeling, Custom Layouts)
- **UI/UX Framing:** Figma (Dashboard layout wireframing)

---

## 📖 The Project Story & Data Pipeline

This project wasn't built by simply importing pre-cleaned tables into a BI tool. Instead, it represents a complete, real-world data engineering and analytics lifecycle built from the ground up to solve complex e-commerce challenges.
### 1️⃣ Raw Data Discovery & Exploration
* Received **8 raw CSV files** containing unstructured public datasets with over **1.5M+ total rows**.
* Analyzed file constraints and sizes, including handling high-volume datasets such as `geolocation` (~58 MB).

![Raw Data Files](Date.png)

---

### 2️⃣ Database Creation & Relational Schema Design (SQL Server)
* Designed and created the relational database schema from scratch in SQL Server.
* Established table structures, primary keys, and foreign keys to ensure data integrity across orders, customers, products, payments, reviews, and sellers.
* Executed SQL queries to validate relationships and handle large-scale dataset joins.

![Raw Data Tables Query](Raw%20Data%20Tables.png)

![Database Schema Design](Schema%20Design.png)

---

### 3️⃣ Data Cleaning & Transformation (Python & Jupyter Notebook)
* Exported database tables into Python (`Olist_Brazilian.ipynb`) for advanced data cleaning.
* Standardized date-time formats, resolved missing review values, translated product categories, and handled duplicated geolocation coordinates.

---

### 4️⃣ Analytical Data Modeling (Power BI Star Schema)
* Structured an optimized **Star Schema** in Power BI with clear separation between Fact tables (`Fact_Orders`, `Fact_order_items`) and Dimension tables (`Dim_Customer`, `Dim_Products`, `Dim_Date`, `Dim_sellers`, `Dim_order_payments`, `Dim_order_reviews`).
* Built complex **DAX measures** for delivery performance, order counts, revenue metrics, customer retention, and custom HTML/SVG visuals.

![Power BI Star Schema Data Model](data_modeling_star_schema.png)

---

## 📸 Dashboards Overview

### 🏠 Home Dashboard
![Home Dashboard](Home.png)

### 📈 Overview Dashboard
![Overview Dashboard](Overview.png)

### 👥 Customer Dashboard
![Customer Dashboard](Customer.png)

### 📦 Product Dashboard
![Product Dashboard](Product.png)

### 🚚 Delivery Dashboard
![Delivery Dashboard](Delivery.png)

### 🤝 Seller Dashboard
![Seller Dashboard](Seller.png)

---

## 📄 التوصيات التنفيذية للبزنس | Executive Business Recommendations

### 1. تحسين استراتيجية الاحتفاظ بالعملاء ودورة حياتهم
- **الملاحظة:** نسبة تسرب العملاء (Churn) مرتفعة جداً، حيث إن **90.55 ألف عميل (أكثر من 97%)** اشتروا مرة واحدة فقط، ونسبة الشراء المكرر أقل من **3%**.
- **التوصية:** توجيه جزء من ميزانية التسويق من جلب عملاء جُدد إلى الاحتفاظ بالعملاء الحاليين (Retention). تفعيل حملات بريدية تلقائية بعد الشراء، وبرامج ولاء، وحملات إعادة إشراك بالاعتماد على تحليل RFM لتحفيز عملية الشراء الثانية وزيادة القيمة الممتدة للعميل (LTV).

---

### 2. تطوير العمليات اللوجستية والالتزام بمعايير سرعة التوصيل
- **الملاحظة:** متوسط وقت تنفيذ وشحن الطلب يستغرق **12.1 يومًا**، مع وجود **6.8% من إجمالي الطلبات (6.53 ألف طلب) تعاني من التأخير**، وتصل بعض التأخيرات إلى أكثر من 16 يومًا.
- **التوصية:** إنشاء مراكز توزيع إقليمية (Fulfillment Centers) بالقرب من المناطق ذات الطلب العالي مثل **ساو باولو (15.54 ألف عميل)** لتقليل زمن الشحن إلى أقل من 5 أيام. تطبيق سياسات صارمة لاتفاقيات مستوى الخدمة (SLA) ومحاسبة البائعين المتسببين في تأخير تجهيز الشحنات.

---

### 3. الاستفادة من المنتجات الأعلى مبيعاً والتوسع الجغرافي للبائعين
- **الملاحظة:** حجم المبيعات يتركز بشكل كبير في قطاعات رئيسية مثل (الصحة والجمال) و(أثاث ومستلزمات المنزل)، بينما يتوزع 3.10 ألف بائع نشط بشكل محلي فقط.
- **التوصية:** التركيز على توفير المخزون واستراتيجيات الترويج للأقسام الأكثر مبيعاً ونشاطاً. العمل على جذب وبناء شراكات مع بائعين جُدد في المناطق الجغرافية ذات الطلب العالي لتقليل تكاليف الشحن بين الولايات وتفادي اختناقات التوصيل.

---

### 4. معالجة مشاكل الخدمة والتعامل السريع مع التقييمات السلبية
- **الملاحظة:** هناك جزء غير هين من التقييمات يقع في فئات الرضا المنخفضة، بما في ذلك **11.28 ألف تقييم بنجمة واحدة**، على الرغم من أن متوسط التقييم العام جيد ويبلغ 4.09.
- **التوصية:** إجراء تحليل متقدم للنصوص واللغة (NLP) وتحليل المشاعر على تعليقات العملاء السلبية لتحديد الأسباب الجذرية (مثل جودة المنتج مقابل تأخير الشحن). تنفيذ نظام تنبيه تلقائي للتقييمات السيئة لتمكين خدمة العملاء من التدخل السريع.

---

### 👤 Created By:
**Ebrahim Mustafa** — *Data Analyst & BI Analyst*
