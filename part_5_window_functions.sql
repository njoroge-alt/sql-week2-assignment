-- ============================================================
-- Section E: Window functions
-- Name: James
-- Date: 18-04-2026
-- ============================================================

set search_path to nairobi_academy;

-- Q1: Write a query using ROW_NUMBER() to assign a unique rank to each exam result, ordered 
--     from highest mark to lowest. Show result_id, student_id, marks, and row_num. 

select * from exam_results;


select 
	result_id,
	student_id,
	marks,
	row_number() over (order by marks desc) as row_num
from exam_results;

-- Q2: Write a query using RANK() and DENSE_RANK() on exam results ordered by marks descending. 
--     Show both columns side by side so the difference between them is visible. 

select 
	result_id,
	rank() over (order by marks desc) as rank_column,
	dense_rank() over (order by marks desc) as denserank_column
from exam_results;

-- Q3: Write a query using NTILE(3) to divide all exam results into 3 performance bands 
--    (1 = top, 2 = middle, 3 = bottom). Show result_id, marks, and band. 

select 
	result_id,
	marks,
	case 
		when ntile(3) over (order by marks) = 1 then 'top'
		when ntile(3) over (order by marks) = 2 then 'middle'
		else 'bottom'
	end as band
from exam_results;

-- Q4: Write a query using AVG() OVER(PARTITION BY student_id) to show each exam result alongside 
--     that student's personal average mark. Show student_id, marks, and student_avg rounded to 2 decimal places. 

select 
	student_id,
	marks,
	round(AVG(marks) over (partition by student_id),2) as student_avg
from exam_results;

-- Q5: Write a query using LAG() to show each exam result alongside the previous result's marks for the 
--     same student. Also calculate the improvement (current marks minus previous marks). 
--     Use PARTITION BY student_id. 

select 
	marks,
	lag(marks) over (partition by student_id) as previous_result,
	marks - lag(marks) over (partition by student_id) as improvement
from exam_results;
	


