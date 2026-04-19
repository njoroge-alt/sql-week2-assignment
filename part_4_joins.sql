-- ============================================================
-- Section D: SQL JOINS
-- Name: James
-- Date: 18-04-2026
-- ============================================================

set search_path to city_hospital;

select * from appointments;
select * from departments;
select * from doctors;
select * from patients;
select * from prescriptions;

-- Q1: Write an INNER JOIN query to show each appointment alongside the patient's full name, the 
--     doctor's full name, the appointment date, and the diagnosis. 

select
	p.full_name,
	d.full_name,
	a.appt_date,
	a.diagnosis,
	a.appointment_id
from appointments a 
inner join doctors d on d.doctor_id = a.doctor_id
inner join patients p on p.patient_id = a.patient_id;

-- Q2: Write a LEFT JOIN query to show ALL patients - and if they have an appointment, show the 
--     appointment date and diagnosis. Patients with no appointments should still appear with NULL values 

select 
	p.full_name,
	a.appt_date,
	a.diagnosis,
	a.appointment_id
from patients p 
left join appointments a on a.patient_id = p.patient_id;
	
-- Q3: Write a RIGHT JOIN query to show ALL doctors - and if they have seen a patient, show the 
--     patient name. Doctors with no appointments should still appear. 

select 
	d.full_name,
	p.full_name,
	a.appt_date
from appointments a
right join patients p on p.patient_id  = a.patient_id
right join doctors d  on d.doctor_id   = a.doctor_id;

-- Q4: Write a query using LEFT JOIN and WHERE IS NULL to find all patients who have NEVER had 
--     an appointment. Show patient full_name and city. 

select
	p.full_name,
	p.city
from patients p
left join appointments a on a.patient_id  = p.patient_id
where a.appointment_id  is null;

-- Q5: Write a three-table INNER JOIN to show each appointment with: the patient name, the doctor name, 
--     and the medicine prescribed (from prescriptions). Show appointment_id, patient name, doctor name, and medicine_name. 

select 
	a.appointment_id,
	p.full_name as patient_name,
	d.full_name as doctor_name,
	pre.medicine_name
from appointments a 
inner join patients p on p.patient_id  = a.patient_id 
inner join doctors d on d.doctor_id  = a.doctor_id 
inner join prescriptions pre on pre.appointment_id  = a.appointment_id;
	

