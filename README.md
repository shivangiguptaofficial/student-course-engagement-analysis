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

