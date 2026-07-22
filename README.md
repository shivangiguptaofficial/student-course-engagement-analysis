# Student Course Engagement & Conversion Analysis 🎓📊

## 📌 Project Overview
This project analyzes student interaction patterns, platform engagement, and course purchase conversions on an online learning platform using MySQL. By tracking student registrations, daily engagement, and purchase data, this project builds a complete conversion funnel to measure user acquisition, retention, and final conversion rates.

---

## 🗄️ Database Schema (`db_course_conversions`)
The project uses a relational database structure consisting of three core tables:

### 1. Table: `student_info`
| Column Name | Data Type | Description |
| :--- | :--- | :--- |
| `student_id` | INT | Unique identifier for each registered student. |
| `date_registered` | DATE | The date when the student signed up on the platform. |

### 2. Table: `student_engagement`
| Column Name | Data Type | Description |
| :--- | :--- | :--- |
| `student_id` | INT | Unique identifier for each student. |
| `date_watched` | DATE | The specific date when the student engaged with course content. |

### 3. Table: `student_purchases`
| Column Name | Data Type | Description |
| :--- | :--- | :--- |
| `student_id` | INT | Unique identifier for the student who made a purchase. |
| `date_purchased` | DATE | The date when the student purchased a paid course. |

---

## 📈 Key Business Metrics Tracked
1. **Daily Active Users (DAU):** Monitoring platform traffic and daily student participation trends.
2. **Engagement Frequency:** Analyzing how many unique days students spend learning.
3. **Conversion Funnel & Rate:** Calculating the percentage of registered or engaged students who successfully convert into paying customers.
4. **Time-to-Conversion:** Measuring the duration between a student's activity and their actual course purchase.

---

## 📊 Key Findings & Insights
* **Overall Conversion Rate:** Approximately **11%** of engaged students convert into paying customers after watching a lecture.
* **Registration-to-Engagement Time:** On average, students take **3 to 4 days** after registering to watch their first lecture. Most students (mode/median = 0-1 day) start almost immediately — a small number of outliers take much longer, making the distribution **right-skewed**.
* **Engagement-to-Purchase Time:** On average, it takes about **24 days** from first watching content to making a purchase. However, the median is just **1 day**, showing most students who convert do so quickly — the higher average is pulled up by a few students who take months to decide.
* **Engagement Frequency:** The distribution is heavily skewed toward one-time or low-frequency viewers, with a smaller cohort of dedicated "power learners." 



## 🚀 How to Run This Project
1. Clone this repository or copy the scripts.
2. Import your database dump (`db_course_conversions`) into your MySQL server.
3. Run the queries provided in `analysis.sql` to generate insights and conversion metrics.


