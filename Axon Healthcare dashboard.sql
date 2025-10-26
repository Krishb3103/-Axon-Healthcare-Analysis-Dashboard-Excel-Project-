create database axon_healthcare;
use axon_healthcare;
create table patient(Patient_ID varchar(50),Gender varchar(50),DateOfBirth varchar(50),Age int,	Blood_Type varchar(60));
select*from patient;
select *from doctor;

create table lab_result(Lab_Result_ID varchar(50),Visit_ID varchar(100), Test_Name varchar(50), Test_Date varchar(50),Units	varchar(50),
Comments varchar(50) ,Test_Result varchar(50),Reference_Range varchar(50));
create table visit_id(Visit_ID int,	Patient_ID int, Doctor_ID int , Visit_Date	varchar(50),
Diagnosis varchar(50), Follow_Up_Required varchar(50), Visit_Type varchar(50), Visit_Status varchar(50)	,Diagnosis_Code varchar(50),Reason_for_Visit varchar(50));
create table treatment(Treatment_ID int ,Visit_ID int,Medication varchar(50) , Dosage varchar(50), Instructions varchar(50),Treatment_Cost varchar(50),
Treatment_Type varchar(50), Treatment_Name varchar(50), Status1 varchar(540), Cost varchar(50), Outcome varchar(540),Treatment_Description varchar(50));
create table doctor (Doctor_ID int,	Doctor_Name varchar(50),Specialty varchar(50), 
Years_Of_Experience int, Hospital_Affiliation varchar(50),Hospital_Clinic varchar(50));


select*from patient;
select *from doctor;

select *from lab_result;
select*from treatment;
select* from visit_id;
# drop table doctor;

# 1. Total Patients
select count(*) from Patient;
# 2.	Total Doctors
select count(*) from Doctor;
# 3.	Total Visits
select count(*) from Visit_id;
# 4.	Average Age of Patients
select avg(age) from patient;
# 5.	Top 5 Diagnosed Conditions
select diagnosis,count(diagnosis) from visit_id group by diagnosis order by diagnosis asc limit 5;
# 6.	Follow-Up Rate
select concat(round(count( Visit_ID)/100,2),'%') as percentage , follow_up_required from visit_id where follow_up_required ="yes" ;
SELECT 
    ROUND((COUNT(*) * 100.0 / (SELECT COUNT(*) FROM visit_id)), 2) AS yes_percentage
FROM visit_i 	d
WHERE follow_up_required = 'Yes';
# 7.Treatment Cost Per Visit 
select round(avg(Treatment_Cost)/100,2) from treatment;
# 8.Total Lab Tests Conducted
select count(Lab_Result_ID) from Lab_result;
# 9.	Percentage of Abnormal Lab Results
select concat(round(count(Lab_Result_ID)/100,2),'%'), Test_Result from Lab_Result where Test_Result="Abnormal" ;
# 10.	Doctor Workload 
select count(visit_id)/count(*)*10 from doctor Inner Join visit_id ON doctor.Doctor_id=visit_id.Doctor_id;

# Total Revenue=sum(Treatment cost)+ sum(VisitCharges)
select concat(concat(round(sum(Treatment_Cost)/1000000,2),"M")+ concat(round(sum(cost)/1000000,2),"M"),"M" ) AS total_revenue from treatment;



