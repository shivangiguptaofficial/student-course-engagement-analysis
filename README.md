# 🎓📊 Student Course Engagement & Conversion Analysis

## 📌 Project Overview

This project analyzes student interaction patterns, platform engagement, and course purchase conversions on an online learning platform using **MySQL**. By tracking student registrations, daily engagement, and purchase data, this project builds a complete conversion funnel to measure user acquisition, retention, and final conversion rates.

The goal is to answer key business questions such as:
- How many students are actively engaging with course content each day?
- How long does it take a student to go from sign-up → engagement → purchase?
- What percentage of engaged students actually convert into paying customers?

---

## 🗄️ Database Schema (`db_course_conversions`)

The project uses a relational database structure consisting of three core tables:

### 1. Table: `student_info`

| Column Name       | Data Type | Description                                    |
|-------------------|-----------|-------------------------------------------------|
| `student_id`      | INT       | Unique identifier for each registered student.  |
| `date_registered` | DATE      | The date when the student signed up on the platform. |

### 2. Table: `student_engagement`

| Column Name    | Data Type | Description                                                      |
|-----------------|-----------|-------------------------------------------------------------------|
| `student_id`    | INT       | Unique identifier for each student.                                |
| `date_watched`  | DATE      | The specific date when the student engaged with course content.   |

### 3. Table: `student_purchases`

| Column Name       | Data Type | Description                                             |
|-------------------|-----------|-----------------------------------------------------------|
| `student_id`      | INT       | Unique identifier for the student who made a purchase.    |
| `date_purchased`  | DATE      | The date when the student purchased a paid course.        |

---

erDiagram
    student_info {
        INT student_id PK "Unique Student ID"
        DATE date_registered "Sign-up Date"
    }
    student_engagement {
        INT student_id FK "Student ID"
        DATE date_watched "Content Watch Date"
    }
    student_purchases {
        INT student_id FK "Student ID"
        DATE date_purchased "Course Purchase Date"
    }
    student_info ||--o{ student_engagement : "tracks activity"
    student_info ||--o{ student_purchases : "monetizes"

    


## 📈 Key Business Metrics Tracked

1. **Daily Active Users (DAU):** Monitoring platform traffic and daily student participation trends.
2. **Engagement Frequency:** Analyzing how many unique days students spend learning.
3. **Conversion Funnel & Rate:** Calculating the percentage of registered or engaged students who successfully purchase a course.
4. **Time-to-Conversion:** Measuring the duration between a student's activity (registration/engagement) and their actual course purchase.
5. **Retention Segments:** Classifying students into one-time viewers vs. repeat/regular learners based on engagement frequency.

## 🔍 Key Findings & Insights

- **Overall Conversion Rate:** Approximately **XX%** of engaged students convert into paying customers after interacting with course content.
- **Registration-to-Engagement Time:** On average, students take **X to X days** after registering to watch their first piece of content.
- **Engagement-to-Purchase Time:** On average, it takes about **XX days** from first watching content to making a purchase.
- **Engagement Frequency:** The distribution is heavily skewed toward one-time or low-frequency viewers, with a small segment of highly engaged repeat learners.
- **Drop-off Point:** The biggest leakage in the funnel occurs between [stage A] and [stage B], indicating [reason/insight].

## 📊 Visualizations & Funnel Analysis

*(Below are visual representations generated from the data analysis pipeline)*

### 1. Conversion Funnel Breakdown
> 

![Conversion Funnel](assets/conversion_funnel.png)


- **Insight:** Shows the drop-off percentage from initial platform registration to active course consumption to final purchase.
- **Key Takeaway:** Highlights the critical leakage point where users drop out before engaging, emphasizing the need for stronger onboarding nudges.

### 2. Engagement Frequency Distribution
> 

![Engagement Frequency](assets/engagement_frequency.png)


- **Insight:** Illustrates how many unique days students spend interacting with course content.
- **Key Takeaway:** Visualizes the right-skewed pattern where a majority of students are one-time viewers, isolated from a smaller group of consistently active learners.

### 3. [Add More Visuals As Needed]
> 

![Chart Name](assets/chart-name.png)


- **Insight:** What this chart shows.
- **Key Takeaway:** What business decision or pattern this supports.

## 🗃️ Sample Query Outputs & Snippets

Here are sample SQL queries used in the analysis pipeline to calculate key metrics across the conversion funnel.

### 1. Overall Conversion Rate (Registration-to-Purchase Funnel)
Calculates the percentage of ALL registered students (regardless of engagement) who went on to purchase.
```sql
SELECT
    COUNT(DISTINCT i.student_id) AS total_registered,
    COUNT(DISTINCT p.student_id) AS total_purchased,
    ROUND(COUNT(DISTINCT p.student_id) * 100.0 / COUNT(DISTINCT i.student_id), 2) AS overall_conversion_rate_percentage
FROM
    student_info i
LEFT JOIN
    student_purchases p ON i.student_id = p.student_id;

student-course-engagement-analysis/
├── analysis.sql              # All SQL queries used in the analysis
├── assets/
│   ├── conversion_funnel.png
│   └── engagement_frequency.png
└── README.md

git clone https://github.com/shivangiguptaofficial/student-course-engagement-analysis.git
cd student-course-engagement-analysis
mysql -u your_username -p db_course_conversions < analysis.sql



