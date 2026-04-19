-- ============================================================
-- Section F: SET Operators
-- Name: James
-- Date: 18-04-2026
-- ============================================================

set search_path to nairobi_academy;
select * from students;

-- Q1: Write a UNION query to show a combined list of all unique cities from the students table and 
--     the patients table. Order alphabetically. 

select city from nairobi_academy.students 
union 
select city from city_hospital.patients
order by city;

-- Q2: Write a UNION ALL query to combine all student first names and all patient full names into 
--     one list. Add a second column called source that says 'Student' or 'Patient' so you can tell 
--     where each name came from. 

select full_name as full_name, 'city_hospital' as table_source from city_hospital.patients
union all 
select concat(first_name, ' ', last_name) as full_name, 'nairobi_academy' as table_source from nairobi_academy.students;


-- Q3: Write an INTERSECT query to find cities that appear in BOTH the students table and the patients table
--     cities that are home to both students and patients. 

select city from nairobi_academy.students 
intersect 
select city from city_hospital.patients
order by city;

-- Q4: Write a query that combines all of the following into one result using UNION ALL 
--     student names (labelled 'Student'), patient full names (labelled 'Patient'), and doctor full names 
--     (labelled 'Doctor'). Order the final result by the source label, then by name. 

select concat(first_name, ' ', last_name) as name, 'Student' as source from nairobi_academy.students
union all 
select full_name as name, 'Patient' as source from city_hospital.patients 
union all
select full_name as name, 'Doctor' as source from city_hospital.doctors 
order by source, name;