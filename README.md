# 📊 Customer Engagement Analytics Project

> 🚀 Data-driven insights into user behavior, feature adoption, and platform engagement — built using SQL & Power BI.

## 📌 Project Objective

To analyze digital user engagement and channel efficiency across a product platform using SQL and dashboarding. The goal is to generate actionable insights for product, marketing, and operations teams, mimicking a real-world data analytics role such as **Senior Analyst – Data Analytics at American Express**.

---

## 📁 Dataset Overview

Three mock datasets were created to simulate digital platform activity:

| Table | Description |
|-------|-------------|
| `user_data` | Contains demographic and acquisition info for platform users |
| `mock_activity_data` | Tracks login sessions, timestamps, and durations |
| `feature_usage` | Logs feature-level interactions per user |

### Example Schema:

#### `user_data.csv`
- `user_id`, `age`, `gender`, `location`, `signup_date`, `tier`, `source_channel`

#### `mock_activity_data.csv`
- `user_id`, `session_id`, `timestamp`, `session_duration`

#### `feature_usage.csv`
- `user_id`, `feature_name`, `usage_count`, `last_used`

---

## 🧠 Key SQL Analyses

Below are examples of advanced SQL used to derive strategic insights:

| Area | Key Queries |
|------|-------------|
| 📈 User Segmentation | New signups by tier, channel efficiency |
| 🔁 Retention | 7-day login retention analysis |
| 📊 Feature Adoption | Most used features, adoption rate by tier |
| 🧭 Behavior Insights | Peak usage hours, session buckets, feature-to-session ratio |
| 🏆 Power Users | Engagement rank, session duration leaders |
| 📉 Funnel Optimization | Conversion from signup to active users by source |

> ✅ All queries written in MySQL (InnoDB) — no Python used, staying SQL-focused.

---

