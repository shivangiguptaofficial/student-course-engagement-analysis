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

## 🧩 Database Architecture & ERD

The project uses a relational database structure (`db_course_conversions`) consisting of three core tables linked via `student_id`.

```mermaid
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


