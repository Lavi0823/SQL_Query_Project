Alter table hospital 
Change column `ï»¿Name_Hospital` `Hospital_Name` VARCHAR(255);

select * from hospital;
-- Write an SQL query to find the total number of patients across all hospitals. 

select Hospital_Name, 
sum(Patients) as Number_Of_Patients 
from hospital 
group by Hospital_Name;

-- Retrieve the average count of doctors available in each hospital. 

select Hospital_Name, round(Avg(Doctors),0)as Avg_Doctors 
from hospital 
group by Hospital_Name;

-- Find the top 3 hospital departments that have the highest number of patients.

select Department, sum(Patients) as num_of_Patients
from hospital 
group by Department
order by num_of_Patients desc limit 3; 

select distinct department from hospital;

-- Identify the hospital that recorded the highest medical expenses.
 select Hospital_Name, Location, Medical_Expenses
 from hospital 
 order by Medical_Expenses desc limit 1; 
 
-- Calculate the average medical expenses per day for each hospital. 
select Hospital_Name, round((avg(Medical_Expenses))/30,0) 
from hospital 
group by Hospital_Name;

-- Find the patient with the longest stay by calculating the difference between Discharge Date and Admission Date.

SELECT *, 
       DATEDIFF(STR_TO_DATE(Discharge_Date, '%d-%m-%Y'), STR_TO_DATE(Admission_Date, '%d-%m-%Y')) AS Stay_Duration
FROM Hospital
ORDER BY Stay_Duration DESC;
select *, DATEDIFF(str_to_date(Discharge_Date,'%d-%m-%Y'),str_to_date( Admission_Date,'%d-%m-%Y') )AS Stay_Duration
from hospital order by Stay_Duration desc;

-- Count the total number of patients treated in each city. 
select location, count(patients) from hospital group by location;

-- Calculate the average number of days patients spend in each department.
select Department, 
avg(DATEDIFF(str_to_date(Discharge_Date,'%d-%m-%Y'),str_to_date( Admission_Date,'%d-%m-%Y') ))AS Stay_Duration 
from hospital group by Department;

-- Find the department with the least number of patients. 
select Department, sum(patients) as total_patients 
group by Department 
order by total_patients limit 1;

-- Group the data by month and calculate the total medical expenses for each month. 
select 
	   year(str_to_date(Admission_Date,'%d-%m-%Y')) as year,
       Month(str_to_date(Admission_Date,'%d-%m-%Y')) as month,
       sum(medical_Expenses) as total_Expenses
	from hospital 
    group by year,month
    order by year,month;

select * from hospital;
describe hospital;

