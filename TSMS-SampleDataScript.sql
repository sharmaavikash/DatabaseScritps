-- Therapy Schedule Management System Sample data

-- Declare variables
DECLARE @PatientId1 INT
DECLARE @PatientId2 INT
DECLARE @TherapistId1 INT
DECLARE @TherapistId2 INT
DECLARE @ScheduleIdForTherapist1 INT
DECLARE @ScheduleIdForTherapist2 INT
DECLARE @AppointmentId INT
DECLARE @TodaysDateTime DATETIME = GETDATE()
DECLARE @TodaysDate DATE = GETDATE()


-- Insert new patient/s
INSERT INTO [dbo].[Patient] ([Name], [DOB], [Gender], [Address], [Phone], [Email],  [IsActive]) VALUES ('Smith Lewis', '1-May-1988', 'M', 'San Jose', '(408) 294-9337', 'Smith.Lewis@gmail.com',  1)
SET @PatientId1 = SCOPE_IDENTITY()
INSERT INTO [dbo].[Patient] ([Name], [DOB], [Gender], [Address], [Phone], [Email], [IsActive]) VALUES ('John Wick', '3-May-1980', 'M', 'San Jose', '(408) 294-9335', 'John.Wick@gmail.com',  1)
SET @PatientId2 = SCOPE_IDENTITY()

-- Insert new therapist/s
INSERT INTO [dbo].[Therapist] ([Name], [Address], [Phone], [Email], [ClinicName], [IsActive], [Certifications]) VALUES ('John.Smith', 'San Joes', '(408) 294-4435', 'John.Smith@gmail.com', 'Milestone Physical Therapy', 1,  'American Board of Examiners in Clinical Social Work, Certified Social Worker, Dance Therapist Registered')
SET @TherapistId1 = SCOPE_IDENTITY()
INSERT INTO [dbo].[Therapist] ([Name], [Address], [Phone], [Email], [ClinicName], [IsActive], [Certifications]) VALUES ('Robinson.Hood', 'San Joes', '(408) 294-7438', 'Robinson.Hood@gmail.com', 'Stanford Health Care', 1, 'Academy of Clinical Social Workers, Certified Alcohol and Drug Abuse Counselor, Certified Anger Management Facilitator')
SET @TherapistId2 = SCOPE_IDENTITY()


-- Insert login details for admin / therapist / patient
INSERT INTO [dbo].[Login] ([LoginId], [Password], [Role],[userId]) VALUES ('admin', '21232f297a57a5a743894a0e4a801fc3', 'admin',0)
INSERT INTO [dbo].[Login] ([LoginId], [Password], [Role],[userId]) VALUES ('Smith.Lewis', '40be4e59b9a2a2b5dffb918c0e86b3d7', 'patient',@PatientId1)
INSERT INTO [dbo].[Login] ([LoginId], [Password], [Role],[userId]) VALUES ('John.Wick', '40be4e59b9a2a2b5dffb918c0e86b3d7', 'patient',@PatientId2)
INSERT INTO [dbo].[Login] ([LoginId], [Password], [Role],[userId]) VALUES ('John.Smith', '40be4e59b9a2a2b5dffb918c0e86b3d7', 'therapist',@TherapistId1)
INSERT INTO [dbo].[Login] ([LoginId], [Password], [Role],[userId]) VALUES ('Robinson.Hood', '40be4e59b9a2a2b5dffb918c0e86b3d7', 'therapist',@TherapistId2)

-- Insert schedule and schedule details
INSERT INTO [dbo].[Schedule] ([Name], [StartDate], [EndDate], [Slot], [TherapistId]) VALUES ('SCH0001', @TodaysDateTime, NULL, 60, @TherapistId1)
SET @ScheduleIdForTherapist1 = SCOPE_IDENTITY()
INSERT INTO [dbo].[ScheduleDetail] ([FromTime], [ToTime], [Day], [Shift], [ScheduleId]) VALUES ('9:00 AM', '11:00 AM', 'Monday', 'Morning', @ScheduleIdForTherapist1)
INSERT INTO [dbo].[ScheduleDetail] ([FromTime], [ToTime], [Day], [Shift], [ScheduleId]) VALUES ('1:00 PM', '3:00 PM', 'Monday', 'Afternoon', @ScheduleIdForTherapist1)
INSERT INTO [dbo].[ScheduleDetail] ([FromTime], [ToTime], [Day], [Shift], [ScheduleId]) VALUES ('7:00 PM', '9:00 PM', 'Monday', 'Evening', @ScheduleIdForTherapist1)
INSERT INTO [dbo].[ScheduleDetail] ([FromTime], [ToTime], [Day], [Shift], [ScheduleId]) VALUES ('9:00 AM', '11:00 AM', 'Tuesday', 'Morning', @ScheduleIdForTherapist1)
INSERT INTO [dbo].[ScheduleDetail] ([FromTime], [ToTime], [Day], [Shift], [ScheduleId]) VALUES ('1:00 PM', '3:00 PM', 'Tuesday', 'Afternoon', @ScheduleIdForTherapist1)
INSERT INTO [dbo].[ScheduleDetail] ([FromTime], [ToTime], [Day], [Shift], [ScheduleId]) VALUES ('7:00 PM', '9:00 PM', 'Tuesday', 'Evening', @ScheduleIdForTherapist1)
INSERT INTO [dbo].[ScheduleDetail] ([FromTime], [ToTime], [Day], [Shift], [ScheduleId]) VALUES ('9:00 AM', '11:00 AM', 'Wednesday', 'Morning', @ScheduleIdForTherapist1)
INSERT INTO [dbo].[ScheduleDetail] ([FromTime], [ToTime], [Day], [Shift], [ScheduleId]) VALUES ('1:00 PM', '3:00 PM', 'Wednesday', 'Afternoon', @ScheduleIdForTherapist1)
INSERT INTO [dbo].[ScheduleDetail] ([FromTime], [ToTime], [Day], [Shift], [ScheduleId]) VALUES ('7:00 PM', '9:00 PM', 'Wednesday', 'Evening', @ScheduleIdForTherapist1)
INSERT INTO [dbo].[ScheduleDetail] ([FromTime], [ToTime], [Day], [Shift], [ScheduleId]) VALUES ('9:00 AM', '11:00 AM', 'Thrusday', 'Morning', @ScheduleIdForTherapist1)
INSERT INTO [dbo].[ScheduleDetail] ([FromTime], [ToTime], [Day], [Shift], [ScheduleId]) VALUES ('1:00 PM', '3:00 PM', 'Thrusday', 'Afternoon', @ScheduleIdForTherapist1)
INSERT INTO [dbo].[ScheduleDetail] ([FromTime], [ToTime], [Day], [Shift], [ScheduleId]) VALUES ('7:00 PM', '9:00 PM', 'Thrusday', 'Evening', @ScheduleIdForTherapist1)
INSERT INTO [dbo].[ScheduleDetail] ([FromTime], [ToTime], [Day], [Shift], [ScheduleId]) VALUES ('9:00 AM', '11:00 AM', 'Friday', 'Morning', @ScheduleIdForTherapist1)
INSERT INTO [dbo].[ScheduleDetail] ([FromTime], [ToTime], [Day], [Shift], [ScheduleId]) VALUES ('1:00 PM', '3:00 PM', 'Friday', 'Afternoon', @ScheduleIdForTherapist1)
INSERT INTO [dbo].[ScheduleDetail] ([FromTime], [ToTime], [Day], [Shift], [ScheduleId]) VALUES ('7:00 PM', '9:00 PM', 'Friday', 'Evening', @ScheduleIdForTherapist1)

-- Insert schedule and schedule details
INSERT INTO [dbo].[Schedule] ([Name], [StartDate], [EndDate], [Slot], [TherapistId]) VALUES ('SCH0002', @TodaysDateTime, NULL, 60, @TherapistId2)
SET @ScheduleIdForTherapist2 = SCOPE_IDENTITY()
INSERT INTO [dbo].[ScheduleDetail] ([FromTime], [ToTime], [Day], [Shift], [ScheduleId]) VALUES ('9:00 AM', '11:00 AM', 'Monday', 'Morning', @ScheduleIdForTherapist2)
INSERT INTO [dbo].[ScheduleDetail] ([FromTime], [ToTime], [Day], [Shift], [ScheduleId]) VALUES ('7:00 PM', '9:00 PM', 'Monday', 'Evening', @ScheduleIdForTherapist2)
INSERT INTO [dbo].[ScheduleDetail] ([FromTime], [ToTime], [Day], [Shift], [ScheduleId]) VALUES ('9:00 AM', '11:00 AM', 'Tuesday', 'Morning', @ScheduleIdForTherapist2)
INSERT INTO [dbo].[ScheduleDetail] ([FromTime], [ToTime], [Day], [Shift], [ScheduleId]) VALUES ('7:00 PM', '9:00 PM', 'Tuesday', 'Evening', @ScheduleIdForTherapist2)
INSERT INTO [dbo].[ScheduleDetail] ([FromTime], [ToTime], [Day], [Shift], [ScheduleId]) VALUES ('9:00 AM', '11:00 AM', 'Wednesday', 'Morning', @ScheduleIdForTherapist2)
INSERT INTO [dbo].[ScheduleDetail] ([FromTime], [ToTime], [Day], [Shift], [ScheduleId]) VALUES ('7:00 PM', '9:00 PM', 'Wednesday', 'Evening', @ScheduleIdForTherapist2)
INSERT INTO [dbo].[ScheduleDetail] ([FromTime], [ToTime], [Day], [Shift], [ScheduleId]) VALUES ('9:00 AM', '11:00 AM', 'Thrusday', 'Morning', @ScheduleIdForTherapist2)
INSERT INTO [dbo].[ScheduleDetail] ([FromTime], [ToTime], [Day], [Shift], [ScheduleId]) VALUES ('7:00 PM', '9:00 PM', 'Thrusday', 'Evening', @ScheduleIdForTherapist2)
INSERT INTO [dbo].[ScheduleDetail] ([FromTime], [ToTime], [Day], [Shift], [ScheduleId]) VALUES ('9:00 AM', '11:00 AM', 'Friday', 'Morning', @ScheduleIdForTherapist2)
INSERT INTO [dbo].[ScheduleDetail] ([FromTime], [ToTime], [Day], [Shift], [ScheduleId]) VALUES ('7:00 PM', '9:00 PM', 'Friday', 'Evening', @ScheduleIdForTherapist2)
INSERT INTO [dbo].[ScheduleDetail] ([FromTime], [ToTime], [Day], [Shift], [ScheduleId]) VALUES ('7:00 PM', '9:00 PM', 'Saturday', 'Evening', @ScheduleIdForTherapist2)

-- Insert block calendar data
INSERT INTO [dbo].[BlockCalendar] ([From], [To], [IsFullDay], [Reason], [TherapistId]) VALUES ('16-Apr-2019 1:00 PM', '16-Apr-2019 3:00 PM', 0, 'Personal', @TherapistId1)
INSERT INTO [dbo].[BlockCalendar] ([From], [To], [IsFullDay], [Reason], [TherapistId]) VALUES ('17-Apr-2019', '18-Apr-2019', 1, 'Personal', @TherapistId1)

-- Insert appointment / appointment details data
INSERT INTO [dbo].[Appointment] ([FromDate], [ToDate], [Fee], [Notes], [TherapistId], [PatientId], [Treatment]) VALUES (DATEADD(DAY, 2, @TodaysDateTime), DATEADD(DAY, 2, @TodaysDateTime), 500, 'Urgent care needed.', @TherapistId1, @PatientId1, 'Speech therapy given')
SET @AppointmentId = SCOPE_IDENTITY()
INSERT INTO [dbo].[AppointmentDetails] ([Session], [FromDate], [ToDate], [Status], [Notes], [AppointmentId]) VALUES (1, DATEADD(day, DATEDIFF(day, -2, @TodaysDate), '9:00:00'), DATEADD(day, DATEDIFF(day, -2, @TodaysDate), '9:15:00'), 'A', '', @AppointmentId)
-- New Appointment
INSERT INTO [dbo].[Appointment] ([FromDate], [ToDate], [Fee], [Notes], [TherapistId], [PatientId], [Treatment]) VALUES (DATEADD(DAY, 3, @TodaysDateTime), DATEADD(DAY, 4, @TodaysDateTime), 500, 'Urgent care needed.', @TherapistId1, @PatientId1, 'Speech therapy given')
SET @AppointmentId = SCOPE_IDENTITY()
INSERT INTO [dbo].[AppointmentDetails] ([Session], [FromDate], [ToDate], [Status], [Notes], [AppointmentId]) VALUES (1, DATEADD(day, DATEDIFF(day, -3, @TodaysDate), '9:00:00'), DATEADD(day, DATEDIFF(day, -3, @TodaysDate), '9:15:00'), 'A', '', @AppointmentId)
INSERT INTO [dbo].[AppointmentDetails] ([Session], [FromDate], [ToDate], [Status], [Notes], [AppointmentId]) VALUES (1, DATEADD(day, DATEDIFF(day, -4, @TodaysDate), '9:00:00'), DATEADD(day, DATEDIFF(day, -3, @TodaysDate), '9:15:00'), 'A', '', @AppointmentId)
-- New Appointment
INSERT INTO [dbo].[Appointment] ([FromDate], [ToDate], [Fee], [Notes], [TherapistId], [PatientId], [Treatment]) VALUES (DATEADD(DAY, 2, @TodaysDateTime), DATEADD(DAY, 2, @TodaysDateTime), 500, 'Urgent care needed.', @TherapistId2, @PatientId2, 'Speech therapy given')
SET @AppointmentId = SCOPE_IDENTITY()
INSERT INTO [dbo].[AppointmentDetails] ([Session], [FromDate], [ToDate], [Status], [Notes], [AppointmentId]) VALUES (1, DATEADD(day, DATEDIFF(day, -2, @TodaysDate), '9:00:00'), DATEADD(day, DATEDIFF(day, -2, @TodaysDate), '9:30:00'), 'A', '', @AppointmentId)

-- Insert practice master data
INSERT INTO [dbo].[Practice] ([Name]) VALUES('Depression')
INSERT INTO [dbo].[Practice] ([Name]) VALUES('Transitions')
INSERT INTO [dbo].[Practice] ([Name]) VALUES('Empty nesters')
INSERT INTO [dbo].[Practice] ([Name]) VALUES('Motivation issues')
INSERT INTO [dbo].[Practice] ([Name]) VALUES('Inadequacy and their own strengths')

-- Insert therapist practice mapping
INSERT INTO [dbo].[TherapistPractice] ([TherapistId], [PracticeId]) VALUES (@TherapistId1, (SELECT [PracticeId] FROM [dbo].[Practice] WITH (NOLOCK) WHERE [Name] = 'Depression'))
INSERT INTO [dbo].[TherapistPractice] ([TherapistId], [PracticeId]) VALUES (@TherapistId1, (SELECT [PracticeId] FROM [dbo].[Practice] WITH (NOLOCK) WHERE [Name] = 'Transitions'))
INSERT INTO [dbo].[TherapistPractice] ([TherapistId], [PracticeId]) VALUES (@TherapistId2, (SELECT [PracticeId] FROM [dbo].[Practice] WITH (NOLOCK) WHERE [Name] = 'Empty nesters'))
INSERT INTO [dbo].[TherapistPractice] ([TherapistId], [PracticeId]) VALUES (@TherapistId2, (SELECT [PracticeId] FROM [dbo].[Practice] WITH (NOLOCK) WHERE [Name] = 'Motivation issues'))
INSERT INTO [dbo].[TherapistPractice] ([TherapistId], [PracticeId]) VALUES (@TherapistId2, (SELECT [PracticeId] FROM [dbo].[Practice] WITH (NOLOCK) WHERE [Name] = 'Inadequacy and their own strengths'))

-- Insert Specialty master data
INSERT INTO [dbo].[Specialty] ([Name]) VALUES ('Occupational')
INSERT INTO [dbo].[Specialty] ([Name]) VALUES ('Speech')
INSERT INTO [dbo].[Specialty] ([Name]) VALUES ('Physical')

-- Insert therapist Specialty mapping
INSERT INTO [dbo].[TherapistSpecialty] ([TherapistId], [SpecialtyId]) VALUES (@TherapistId1, (SELECT [SpecialtyId] FROM [dbo].[Specialty] WITH (NOLOCK) WHERE [Name] = 'Occupational'))
INSERT INTO [dbo].[TherapistSpecialty] ([TherapistId], [SpecialtyId]) VALUES (@TherapistId1, (SELECT [SpecialtyId] FROM [dbo].[Specialty] WITH (NOLOCK) WHERE [Name] = 'Occupational'))
INSERT INTO [dbo].[TherapistSpecialty] ([TherapistId], [SpecialtyId]) VALUES (@TherapistId2, (SELECT [SpecialtyId] FROM [dbo].[Specialty] WITH (NOLOCK) WHERE [Name] = 'Speech'))
INSERT INTO [dbo].[TherapistSpecialty] ([TherapistId], [SpecialtyId]) VALUES (@TherapistId2, (SELECT [SpecialtyId] FROM [dbo].[Specialty] WITH (NOLOCK) WHERE [Name] = 'Physical'))
INSERT INTO [dbo].[TherapistSpecialty] ([TherapistId], [SpecialtyId]) VALUES (@TherapistId2, (SELECT [SpecialtyId] FROM [dbo].[Specialty] WITH (NOLOCK) WHERE [Name] = 'Physical'))