CREATE DATABASE RaceDay;

--This is Part 1 - SQL Database Script
--I am creating the ROLE TABLE

CREATE TABLE Role
(
    RoleID INT IDENTITY(1,1) NOT NULL,
    RoleName VARCHAR(50) NOT NULL,

    CONSTRAINT PK_Role
        PRIMARY KEY (RoleID),

    CONSTRAINT UQ_Role_RoleName
        UNIQUE (RoleName)
);

--USER TABLE

CREATE TABLE [User]
(
    UserID INT IDENTITY(1,1) NOT NULL,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    [Password] VARCHAR(255) NOT NULL,
    PhoneNumber VARCHAR(15) NOT NULL,
    RoleID INT NOT NULL,

    CONSTRAINT PK_User PRIMARY KEY (UserID),
    CONSTRAINT UQ_User_Email UNIQUE (Email),

    CONSTRAINT FK_User_Role FOREIGN KEY (RoleID) REFERENCES Role(RoleID)
);

--EVENT TABLE

CREATE TABLE Event
(
    EventID INT IDENTITY(1,1) NOT NULL,
    EventName VARCHAR(100) NOT NULL,
    [Description] VARCHAR(255) NOT NULL,
    EventDate DATE NOT NULL,
    [Location] VARCHAR(100) NOT NULL,
    EventType VARCHAR(20) NOT NULL,
    OrganiserID INT NOT NULL,

    CONSTRAINT PK_Event PRIMARY KEY (EventID),

    CONSTRAINT FK_Event_Organiser FOREIGN KEY (OrganiserID) REFERENCES [User](UserID),

    CONSTRAINT CK_Event_EventType CHECK (EventType IN ('Run', 'Walk', 'Cycle'))
);

--CATEGORY TABLE

CREATE TABLE Category
(
    CategoryID INT IDENTITY(1,1) NOT NULL,
    CategoryName VARCHAR(50) NOT NULL,
    EventID INT NOT NULL,

    CONSTRAINT PK_Category  PRIMARY KEY (CategoryID),

    CONSTRAINT FK_Category_Event FOREIGN KEY (EventID) REFERENCES Event(EventID),

    CONSTRAINT UQ_Category_Event_CategoryName UNIQUE (EventID, CategoryName)
);

--REGISTRATION TABLE

CREATE TABLE Registration
(
    RegistrationID INT IDENTITY(1,1) NOT NULL,
    RegistrationDate DATE NOT NULL,
    UserID INT NOT NULL,
    EventID INT NOT NULL,
    CategoryID INT NOT NULL,

    CONSTRAINT PK_Registratio PRIMARY KEY (RegistrationID),

    CONSTRAINT FK_Registration_User FOREIGN KEY (UserID) REFERENCES [User](UserID),

    CONSTRAINT FK_Registration_Event FOREIGN KEY (EventID) REFERENCES Event(EventID),

    CONSTRAINT FK_Registration_Category FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID),

    CONSTRAINT UQ_Registration_User_Event_Category UNIQUE (UserID, EventID, CategoryID)
);

--RESULT TABLE

CREATE TABLE Result
(
    ResultID INT IDENTITY(1,1) NOT NULL,
    FinishTime TIME NOT NULL,
    [Position] INT NOT NULL,
    RegistrationID INT NOT NULL,

    CONSTRAINT PK_Result PRIMARY KEY (ResultID),

    CONSTRAINT FK_Result_Registration FOREIGN KEY (RegistrationID) REFERENCES Registration(RegistrationID),

    CONSTRAINT UQ_Result_Registration UNIQUE (RegistrationID),

    CONSTRAINT CK_Result_Position CHECK ([Position] > 0)
);



--DATA

--ROLES

INSERT INTO Role (RoleName)
VALUES
    ('Organiser'),
    ('Participant');



--Users 
INSERT INTO [User]
    (FirstName, LastName, Email, [Password], PhoneNumber, RoleID)
VALUES
    ('Thando', 'Mbeki', 'thando@raceday.co.za', 'Password123!', '0712345678', 1),
    ('Lerato', 'Dlamini', 'lerato@example.com', 'Password123!', '0723456789', 2),
    ('Sipho', 'Ndlovu', 'sipho@example.com', 'Password123!', '0734567890', 2);



-- Events 
INSERT INTO Event
    (EventName, [Description], EventDate, [Location], EventType, OrganiserID)
VALUES
    (
        'Nelson Mandela Bay Fun Run',
        'A community running event for participants of different categories.',
        '2026-10-10',
        'Gqeberha',
        'Run',
        1
    ),
    (
        'Summer Charity Walk',
        'A charity walking event supporting the local community.',
        '2026-11-15',
        'Gqeberha',
        'Walk',
        1
    );



-- Categories 
INSERT INTO Category(CategoryName, EventID) VALUES
    ('10 km', 1),
    ('21 km', 1),
    ('Under 20', 1),
    ('Senior', 1),
    ('5 km', 2),
    ('10 km', 2);



--Registrations
INSERT INTO Registration(RegistrationDate, UserID, EventID, CategoryID) VALUES
    ('2026-08-01', 2, 1, 1),
    ('2026-08-02', 3, 1, 2),
    ('2026-08-03', 2, 2, 5);



--Results
INSERT INTO Result(FinishTime, [Position], RegistrationID) VALUES
    ('00:52:35', 1, 1),
    ('01:48:20', 2, 2);




SELECT * FROM Role;

SELECT * FROM [User];

SELECT * FROM Event;

SELECT * FROM Category;

SELECT * FROM Registration;

SELECT * FROM Result;
