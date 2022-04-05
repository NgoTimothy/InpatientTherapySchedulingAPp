DROP TABLE IF EXISTS dbo.user
CREATE TABLE [user] (
  [user_id] int PRIMARY KEY,
  [first_name] nvarchar(255),
  [middle_name] nvarchar(255),
  [last_name] nvarchar(255),
  [address] nvarchar(255),
  [phone_number] nvarchar(255),
  [username] nvarchar(255),
  [password] nvarchar(255)
)
GO

DROP TABLE IF EXISTS dbo.patient
CREATE TABLE [patient] (
  [patient_id] int PRIMARY KEY,
  [first_name] nvarchar(255),
  [middle_name] nvarchar(255),
  [last_name] nvarchar(255),
  [address] nvarchar(255),
  [phone_number] nvarchar(255),
  [location_name] nvarchar(255),
  [start_date] date,
  [pmr_physician] nvarchar(255)
)
GO

DROP TABLE IF EXISTS dbo.permission
CREATE TABLE [permission] (
  [user_id] int,
  [role] nvarchar(255) NOT NULL CHECK ([role] IN ('therapist', 'nurse', 'admin')),
  PRIMARY KEY ([user_id], [role])
)
GO

DROP TABLE IF EXISTS dbo.therapy
CREATE TABLE [therapy] (
  [adl] nvarchar(255) PRIMARY KEY,
  [therapy_type] nvarchar(255),
  [abbreviation] nvarchar(255)
)
GO

DROP TABLE IF EXISTS dbo.location
CREATE TABLE [location] (
  [location_id] int PRIMARY KEY,
  [name] nvarchar(255)
)
GO

DROP TABLE IF EXISTS dbo.room
CREATE TABLE [room] (
  [number] int,
  [location_id] int,
  PRIMARY KEY ([number], [location_id])
)
GO

DROP TABLE IF EXISTS dbo.appointment
CREATE TABLE [appointment] (
  [appointment_id] int PRIMARY KEY,
  [start_time] datetime,
  [end_time] datetime,
  [therapist_id] int,
  [patient_id] int,
  [room_number] int,
  [adl] nvarchar(255),
  [location_id] int,
  [therapist_drive_time] int,
  [notes] nvarchar(255)
)
GO

DROP TABLE IF EXISTS dbo.therapist_activity
CREATE TABLE [therapist_activity] (
  [activity_name] nvarchar(255) PRIMARY KEY,
  [isProductive] boolean
)
GO

DROP TABLE IF EXISTS dbo.patient_activity
CREATE TABLE [patient_activity] (
  [activity_name] nvarchar(255) PRIMARY KEY
)
GO

DROP TABLE IF EXISTS dbo.therapist_event
CREATE TABLE [therapist_event] (
  [event_id] int PRIMARY KEY,
  [start_time] datetime,
  [end_time] datetime,
  [therapist_id] int,
  [activity_name] nvarchar(255),
  [notes] nvarchar(255)
)
GO

DROP TABLE IF EXISTS dbo.patient_event
CREATE TABLE [patient_event] (
  [event_id] int PRIMARY KEY,
  [start_time] datetime,
  [end_time] datetime,
  [patient_id] int,
  [activity_name] nvarchar(255),
  [notes] nvarchar(255)
)
GO

DROP TABLE IF EXISTS dbo.hours_worked
CREATE TABLE [hours_worked] (
  [hours_worked_id] int PRIMARY KEY,
  [start_time] datetime,
  [end_time] datetime,
  [user_id] int
)
GO

ALTER TABLE [patient] ADD FOREIGN KEY ([location_name]) REFERENCES [location] ([name])
GO

ALTER TABLE [permission] ADD FOREIGN KEY ([user_id]) REFERENCES [user] ([user_id])
GO

ALTER TABLE [room] ADD FOREIGN KEY ([location_id]) REFERENCES [location] ([location_id])
GO

ALTER TABLE [appointment] ADD FOREIGN KEY ([therapist_id]) REFERENCES [user] ([user_id])
GO

ALTER TABLE [appointment] ADD FOREIGN KEY ([patient_id]) REFERENCES [patient] ([patient_id])
GO

ALTER TABLE [appointment] ADD FOREIGN KEY ([location_id]) REFERENCES [location] ([location_id])
GO

ALTER TABLE [appointment] ADD FOREIGN KEY ([adl]) REFERENCES [therapy] ([adl])
GO

ALTER TABLE [therapist_event] ADD FOREIGN KEY ([therapist_id]) REFERENCES [user] ([user_id])
GO

ALTER TABLE [therapist_event] ADD FOREIGN KEY ([activity_name]) REFERENCES [therapist_activity] ([activity_name])
GO

ALTER TABLE [patient_event] ADD FOREIGN KEY ([patient_id]) REFERENCES [patient] ([patient_id])
GO

ALTER TABLE [patient_event] ADD FOREIGN KEY ([activity_name]) REFERENCES [patient_activity] ([activity_name])
GO

ALTER TABLE [hours_worked] ADD FOREIGN KEY ([user_id]) REFERENCES [user] ([user_id])
GO
