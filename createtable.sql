/*************************************** */
/*Name:Koffi Dossou                      */
/*                                        */
/*Contents of vi  editor for  CREATBL.SQL*/
/****************************************/


CREATE TABLE VENDOR ( 
V_CODE 		INTEGER, 
V_NAME 		VARCHAR(35) NOT NULL, 
V_CONTACT 	VARCHAR(15) NOT NULL, 
V_AREACODE 	CHAR(3) NOT NULL, 
V_PHONE 	CHAR(8) NOT NULL, 
V_STATE 	CHAR(2) NOT NULL, 
V_ORDER 	CHAR(1) NOT NULL, 
PRIMARY KEY (V_CODE));


CREATE TABLE PRODUCT (
P_CODE 	VARCHAR2(10) CONSTRAINT PRODUCT_P_CODE_PK PRIMARY KEY,
P_DESCRIPT 	VARCHAR2(35) NOT NULL,
P_INDATE 	DATE NOT NULL,
P_QOH 	  	NUMBER NOT NULL,
P_MIN 		NUMBER NOT NULL,
P_PRICE 	NUMBER(8,2) NOT NULL,
P_DISCOUNT 	NUMBER(4,2) NOT NULL,
V_CODE 		NUMBER,
CONSTRAINT PRODUCT_V_CODE_FK
FOREIGN KEY (V_CODE) REFERENCES VENDOR);

CREATE TABLE CUSTOMER (
CUS_CODE	NUMBER PRIMARY KEY,
CUS_LNAME	VARCHAR(15) NOT NULL,
CUS_FNAME	VARCHAR(15) NOT NULL,
CUS_INITIAL	CHAR(1),
CUS_AREACODE 	CHAR(3) NOT NULL,
CUS_PHONE	CHAR(8) NOT NULL,
CUS_BALANCE	NUMBER(9,2) DEFAULT 0.00,
CONSTRAINT CUS_UI1 UNIQUE(CUS_LNAME,CUS_FNAME));

CREATE TABLE CUSTOMER_2 (
CUS_CODE	CHAR(5),
CUS_LNAME	VARCHAR(15) NOT NULL,
CUS_FNAME	VARCHAR(15) NOT NULL,
CUS_INITIAL	CHAR(1),
CUS_AREACODE 	CHAR(3) NOT NULL,
CUS_PHONE	CHAR(8) NOT NULL,
PRIMARY KEY (CUS_CODE));

CREATE TABLE INVOICE (
INV_NUMBER     	NUMBER(9,2),
CUS_CODE	NUMBER(9,2) NOT NULL REFERENCES CUSTOMER(CUS_CODE),
INV_DATE  	DATE  NOT NULL,
PRIMARY KEY (INV_NUMBER));

CREATE TABLE LINE (
INV_NUMBER 	NUMBER NOT NULL,
LINE_NUMBER	NUMBER(2,0) NOT NULL,
P_CODE		VARCHAR(10) NOT NULL,
LINE_UNITS	NUMBER(9,2) NOT NULL,
LINE_PRICE	NUMBER(9,2) NOT NULL,
PRIMARY KEY (INV_NUMBER,LINE_NUMBER),
FOREIGN KEY (INV_NUMBER) REFERENCES INVOICE(INV_NUMBER),
FOREIGN KEY (P_CODE) REFERENCES PRODUCT(P_CODE),
CONSTRAINT LINE_UI1 UNIQUE(INV_NUMBER, P_CODE));

/*********************************************************/
/*EXECUTION OF OUTPUT                                   */
/*  OF CREATETBL_LNAME.SQL                             */
/* VENDOR,PRODUCT,CUSTOMER, CUSTOMER_2, INVOICE,LINE  */
/*****************************************/
SQL> START CREATETBL_LNAME.SQL

Table created.


Table created.


Table created.


Table created.


Table created.


Table created.

/*****************************************************************************/
/*The DESCRIBE command displays the structure Organization of the all 5 tables*/
/*        VENDOR,PRODUCT,CUSTOMER,CUSTOMER_2 ,INVOICE,LINE                   */
/****************************************************************************/

SQL> DESCRIBE VENDOR;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 V_CODE                                    NOT NULL NUMBER(38)
 V_NAME                                    NOT NULL VARCHAR2(35)
 V_CONTACT                                 NOT NULL VARCHAR2(15)
 V_AREACODE                                NOT NULL CHAR(3)
 V_PHONE                                   NOT NULL CHAR(8)
 V_STATE                                   NOT NULL CHAR(2)
 V_ORDER                                   NOT NULL CHAR(1)

SQL> DESCRIBE PRODUCT;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 P_CODE                                    NOT NULL VARCHAR2(10)
 P_DESCRIPT                                NOT NULL VARCHAR2(35)
 P_INDATE                                  NOT NULL DATE
 P_QOH                                     NOT NULL NUMBER
 P_MIN                                     NOT NULL NUMBER
 P_PRICE                                   NOT NULL NUMBER(8,2)
 P_DISCOUNT                                NOT NULL NUMBER(4,2)
 V_CODE                                             NUMBER

SQL> DESCRIBE CUSTOMER;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 CUS_CODE                                  NOT NULL NUMBER
 CUS_LNAME                                 NOT NULL VARCHAR2(15)
 CUS_FNAME                                 NOT NULL VARCHAR2(15)
 CUS_INITIAL                                        CHAR(1)
 CUS_AREACODE                              NOT NULL CHAR(3)
 CUS_PHONE                                 NOT NULL CHAR(8)
 CUS_BALANCE                                        NUMBER(9,2)


SQL> DESCRIBE CUSTOMER_2;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 CUS_CODE                                  NOT NULL CHAR(5)
 CUS_LNAME                                 NOT NULL VARCHAR2(15)
 CUS_FNAME                                 NOT NULL VARCHAR2(15)
 CUS_INITIAL                                        CHAR(1)
 CUS_AREACODE                              NOT NULL CHAR(3)
 CUS_PHONE                                 NOT NULL CHAR(8)


SQL> DESCRIBE INVOICE;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 INV_NUMBER                                NOT NULL NUMBER(9,2)
 CUS_CODE                                  NOT NULL NUMBER(9,2)
 INV_DATE                                  NOT NULL DATE

SQL> DESCRIBE LINE
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 INV_NUMBER                                NOT NULL NUMBER
 LINE_NUMBER                               NOT NULL NUMBER(2)
 P_CODE                                    NOT NULL VARCHAR2(10)
 LINE_UNITS                                NOT NULL NUMBER(9,2)
 LINE_PRICE                                NOT NULL NUMBER(9,2)

SQL>
