-- ========================================================
-- Project: Student Course Engagement & Conversion Analysis
-- Database: db_course_conversions
-- Tables: student_info, student_engagement, student_purchases
-- ========================================================

USE db_course_conversions;

-- 1. Check basic data views from all tables
SELECT * FROM student_info LIMIT 10;
SELECT * FROM student_engagement LIMIT 10;
SELECT * FROM student_purchases LIMIT 10;

-- 2. Calculate Daily Active Users (DAU)
-- Tracks the number of unique students active on each day
SELECT 
    date_watched,
    COUNT(DISTINCT student_id) AS daily_active_users
FROM 
    student_engagement
GROUP BY 
    date_watched
ORDER BY 
    date_watched ASC;

-- 3. Engagement Frequency (How many unique days did students watch content?)
-- Shows one-time viewers vs. regular learners
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
    MIN(date_watched) AS first_active_date,
    MAX(date_watched) AS last_active_date
FROM 
    student_engagement
GROUP BY 
    student_id
ORDER BY 
    total_days_watched DESC
LIMIT 10;

-- 5. Overall Conversion Rate (Registration-to-Purchase Funnel)
-- What percentage of ALL registered students (regardless of engagement) went on to purchase
SELECT 
    COUNT(DISTINCT i.student_id) AS total_registered,
    COUNT(DISTINCT p.student_id) AS total_purchased,
    ROUND(COUNT(DISTINCT p.student_id) * 100.0 / COUNT(DISTINCT i.student_id), 2) AS overall_conversion_rate_percentage
FROM 
    student_info i
LEFT JOIN 
    student_purchases p ON i.student_id = p.student_id;

-- 6. Engagement-to-Purchase (Free-to-Paid) Conversion Rate
-- The core funnel metric: percentage of students who watched content FIRST and then purchased.
-- Uses MIN() to find each student's first watch/purchase date, and only counts purchases
-- that happened on or after engagement -- not purchases that happened before a student
-- ever watched anything.
SELECT 
    ROUND(
        COUNT(first_date_purchased) * 100.0 / COUNT(first_date_watched), 
    2) AS engagement_conversion_rate_percentage
FROM (
    SELECT 
        e.student_id,
        MIN(e.date_watched) AS first_date_watched,
        MIN(p.date_purchased) AS first_date_purchased
    FROM 
        student_engagement e
    LEFT JOIN 
        student_purchases p ON e.student_id = p.student_id
    GROUP BY 
        e.student_id
    HAVING 
        first_date_purchased IS NULL 
        OR first_date_watched <= first_date_purchased
) AS engagement_funnel;

-- 7. Average Duration Between Registration and First-Time Engagement
-- And Average Duration Between First-Time Engagement and First-Time Purchase
SELECT 
    ROUND(SUM(days_diff_reg_watch) / COUNT(days_diff_reg_watch), 2) AS avg_days_registration_to_watch,
    ROUND(SUM(days_diff_watch_purch) / COUNT(days_diff_watch_purch), 2) AS avg_days_watch_to_purchase
FROM (
    SELECT 
        e.student_id,
        i.date_registered,
        MIN(e.date_watched) AS first_date_watched,
        MIN(p.date_purchased) AS first_date_purchased,
        DATEDIFF(MIN(e.date_watched), i.date_registered) AS days_diff_reg_watch,
        DATEDIFF(MIN(p.date_purchased), MIN(e.date_watched)) AS days_diff_watch_purch
    FROM 
        student_engagement e
    JOIN 
        student_info i ON e.student_id = i.student_id
    LEFT JOIN 
        student_purchases p ON e.student_id = p.student_id
    GROUP BY 
        e.student_id
    HAVING 
        first_date_purchased IS NULL 
        OR first_date_watched <= first_date_purchased
) AS timing_analysis;


