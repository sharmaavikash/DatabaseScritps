-- tables
-- Table: Appointment
CREATE TABLE Appointment (
    AppointmentId int  NOT NULL IDENTITY(1, 1),
    FromDate Date  NOT NULL,
    ToDate Date  NOT NULL,
    Fee int  NOT NULL,
    Notes Varchar(500)  NOT NULL,
    TherapistId int  NOT NULL,
    PatientId int  NOT NULL,
    Treatment Varchar(250)  NOT NULL,
    CONSTRAINT Appointment_pk PRIMARY KEY  (AppointmentId)
);

-- Table: AppointmentDetails
CREATE TABLE AppointmentDetails (
    Id int  NOT NULL IDENTITY(1, 1),
    Session int  NOT NULL,
    FromDate DateTime  NOT NULL,
    ToDate DateTime  NOT NULL,
    Status Char(1)  NOT NULL,
    Notes Varchar(500)  NOT NULL,
    AppointmentId int  NOT NULL,
    CONSTRAINT AppointmentDetails_pk PRIMARY KEY  (Id)
);

-- Table: BlockCalendar
CREATE TABLE BlockCalendar (
    Id int  NOT NULL IDENTITY(1, 1),
    "From" DateTime  NOT NULL,
    "To" DateTime  NOT NULL,
    IsFullDay bit  NOT NULL,
    Reason Varchar(150)  NOT NULL,
    TherapistId int  NOT NULL,
    CONSTRAINT BlockCalendar_pk PRIMARY KEY  (Id)
);

-- Table: Login
CREATE TABLE Login (
    LoginId varchar(50)  NOT NULL,
    Password varchar(100)  NOT NULL,
    Role varchar(50)  NOT NULL,
	UserId int NOT NULL,
    CONSTRAINT Login_pk PRIMARY KEY  (LoginId)
);

-- Table: Patient
CREATE TABLE Patient (
    PatientId int  NOT NULL IDENTITY(1, 1),
    Name Varchar(150)  NOT NULL,
    DOB date  NOT NULL,
    Gender Varchar(10)  NOT NULL,
    Address Varchar(500)  NOT NULL,
    Phone Varchar(15)  NOT NULL,
    Email Varchar(50)  NOT NULL,   
    IsActive bit  NOT NULL,
    CONSTRAINT Patient_pk PRIMARY KEY  (PatientId)
);

-- Table: Practice
CREATE TABLE Practice (
    PracticeId int  NOT NULL IDENTITY(1, 1),
    Name Varchar(150)  NOT NULL,
    CONSTRAINT Practice_pk PRIMARY KEY  (PracticeId)
);

-- Table: Schedule
CREATE TABLE Schedule (
    ScheduleId int  NOT NULL IDENTITY(1, 1),
    Name Varchar(150)  NOT NULL,
    StartDate Date  NOT NULL,
    EndDate Date  NULL,
    Slot int  NOT NULL,
    TherapistId int  NOT NULL,
    CONSTRAINT Schedule_pk PRIMARY KEY  (ScheduleId)
);

-- Table: ScheduleDetail
CREATE TABLE ScheduleDetail (
    Id int  NOT NULL IDENTITY(1, 1),
    FromTime Time  NOT NULL,
    ToTime Time  NOT NULL,
    Day Varchar(15)  NOT NULL,
    Shift Varchar(15)  NOT NULL,
    ScheduleId int  NOT NULL,
    CONSTRAINT ScheduleDetail_pk PRIMARY KEY  (Id)
);

-- Table: Specialty
CREATE TABLE Specialty (
    SpecialtyId int  NOT NULL IDENTITY(1, 1),
    Name Varchar(150)  NOT NULL,
    CONSTRAINT Specialty_pk PRIMARY KEY  (SpecialtyId)
);

-- Table: Therapist
CREATE TABLE Therapist (
    TherapistId int  NOT NULL IDENTITY(1, 1),
    Name varchar(150)  NOT NULL,
    Address Varchar(500)  NOT NULL,
    Phone Varchar(15)  NOT NULL,
    Email Varchar(50)  NOT NULL,
    ClinicName Varchar(100)  NOT NULL,
    IsActive bit  NOT NULL,   
    Certifications Varchar(200)  NOT NULL,
    CONSTRAINT Therapist_pk PRIMARY KEY  (TherapistId)
);

-- Table: TherapistPractice
CREATE TABLE TherapistPractice (   
    TherapistId int  NOT NULL,
    PracticeId int  NOT NULL,  
	CONSTRAINT [PK_TherapistPractice] PRIMARY KEY CLUSTERED (	[TherapistId] ASC,	[PracticeId] ASC)
);

-- Table: TherapistSpecialty
CREATE TABLE TherapistSpecialty (   
    TherapistId int  NOT NULL,
    SpecialtyId int  NOT NULL, 
	CONSTRAINT [PK_TherapistSpecialty] PRIMARY KEY CLUSTERED 
(
	[TherapistId] ASC,
	[SpecialtyId] ASC
)
);

-- foreign keys
-- Reference: AppointmentDetails_Appointment (table: AppointmentDetails)
ALTER TABLE AppointmentDetails ADD CONSTRAINT AppointmentDetails_Appointment
    FOREIGN KEY (AppointmentId)
    REFERENCES Appointment (AppointmentId);

-- Reference: Appointment_Patient (table: Appointment)
ALTER TABLE Appointment ADD CONSTRAINT Appointment_Patient
    FOREIGN KEY (PatientId)
    REFERENCES Patient (PatientId);

-- Reference: Appointment_Therapist (table: Appointment)
ALTER TABLE Appointment ADD CONSTRAINT Appointment_Therapist
    FOREIGN KEY (TherapistId)
    REFERENCES Therapist (TherapistId);

-- Reference: BlockCalendar_Therapist (table: BlockCalendar)
ALTER TABLE BlockCalendar ADD CONSTRAINT BlockCalendar_Therapist
    FOREIGN KEY (TherapistId)
    REFERENCES Therapist (TherapistId);


-- Reference: ScheduleDetail_Schedule (table: ScheduleDetail)
ALTER TABLE ScheduleDetail ADD CONSTRAINT ScheduleDetail_Schedule
    FOREIGN KEY (ScheduleId)
    REFERENCES Schedule (ScheduleId);

-- Reference: Schedule_Therapist (table: Schedule)
ALTER TABLE Schedule ADD CONSTRAINT Schedule_Therapist
    FOREIGN KEY (TherapistId)
    REFERENCES Therapist (TherapistId);

-- Reference: TherapistPractice_Practice (table: TherapistPractice)
ALTER TABLE TherapistPractice ADD CONSTRAINT TherapistPractice_Practice
    FOREIGN KEY (PracticeId)
    REFERENCES Practice (PracticeId);

-- Reference: TherapistPractice_Therapist (table: TherapistPractice)
ALTER TABLE TherapistPractice ADD CONSTRAINT TherapistPractice_Therapist
    FOREIGN KEY (TherapistId)
    REFERENCES Therapist (TherapistId);

-- Reference: TherapistSpecialties_Therapist (table: TherapistSpecialty)
ALTER TABLE TherapistSpecialty ADD CONSTRAINT TherapistSpecialties_Therapist
    FOREIGN KEY (TherapistId)
    REFERENCES Therapist (TherapistId);

-- Reference: TherapistSpecialty_Specialty (table: TherapistSpecialty)
ALTER TABLE TherapistSpecialty ADD CONSTRAINT TherapistSpecialty_Specialty
    FOREIGN KEY (SpecialtyId)
    REFERENCES Specialty (SpecialtyId);

-- End of file.

