

CREATE TABLE allocations (
  ProjectCode varchar(20) NOT NULL,
  ReqID number(10) NOT NULL,
  EmpNo number(10) NOT NULL,
  Location varchar(20) default NULL check(location IN ('Onsite','Offshore'))
  );
/

insert  into allocations(ProjectCode,ReqID,EmpNo,Location) values ('ABCL',1,1,'Onsite');
insert  into allocations values('ABCL',3,3,'Offshore');
insert  into allocations values('JJJJ',1,4,'Offshore');
insert  into allocations values('ACCAL',1,6,'Offshore');
insert  into allocations values('JJJJ',1,7,'Offshore');
insert  into allocations values('JJJJ',1,5,'Onsite');
insert  into allocations values('JJJJ',1,5,'Offshore');
insert  into allocations values('JJJJ',2,222,'Offshore');
insert  into allocations values('JJJJ',2,22,'Offshore');
insert  into allocations values('JJJJ',2,2,'Onsite');

/


CREATE TABLE availability (
  ProjectCode varchar(20) NOT NULL,
  Role varchar(50) default NULL,
  Location varchar(50) default NULL,
  Skill varchar(100) default NULL,
  NoEmpOnsite number(10) default 0,
  NoEmpOffshore number(10) default 0,
  ReqID number(10) default 1
);

/

insert into availability(ProjectCode,Role,Location,Skill,NoEmpOffshore,ReqID) values('ABCL','SE','Mumbai','Programmer',0,1,1)
insert  into availability values('ABCL','PM','Mumbai','PM',0,0,2);
insert  into availability values('ACCAL','SE','Bangalore','Testing',1,0,1);
insert  into availability values('JJJJ','SE','Hyd','Java Programmer',1,2,1);
insert  into availability values('ABCL','PA','Onsite-US','Test Engineer',1,0,3);
insert  into availability values('JJJJ','PM','Hyderabad','Project Management',1,2,2);
insert  into availability values('ABCL','fgdfg','fdgfg','dfgfd',0,0,4);
insert  into availability values('ABCL','fgdfg','fdgfg','dfgfd',0,0,5);
insert  into availability values('ABCL','gfh','gfh','gfh',0,0,4);
insert  into availability values('gg','sdf','dsfd','dfdf',0,0,1);

/



CREATE TABLE employees (
  EmpNo number(10) NOT NULL,
  EmpName varchar(100) default NULL,
  mailId varchar(100) default NULL,
  Location varchar(50) default NULL,
  ProjectCode varchar(20) default 'NA',
  Role varchar(50) default NULL,
  Skill varchar(100) default NULL,
  Visa varchar(50) default 'NA',
  PassportNo varchar(25) default 'NA',
  JoiningDate date default NULL,
  PRIMARY KEY  (EmpNo)
);

/

insert  into employees(EmpNo,EmpName,mailId,Location,ProjectCode,Role,Skill,Visa,PassportNo,JoiningDate) values (1,'Raj','Raj01','Mumbai','ABCL','SE','Programmer','NA','G009191','04-apr-08');
insert  into employees values(4,'fff','Malinga_M','Bangalore','JJJJ','PM','Project Management','NA','NA','01-jun-08');
insert  into employees values(5,'wer','wer','Bangalore','JJJJ','PA','Analyst','H1B','234333','01-jun-08');
insert  into employees values(6,'wer','sdf','Chennai','ACCAL','JSE','Programmer','NA','G33938','01-jun-08');
insert  into employees values(7,'sdf','sd','Chennai','JJJJ','SE','Programmer','NA','G331938','01-jun-08');
insert  into employees values(8,'ee','ww','Bangalore','JJJJ','SE','Programmer','NA','NA','01-jun-08');

/

CREATE TABLE login (
  userid varchar(50) NOT NULL,
  password varchar(15) NOT NULL,
  auth number(2),
  PRIMARY KEY  (userid)
);

/
insert  into login(userid,password,auth) values ('Admin','Admin',0);
insert  into login values('HRUser','HRPwd',1);
insert  into login values('PMUser','PMPwd',2);

/



CREATE TABLE projects (
  ProjectCode varchar(20) NOT NULL,
  ProjectManager varchar(50) default NULL,
  OnsiteManager varchar(50) default NULL,
  ClientName varchar(50) NOT NULL,
  ClientLocation varchar(50) default NULL,
  DealCost number(25,2) default 0.00,
  DealDate date default NULL,
  StartDate date default NULL,
  Duration number(10) default 0,
  PRIMARY KEY  (ProjectCode)
);

/

insert  into projects(ProjectCode,ProjectManager,OnsiteManager,ClientName,ClientLocation,DealCost,DealDate,StartDate,Duration) values ('ABCL','Ankur','Rahul','ABC ltd','Mumbai',100000.00,'04-may-08','01-jun-08',20);
insert  into projects values('ACCAL','wer','wer','wer','wer',234.00,'08-aug-08','08-aug-08',5);
insert  into projects values('gg','dfd','dfgf','fdgfd','fdgfd',56456.00,'20-jan-2000','20-jan-2000',33);
insert  into projects values('JJJJ','asdf','asdf','sadfsf','sdfsdf',1000.00,'08-aug-08','10-oct-08',10);

/



CREATE TABLE requirement (
  ProjectCode varchar(20) NOT NULL,
  Role varchar(50) default NULL,
  Location varchar(50) default NULL,
  Skill varchar(100) default NULL,
  NoEmpOnsite number(10) default 0,
  NoEmpOffshore number(10) default 0,
  ReqID number(10) default 1
);

/

insert  into requirement(ProjectCode,Role,Location,Skill,NoEmpOnsite,NoEmpOffshore,ReqID) values ('ABCL','SE','Mumbai','Programmer',0,2,1);
insert  into requirement values('ABCL','PM','Mumbai','PM',0,4,2);
insert  into requirement values('ACCAL','SE','Bangalore','Testing',2,5,1);
insert  into requirement values('JJJJ','SE','Hyd','Java Programmer',1,2,1);
insert  into requirement values('ABCL','PA','Onsite-US','Test Engineer',1,0,3);
insert  into requirement values('JJJJ','PM','Hyderabad','Project Management',1,2,2);
insert  into requirement values('gg','sdf','dsfd','dfdf',2,1,1);

commit;


