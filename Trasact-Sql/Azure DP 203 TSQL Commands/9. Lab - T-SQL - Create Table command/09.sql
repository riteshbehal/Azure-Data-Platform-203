-- Here we are creating a table
CREATE TABLE Student
(
    StudentID varchar(100) NOT NULL,  --varchar is a datatype
    StudentName varchar(1000), -- varchar 100 characters
    PRIMARY KEY (StudentID)
);

-- We can add a row of information onto the table

INSERT INTO Student(StudentID,StudentName) VALUES('S01','StudentA');

-- because we defined a contraint that there should be no null values in the student ID column. 
INSERT INTO Student(StudentName) VALUES('StudentA');

-- We'll again get an error because of the same values in Student ID. 

INSERT INTO Student(StudentID,StudentName) VALUES('S01','StudentB');


DELETE FROM Student WHERE StudentID='S01';