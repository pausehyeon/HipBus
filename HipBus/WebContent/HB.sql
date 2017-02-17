
/* Drop Tables */

DROP TABLE HB_AD CASCADE CONSTRAINTS;
DROP TABLE HB_Board CASCADE CONSTRAINTS;
DROP TABLE HB_Channel CASCADE CONSTRAINTS;
DROP TABLE HB_CrewMember CASCADE CONSTRAINTS;
DROP TABLE HB_Crew CASCADE CONSTRAINTS;
DROP TABLE HB_Passengers CASCADE CONSTRAINTS;
DROP TABLE HB_Tag CASCADE CONSTRAINTS;
DROP TABLE HB_Upcoming CASCADE CONSTRAINTS;
DROP TABLE HB_Wanted CASCADE CONSTRAINTS;
DROP TABLE HB_Driver CASCADE CONSTRAINTS;
DROP TABLE HB_FAQ CASCADE CONSTRAINTS;
DROP TABLE HB_News CASCADE CONSTRAINTS;
DROP TABLE HB_StationLike CASCADE CONSTRAINTS;
DROP TABLE HB_StationReply CASCADE CONSTRAINTS;
DROP TABLE HB_Station CASCADE CONSTRAINTS;
DROP TABLE HB_Verification CASCADE CONSTRAINTS;
DROP TABLE HB_Member CASCADE CONSTRAINTS;



/* Drop Sequences */

DROP SEQUENCE HB_boardseq;
DROP SEQUENCE HB_crewidseq;
DROP SEQUENCE HB_faqseq;
DROP SEQUENCE HB_newsseq;
DROP SEQUENCE HB_replyseq;
DROP SEQUENCE HB_stationseq;
DROP SEQUENCE HB_upcomingseq;
DROP SEQUENCE HB_wantedseq;




/* Create Sequences */

CREATE SEQUENCE HB_boardseq INCREMENT BY 1 MINVALUE 1 MAXVALUE 999999;
CREATE SEQUENCE HB_crewidseq INCREMENT BY 1 MINVALUE 1 MAXVALUE 999999;
CREATE SEQUENCE HB_faqseq INCREMENT BY 1 MINVALUE 1 MAXVALUE 999999;
CREATE SEQUENCE HB_newsseq INCREMENT BY 1 MINVALUE 1 MAXVALUE 999999;
CREATE SEQUENCE HB_replyseq INCREMENT BY 1 MINVALUE 1 MAXVALUE 999999;
CREATE SEQUENCE HB_stationseq INCREMENT BY 1 MINVALUE 1 MAXVALUE 999999;
CREATE SEQUENCE HB_upcomingseq INCREMENT BY 1 MINVALUE 1 MAXVALUE 999999;
CREATE SEQUENCE HB_wantedseq INCREMENT BY 1 MINVALUE 1 MAXVALUE 999999;



/* Create Tables */

CREATE TABLE HB_AD
(
	ad_num number(1) NOT NULL,
	html varchar2(1000),
	imglocation varchar2(1000),
	PRIMARY KEY (ad_num)
);


CREATE TABLE HB_Board
(
	driver varchar2(50) NOT NULL,
	num number(22) NOT NULL,
	email varchar2(50),
	nick varchar2(30) NOT NULL,
	content varchar2(4000) NOT NULL,
	reg_date date NOT NULL,
	PRIMARY KEY (num)
);


CREATE TABLE HB_Channel
(
	driver varchar2(50) NOT NULL,
	channel_id varchar2(30) NOT NULL,
	PRIMARY KEY (driver)
);


CREATE TABLE HB_Crew
(
	crewid varchar2(50) NOT NULL,
	crewname varchar2(100) NOT NULL UNIQUE,
	imglocation varchar2(1000),
	PRIMARY KEY (crewid)
);


CREATE TABLE HB_CrewMember
(
	email varchar2(50) NOT NULL,
	crewid varchar2(50) NOT NULL,
	leader number(1) NOT NULL
);


CREATE TABLE HB_Driver
(
	driver varchar2(50) NOT NULL,
	PRIMARY KEY (driver)
);


CREATE TABLE HB_FAQ
(
	num number(22) NOT NULL,
	email varchar2(50),
	nick varchar2(30) NOT NULL,
	subject varchar2(500) NOT NULL,
	content varchar2(4000) NOT NULL,
	PRIMARY KEY (num)
);


CREATE TABLE HB_Member
(
	email varchar2(50) NOT NULL,
	nick varchar2(30) NOT NULL UNIQUE,
	passwd varchar2(15) NOT NULL,
	mem_level number(1) DEFAULT 1 NOT NULL,
	joindate date DEFAULT sysdate NOT NULL,
	imglocation varchar2(1000),
	PRIMARY KEY (email)
);


CREATE TABLE HB_News
(
	email varchar2(50),
	num number(22) NOT NULL,
	nick varchar2(30) NOT NULL,
	subject varchar2(500) NOT NULL,
	content varchar2(4000) NOT NULL,
	imglocation varchar2(1000),
	readcount number(22) NOT NULL,
	reg_date date NOT NULL,
	PRIMARY KEY (num)
);


CREATE TABLE HB_Passengers
(
	driver varchar2(50) NOT NULL,
	email varchar2(50) NOT NULL
);


CREATE TABLE HB_Station
(
	num number(22) NOT NULL,
	email varchar2(50),
	category number(2) NOT NULL,
	nick varchar2(30) NOT NULL,
	subject varchar2(500) NOT NULL,
	content varchar2(4000) NOT NULL,
	likenum number(22) NOT NULL,
	readcount number(22) DEFAULT 0 NOT NULL,
	reg_date date DEFAULT sysdate NOT NULL,
	PRIMARY KEY (num)
);


CREATE TABLE HB_StationLike
(
	num number(22) NOT NULL,
	email varchar2(50) NOT NULL
);


CREATE TABLE HB_StationReply
(
	replynum number(22) NOT NULL,
	num number(22) NOT NULL,
	email varchar2(50) NOT NULL,
	content varchar2(4000) NOT NULL,
	ref_num number(22) NOT NULL,
	re_step number(22) NOT NULL,
	re_level number(22) NOT NULL,
	reg_date date NOT NULL,
	status number(1) DEFAULT 0 NOT NULL,
	PRIMARY KEY (replynum)
);


CREATE TABLE HB_Tag
(
	driver varchar2(50) NOT NULL,
	tag varchar2(60) NOT NULL
);


CREATE TABLE HB_Upcoming
(
	num number(22) NOT NULL,
	driver varchar2(50) NOT NULL,
	nick varchar2(30) NOT NULL,
	subject varchar2(500) NOT NULL,
	perf_place varchar2(500) NOT NULL,
	perf_date date NOT NULL,
	perf_cast varchar2(500) NOT NULL,
	perf_runningtime number(3) NOT NULL,
	perf_price number(10) DEFAULT 0 NOT NULL,
	content varchar2(4000) NOT NULL,
	imglocation varchar2(1000) NOT NULL,
	readcount number(22) NOT NULL,
	reg_date date NOT NULL,
	PRIMARY KEY (num)
);


CREATE TABLE HB_Verification
(
	email varchar2(50) NOT NULL,
	code number(6) NOT NULL,
	PRIMARY KEY (email)
);


CREATE TABLE HB_Wanted
(
	driver varchar2(50) NOT NULL,
	num number(22) NOT NULL,
	nick varchar2(30) NOT NULL,
	subject varchar2(500) NOT NULL,
	content varchar2(4000) NOT NULL,
	imglocation varchar2(1000),
	dueDate date NOT NULL,
	readcount number(22) NOT NULL,
	reg_date date NOT NULL,
	PRIMARY KEY (num)
);


/* Create Foreign Keys ����: ���� */

ALTER TABLE HB_CrewMember
	ADD FOREIGN KEY (crewid)
	REFERENCES HB_Crew (crewid) ON DELETE CASCADE
;


ALTER TABLE HB_Board
	ADD FOREIGN KEY (driver)
	REFERENCES HB_Driver (driver) ON DELETE CASCADE
;


ALTER TABLE HB_Channel
	ADD FOREIGN KEY (driver)
	REFERENCES HB_Driver (driver) ON DELETE CASCADE
;


ALTER TABLE HB_Passengers
	ADD FOREIGN KEY (driver)
	REFERENCES HB_Driver (driver) ON DELETE CASCADE
;


ALTER TABLE HB_Tag
	ADD FOREIGN KEY (driver)
	REFERENCES HB_Driver (driver) ON DELETE CASCADE
;


ALTER TABLE HB_Upcoming
	ADD FOREIGN KEY (driver)
	REFERENCES HB_Driver (driver) ON DELETE CASCADE
;


ALTER TABLE HB_Wanted
	ADD FOREIGN KEY (driver)
	REFERENCES HB_Driver (driver) ON DELETE CASCADE
;


ALTER TABLE HB_Board
	ADD FOREIGN KEY (email)
	REFERENCES HB_Member (email) ON DELETE SET NULL
;


ALTER TABLE HB_CrewMember
	ADD FOREIGN KEY (email)
	REFERENCES HB_Member (email) ON DELETE CASCADE
;


ALTER TABLE HB_FAQ
	ADD FOREIGN KEY (email)
	REFERENCES HB_Member (email) ON DELETE SET NULL
;


ALTER TABLE HB_News
	ADD FOREIGN KEY (email)
	REFERENCES HB_Member (email) ON DELETE SET NULL
;


ALTER TABLE HB_Passengers
	ADD FOREIGN KEY (email)
	REFERENCES HB_Member (email) ON DELETE CASCADE
;


ALTER TABLE HB_Station
	ADD FOREIGN KEY (email)
	REFERENCES HB_Member (email) ON DELETE SET NULL
;


ALTER TABLE HB_StationReply
	ADD FOREIGN KEY (email)
	REFERENCES HB_Member (email) ON DELETE SET NULL
;


ALTER TABLE HB_Verification
	ADD FOREIGN KEY (email)
	REFERENCES HB_Member (email) ON DELETE CASCADE
;


ALTER TABLE HB_StationReply
	ADD FOREIGN KEY (num)
	REFERENCES HB_Station (num) ON DELETE CASCADE
;


ALTER TABLE HB_StationLike
	ADD FOREIGN KEY (email)
	REFERENCES HB_Member (email) ON DELETE CASCADE
;


ALTER TABLE HB_StationLike
	ADD FOREIGN KEY (num)
	REFERENCES HB_Station (num) ON DELETE CASCADE
;


