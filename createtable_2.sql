/********************************************/
/*   CREATETABLE FOR PRODMASTER           ****/
/*               &                         ***/
/*                                         */
/*  EXECUTION OF OUTPUT                   */
/******************************************/


CREATE TABLE PRODMASTER (
PROD_ID 	VARCHAR(10) NOT NULL,
P_DESC   	VARCHAR(35) NOT NULL,
P_QOH 	  	NUMBER NOT NULL,
PRIMARY KEY (PROD_ID));   


CREATE TABLE PRODSALES (
PROD_ID         VARCHAR2(10) NOT NULL,
PS_QTY 	  	NUMBER NOT NULL,
PRIMARY KEY (PROD_ID)); 


SQL> start createtbl_prod.sql;
Table created.
Table created.


/*****************************************************/
/*  LOADTABLE FOR  PRODSALES & PRODMASTER          ****/
/*     &                                              */
/*     EXECUTION OF OUTPUT                           */
/****************************************************/

  

/* PRODMASTER					*/
INSERT INTO PRODMASTER VALUES('A123','SCREWS',60);
INSERT INTO PRODMASTER VALUES('BX34','NUTS',37);
INSERT INTO PRODMASTER VALUES('C563','BOLTS',50);


/* PRODSALES					*/
INSERT INTO PRODSALES VALUES('A123',7);
INSERT INTO PRODSALES VALUES('BX34',3);

SQL> start loadtbl_prod.sql;
1 row created.
1 row created.
1 row created.
1 row created.
1 row created.





