-- ============================================================
-- Section A: String functions
-- Name: James
-- Date: 18-04-2026
-- ============================================================

-- Q1: Display each student's name in UPPERCASE and their city in lowercase
-- 	   Name the columns upper_name and lower_city

set search_path to nairobi_academy;

select * from students;

select 
	UPPER(concat(first_name, ' ' ,last_name)) as upper_name,
	LOWER(city) as lower_city 
from students;

-- Q2: Display each student's first name and the length ordering the names from the longest to shortest

select 
	first_name,
	length(first_name) as string_length
from students
order by string_length desc;

-- Q3: Display each subject's name and a short version, the first 4 characters of the subject name(short_name) 
-- Also show the full subject name length. 

select * from subjects;

select 
	subject_name,
	LEFT(subject_name, 4) as short_name,
	length(subject_name) as subject_length
from subjects;

-- Q4: Display using CONCAT, a sentence for each student in this format: 'Amina Wanjiku is in Form 3 and comes from Nairobi'.
-- Call the column student_summary. 

select
	concat(first_name, ' ', last_name, ' is in ',class, ' and comes from ', city ) as student_summary
from students;