-- ============================================================
-- Section B: Number functions
-- Name: James
-- Date: 18-04-2026
-- ============================================================

-- Q1: Display each exam result alongside the mark rounded to 1 decimal place, 
--     the mark rounded UP to the nearest 10 using CEIL, and the mark rounded DOWN using FLOOR. 

set search_path to nairobi_academy;

select * from exam_results;

select
	result_id,
	marks,
	cast(round(marks) as decimal(10,1))  as rounded_to_1_decimal,
	ceil(marks / 10.0) * 10 as rounded_up,
	floor(marks / 10.0) * 10 as rounded_down
from exam_results;


-- Q2: Display total number of results (COUNT), average mark (AVG rounded to 2 decimal places), highest 
--     mark (MAX), lowest mark (MIN), and total marks added together (SUM). 

select 
	count(marks),
	round(AVG(marks),2),
	MAX(marks),
	MIN(marks),
	SUM(marks)
from exam_results;


-- Q3: Display each result_id, the original marks, and the new boosted_mark which a 10% bonus,
--     rounded to the nearest whole number. 

select 
	result_id,
	marks,
	round((marks*110)/100) as boosted_mark
from exam_results;