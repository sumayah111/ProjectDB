create table Collection(
cNo varchar(10) primary key,
cName varchar(30)
);

create table Items(
itemNo varchar(10) primary key,
resources varchar(20),
cNo varchar(10) references Collection
);

create table Books(
ISSN varchar(10) references Items,
authors varchar(30),
title varchar(100),
publisher varchar(30),
edition varchar(5),
notes varchar(100),
Status varchar(15),
primary key(ISSN)
);


create table videoRecording(
vNo varchar(10) references Items,
location varchar(30),
publisher varchar(30),
description varchar(50),
primary key(vNo)
);

create table soundRecording(
sNo varchar(10) references Items,
location varchar(30),
publisher varchar(30),
description varchar(50),
primary key(sNo)
);

create table Thesis(
thesisNo varchar(10) references Items,
Author varchar(30),
location varchar(30),
description varchar(50),
primary key(thesisNo)
);

create table Journal(
JournalNo varchar(10) references Items,
newspaper varchar(100),
primary key(JournalNo)
);

create table Articles(
article varchar(2000),
availability varchar(15),
title varchar(100),
JournalNo varchar(10) references Journal
);

create table Room(
roomNo varchar(10) primary key,
Status varchar(15),
duration int,
Locations varchar(50),
type varchar(50)
);

create table Members(
PIN varchar(10) primary key,
mName varchar(50),
DOB date,
address varchar(50),
Email varchar(30)
);

create table MembersPhone (
PIN varchar(10) references Members,
mobile varchar(14)
);


create table privilege(
pNo varchar(10) primary key,
pName varchar(50),
borrowerNumber int,
renewalNumber int
);

create table MemberType(
mType varchar(50),
description varchar(100),
joinDate date,
expDate date,
pNo varchar(10) references privilege,
PIN varchar(10) references Members
);

create table Loan(
loanNo varchar(10) primary key,
loanedItem varchar(10) references items,
loanDate date,
dueDate date,
status varchar(15),
roomNo varchar(10) references Room,
PIN varchar(10) references Members
);

create table fines(
finesNo varchar(10) primary key,
description varchar(100),
amount varchar(50),
status varchar(15),
loanNo varchar(10) references Loan
);



















INSERT INTO Collection VALUES('11111', 'COE');
INSERT INTO Collection VALUES('22222', 'IT');
INSERT INTO Collection VALUES('33333', 'CSC');


INSERT INTO Items VALUES('111', 'physical', '11111');
INSERT INTO Items VALUES('222', 'physical', '11111');
INSERT INTO Items VALUES('333', 'virtual', '22222');
INSERT INTO Items VALUES('444', 'virtual', '22222');
INSERT INTO Items VALUES('555', 'physical', '33333');
INSERT INTO Items VALUES('666', 'virtual', '33333');
INSERT INTO Items VALUES('777', 'physical', '11111');
INSERT INTO Items VALUES('888', 'virtual', '22222');
INSERT INTO Items VALUES('999', 'physical', '22222');
INSERT INTO Items VALUES('112', 'virtual', '33333');
INSERT INTO Items VALUES('113', 'physical', '11111');
INSERT INTO Items VALUES('114', 'virtual', '33333');
INSERT INTO Items VALUES('223', 'virtual', '22222');
INSERT INTO Items VALUES('224', 'virtual', '11111');



INSERT INTO BOOKS VALUES('111', 'Mmds', 'Logical design', 'Abc', '10ed', 'COE', 'Not available');
INSERT INTO BOOKS VALUES('222', 'awsd', 'Microprocessor', 'dfg', '2ed', 'IT', 'Available');
INSERT INTO BOOKS VALUES('333', 'ali', 'information technology', 'Omar', '6ed', 'IT131', 'Available');
INSERT INTO BOOKS VALUES('444', 'mohammed', 'Oracle Databae', 'Nasser', '7ed', 'IT332', 'Available');
INSERT INTO BOOKS VALUES('555', 'omar', 'Welcom to java', 'AbdAllah', '2ed', 'IT', 'Available');
INSERT INTO BOOKS VALUES('666', 'mmx', 'Welcom to C++', 'Mohanned', '4e', 'CSC', 'Not available');



INSERT INTO soundRecording VALUES('777', 'location 1', 'publisher 1', 'Digital design');
INSERT INTO soundRecording VALUES('888', 'CDF', 'publisher 2', 'Oracle database');

INSERT INTO videoRecording  VALUES('999', 'ABC', 'publisher 1', 'introdction to database');
INSERT INTO videoRecording  VALUES('112', 'CDF', 'publisher 2', 'Operating System');

INSERT INTO Thesis VALUES('113', 'Author 1', 'location 1', 'Microprocessors');
INSERT INTO Thesis VALUES('114', 'Author 2', 'CDF', 'Assembly Language');

INSERT INTO Journal VALUES('223', 'Data Structure');
INSERT INTO Journal VALUES('224', 'Microprocessors');

INSERT INTO Articles VALUES('Arrays, Linked Lists, Stacks, Queues, Hash Tables, Trees, Heaps and Graphs', 'available', '8 Common Data Structures every Programmer must know', '223');
INSERT INTO Articles VALUES('The computer you are using to read this page uses a microprocessor to do its work', 'available', 'How Microprocessors Work', '224');

INSERT INTO Room VALUES('1', 'Not Busy', 45, 'first floor', 'reading');
INSERT INTO Room VALUES('2', 'Not Busy', 45, 'second floor', 'lab');
INSERT INTO Room VALUES('3', 'Not Busy', 45, 'third floor', 'working');


INSERT INTO Members VALUES('11224455', 'Sumaiah Alnujidi', TO_DATE('05/06/1990', 'dd/mm/yyyy'), '31 freedom st, buraidah', 'Sumaiah@gmail.com');
INSERT INTO Members VALUES('33559944', 'Mohammed Abdullah', TO_DATE('05/06/1950', 'dd/mm/yyyy'), '31 freedom st, Reyadh', 'Mohammed@gmail.com');

INSERT INTO MembersPhone VALUES('11224455', '0502136589');
INSERT INTO MembersPhone VALUES('33559944', '0551289631');


INSERT INTO privilege VALUES('11', 'privilege1', 2, 2);
INSERT INTO privilege VALUES('22', 'privilege2', 1, 3);

INSERT INTO MemberType VALUES('Undergraduate', 'Student', TO_DATE('11/10/2018', 'dd/mm/yyyy'), TO_DATE('17/06/1990', 'dd/mm/yyyy'), '11', '11224455');
INSERT INTO MemberType VALUES('Graduate', 'Sale Manager', TO_DATE('17/06/2021', 'dd/mm/yyyy'), null, '22', '11224455');
INSERT INTO MemberType VALUES('Postgraduate', 'manager', TO_DATE('02/03/1945', 'dd/mm/yyyy'), TO_DATE('04/04/1949', 'dd/mm/yyyy'), '11', '33559944');
INSERT INTO MemberType VALUES('Staff', 'manager', TO_DATE('04/04/1949', 'dd/mm/yyyy'), null, '22', '33559944');


INSERT INTO Loan VALUES('4343', '111', TO_DATE('15/10/1021', 'dd/mm/yyyy'), TO_DATE('18/10/1021', 'dd/mm/yyyy'),'available', '1', '11224455');
INSERT INTO Loan VALUES('5555', '222', TO_DATE('16/10/1021', 'dd/mm/yyyy'), TO_DATE('17/10/1021', 'dd/mm/yyyy'),'available', null, '33559944');
INSERT INTO Loan VALUES('6565', '333', TO_DATE('19/10/1021', 'dd/mm/yyyy'), TO_DATE('21/10/1021', 'dd/mm/yyyy'),'available', null, '33559944');

INSERT INTO fines VALUES('6352', 'He did not return the book', '30', 'available', '6565');

