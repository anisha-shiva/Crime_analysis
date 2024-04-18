use Crime_analysis;
desc victims;
desc suspects;
 Create a table for Incidents
desc incidents;
-4) Create a table for Law Enforcement Agencies
Create table LawEnforcementAgencies(
agency_id int primary key,
agency_name varchar(20),
jurisdiction varchar(50),
contact_information text
);
5) Create a table for Officers
Create table Officers(
officer_id int primary key,
first_name varchar(15),
last_name varchar(15),
badge_number varchar(20),
officer_rank varchar(20),
contact_information text,
agency_id int,
foreign key(agency_id) references LawEnforcementAgencies(agency_id)
);
--6) Create a table for Evidence
Create table Evidence(
evidence_id int primary key,
description text,
location_found varchar(50),
incident_id int,
foreign key(incident_id) references Incidents(incident_id)
);
7) Create a table for Reports
Create table Reports(
report_id int primary key,
incident_id int,
reporting_officer varchar(20),
report_date date,
report_details text,
status varchar(50),
officer_id int,
foreign key(incident_id) references Incidents(incident_id),
foreign key(officer_id) references Officers(officer_id)
);
show tables;

insert into Victims (victim_id,first_name,last_name,DOB,gender,contact_information)
VALUES
(1, 'Jane', 'Smith', '1985-08-20', 'Female', '456 Elm St, Othertown, USA'),
(2, 'Michael', 'Johnson', '1975-12-10', 'Male', '789 Oak St, Somewhere, USA'),
(3, 'Emily', 'Williams', '1999-02-25', 'Female', '321 Pine St, Nowhere, USA'),
(4, 'David', 'Brown', '1980-09-30', 'Male', '987 Maple St, Anywhere, USA');
select * from Victims;

insert into Suspects(suspect_id,first_name,last_name,DOB,gender,contact_information)
VALUES 
(1, 'Robert', 'White', '1987-07-18', 'Male', '111 First St, Newcity, USA'),
(2, 'Sarah', 'Anderson', '1995-04-28', 'Female', '222 Second St, Nextcity, USA'),
(3, 'Christo', 'Martinez', '1980-10-05', 'Male', '333 Third St, Bigcity, USA'),
(4, 'Jessica', 'Wilson', '1992-11-15', 'Female', '444 Fourth St, Smallcity, USA');
select * from Suspects;

insert into Incidents (incident_id,incident_type,incident_date,location,description,status,victim_id, suspect_id)
VALUES
(1, 'Robbery', '2024-04-10', 'Latitude: 40.7128, Longitude: -74.0060', 'Armed robbery at a convenience store.', 'Open', 1, 1),
(2, 'Homicide', '2024-04-15', 'Latitude: 34.0522, Longitude: -118.2437', 'Investigating a murder case.', 'Under Investigation', 2, 2),
(3, 'Theft', '2024-04-08', 'Latitude: 51.5074, Longitude: -0.1278', 'Stolen vehicle reported.', 'Closed', 3, 3),
(4, 'Fraud', '2024-04-05', 'Latitude: 37.7749, Longitude: -122.4194', 'Financial fraud case.', 'Closed', 4, 4);
select * from Incidents;

insert into LawEnforcementAgencies (agency_id, agency_name, jurisdiction, contact_information)
VALUES
(1, 'City Police','Citywide', '123 City Blvd, Cityville, USA'),
(2, 'County Sheriff','Countywide', '456 County Rd, Countytown, USA'),
(3, 'State Bureau','Statewide', '789 State Hwy, Statetown, USA'),
(4, 'Federal Bureau','National', '101 FBI Ave, Capital City, USA');
select *from LawEnforcementAgencies;

INSERT INTO Officers (officer_id, first_name, last_name, badge_number, officer_rank, contact_information, agency_id)
VALUES
(1, 'John', 'Smith', '12345', 'Detective', '1001 High St, Cityville, USA', 1),
(2, 'Sarah', 'Johnson', '54321', 'Sheriff', '2002 Low St, Townville, USA', 2),
(3, 'Michael', 'Williams', '98765', 'Special Agent', '3003 Middle St, Villagetown, USA', 3),
(4, 'Emily', 'Brown', '56789', 'Agent', '4004 East St, Suburbia, USA', 4);
select *from Officers;

INSERT INTO Evidence (evidence_id, description, location_found,incident_id)
VALUES
(1, 'Security footage from the convenience store.', '37.7749° N, 122.4194° W', 1),
(2, 'Forensic evidence from the crime scene.', '34.0522° N, 118.2437° W', 2),
(3, 'Fingerprint evidence collected at the scene.', '40.7128° N, 74.0060° W', 3),
(4, 'DNA sample from the suspect.', '51.5074° N, 0.1278° W', 4);
select *from Evidence;

select *from Reports;