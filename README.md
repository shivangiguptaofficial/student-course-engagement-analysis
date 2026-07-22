# Student Course Engagement & Conversion Analysis 🎓📊

## 📌 Project Overview
This project analyzes student interaction patterns on an online learning platform using MySQL. By tracking daily student activity, this analysis helps educational platforms measure user engagement, daily active users (DAU), and student consistency over time.

---

## 🗄️ Database Schema
The project uses the database **`db_course_conversions`** with a core table named **`student_engagement`**[span_0](start_span)[span_0](end_span).

### **Table: `student_engagement`**
| Column Name | Data Type | Description |
| :--- | :--- | :--- |
| `student_id` | INT | Unique identifier for each student[span_1](start_span)[span_1](end_span). |
| `date_watched` | DATE | The specific date when the student engaged with course content[span_2](start_span)[span_2](end_span). |

---

## 📈 Key Business Metrics Tracked
1. **Daily Active Users (DAU):** Monitoring platform traffic and daily student participation trends.
2. **Engagement Frequency Distribution:** Analyzing how many unique days students spend learning (e.g., one-time viewers vs. regular learners).
3. **Power Learners / Top Students:** Identifying students with the highest consistency and engagement rates.

---

## 🛠️ SQL Queries & Analysis (`analysis.sql`)

Here are the key queries used to extract valuable insights from the dataset:

### 1. Daily Active Users (DAU)
Tracks the number of unique students active on each day:
```sql
SELECT 
    date_watched,
    COUNT(DISTINCT student_id) AS daily_active_users
FROM 
    student_engagement
GROUP BY 
    date_watched
ORDER BY 
    date_watched ASC;
SELECT 
    days_active,
    COUNT(student_id) AS total_students
FROM (
    SELECT 
        student_id,
        COUNT(DISTINCT date_watched) AS days_active
    FROM 
        student_engagement
    GROUP BY 
        student_id
) AS student_activity_summary
GROUP BY 
    days_active
ORDER BY 
    days_active DESC;
SELECT 
    student_id,
    COUNT(DISTINCT date_watched) AS total_days_watched,
    MIN(date_watched) AS first_engagement_date,
    MAX(date_watched) AS last_engagement_date
FROM 
    student_engagement
GROUP BY 
    student_id
ORDER BY 
    total_days_watched DESC
LIMIT 10;
