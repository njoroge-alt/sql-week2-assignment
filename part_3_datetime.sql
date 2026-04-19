-- ============================================================
-- Section C: Date & Time functions
-- Name: James
-- Date: 18-04-2026
-- ============================================================

set search_path to nairobi_academy;

select * from students;


-- Q1: Display the birth year, birth month, and birth day from each student's date_of_birth
--     as three separate columns. Show first_name alongside them. 

select 
	first_name,
	date_part('year',date_of_birth) as birth_year,
	date_part('month',date_of_birth) as birth_month,
	date_part('day',date_of_birth) as birth_day
from students;


-- Q2: Display each student's full name, their date_of_birth, and their age in complete years. 
--     Order from oldest to youngest. 

select
	concat(first_name, ' ', last_name) as full_name,
	date_of_birth,
	date_part('year', AGE(date_of_birth)) as current_age
from students
order by current_age desc;

-- Q3: Display each exam date in this exact format: 'Friday, 15th March 2024'
--     Call the column formatted_date. 

select * from exam_results;

select
    exam_date,
    to_char(exam_date, 'Day, DDth Month YYYY') AS formatted_date
from exam_results;