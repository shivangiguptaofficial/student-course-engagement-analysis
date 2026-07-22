-- ========================================================
-- Project: Student Course Engagement & Conversion Analysis
-- Database: db_course_conversions
-- Table: student_engagement
-- ========================================================

-- 1. Check total rows and basic data view
SELECT * FROM student_engagement LIMIT 10;

-- 2. Calculate Daily Active Users (DAU)
SELECT 
    date_watched,
    COUNT(DISTINCT student_id) AS daily_active_users
FROM 
    student_engagement
GROUP BY 
    date_watched
ORDER BY 
    date_watched ASC;

-- 3. Engagement Frequency (How many days did students watch content?)
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
) AS frequency_table
GROUP BY 
    days_active
ORDER BY 
    days_active DESC;

-- 4. Find Top 10 Most Active Students
SELECT 
    student_id,
    COUNT(DISTINCT date_watched) AS total_days_watched,
    WIN(date_watched) AS first_active_date,
    MAX(date_watched) AS last_active_date
FROM 
    student_engagement
GROUP BY 
    student_id
ORDER BY 
    total_days_watched DESC
LIMIT 10;
