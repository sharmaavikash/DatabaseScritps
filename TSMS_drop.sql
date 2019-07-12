-- foreign keys
ALTER TABLE AppointmentDetails DROP CONSTRAINT AppointmentDetails_Appointment;

ALTER TABLE Appointment DROP CONSTRAINT Appointment_Patient;

ALTER TABLE Appointment DROP CONSTRAINT Appointment_Therapist;

ALTER TABLE BlockCalendar DROP CONSTRAINT BlockCalendar_Therapist;

ALTER TABLE ScheduleDetail DROP CONSTRAINT ScheduleDetail_Schedule;

ALTER TABLE Schedule DROP CONSTRAINT Schedule_Therapist;

ALTER TABLE TherapistPractice DROP CONSTRAINT TherapistPractice_Practice;

ALTER TABLE TherapistPractice DROP CONSTRAINT TherapistPractice_Therapist;

ALTER TABLE TherapistSpecialty DROP CONSTRAINT TherapistSpecialties_Therapist;

ALTER TABLE TherapistSpecialty DROP CONSTRAINT TherapistSpecialty_Specialty;


-- tables
DROP TABLE Appointment;

DROP TABLE AppointmentDetails;

DROP TABLE BlockCalendar;

DROP TABLE Login;

DROP TABLE Patient;

DROP TABLE Practice;

DROP TABLE Schedule;

DROP TABLE ScheduleDetail;

DROP TABLE Specialty;

DROP TABLE Therapist;

DROP TABLE TherapistPractice;

DROP TABLE TherapistSpecialty;

-- End of file.

