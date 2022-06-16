---참조하기 위한 VIEW를 생성
CREATE OR REPLACE VIEW WBS_VIEW AS
	SELECT tb3.FBS_NAME, tb3.PROJ_NAME, tb3.DOC_ID, tb3.TOP_ID, tb3.MID_ID, gw.WBS_ID, gw.WBS_NAME, gw.WBS_CONENT, gw.WBS_MANAGER, gw.WBS_START_DATE, gw.WBS_END_DATE, gw.WBS_FIN_DATE, gw.WBS_CODE FROM WBS gw 
	JOIN (SELECT tb2.PROJ_NAME, tb2.DOC_ID, tb2.TOP_ID, gf.MID_ID, gf.FBS_NAME FROM FBS gf 
	JOIN (SELECT tb1.PROJ_NAME, gm.DOC_ID, gm.TOP_ID FROM TOPCATEGORY gm 
	JOIN (SELECT gp.PROJ_NAME, gd.DOC_ID FROM DOCUMENT gd JOIN PROJECT gp
		ON gd.PROJ_NAME = gp.PROJ_NAME) tb1
		ON gm.DOC_ID = tb1.DOC_ID) tb2
		ON gf.TOP_ID = tb2.TOP_ID) tb3
		ON gw.MID_ID = tb3.MID_ID;
	
SELECT FBS_NAME, WBS_CODE, WBS_NAME, WBS_CONENT, WBS_START_DATE, WBS_END_DATE
FROM WBS_VIEW WHERE WBS_MANAGER = '김광연';

SELECT * FROM WBS_VIEW wv 
	WHERE WBS_MANAGER IN ('김광연');

SELECT WBS_ID, PROJ_NAME, WBS_CODE, WBS_NAME, WBS_CONENT, WBS_START_DATE, WBS_END_DATE
			FROM WBS_VIEW WHERE WBS_MANAGER IN
			('김광연'
			)AND WBS_FIN_DATE = ' ';
SELECT SCHE_ID, MEM_ID, SCHE_NAME, SCHE_CONTENT, SCHE_START, SCHE_END
			FROM SCHEDULE WHERE MEM_ID='GD001';

SELECT * FROM WBS_VIEW;

	
CREATE OR REPLACE VIEW FBS_VIEW AS
	SELECT tb2.PROJ_NAME, tb2.DOC_ID, tb2.TOP_ID, gf.MID_ID, gf.FBS_NAME, gf.FBS_LEVEL, gf.FBS_DELFLAG FROM FBS gf 
	JOIN (SELECT tb1.PROJ_NAME, gm.DOC_ID, gm.TOP_ID FROM TOPCATEGORY gm 
	JOIN (SELECT gp.PROJ_NAME, gd.DOC_ID FROM DOCUMENT gd JOIN PROJECT gp
		ON gd.PROJ_NAME = gp.PROJ_NAME) tb1
		ON gm.DOC_ID = tb1.DOC_ID) tb2
		ON gf.TOP_ID = tb2.TOP_ID;
	
SELECT PROJ_NAME, DOC_ID, TOP_ID, MID_ID, FBS_NAME, FBS_LEVEL, FBS_DELFLAG
FROM FBS_VIEW;
	
SELECT * FROM PROJMEMLIST p ;


--개인일정 CRUD
SELECT SCHE_ID, MEM_ID, SCHE_NAME, SCHE_CONTENT, SCHE_START, SCHE_END
FROM ADMIN.SCHEDULE
WHERE MEM_ID='';

SELECT * FROM PROJMEMLIST p ;

INSERT INTO ADMIN.SCHEDULE
(SCHE_ID, MEM_ID, SCHE_NAME, SCHE_CONTENT, SCHE_START, SCHE_END)
VALUES('', '', '', '', '', '');

UPDATE ADMIN.SCHEDULE
SET MEM_ID='', SCHE_NAME='', SCHE_CONTENT='', SCHE_START='', SCHE_END=''
WHERE SCHE_ID='';

DELETE FROM ADMIN.SCHEDULE
WHERE SCHE_ID='';

SELECT * FROM SCHEDULE s ;

CREATE SEQUENCE SCHEDULE_SEQ START WITH 1 INCREMENT BY 1;



SELECT LAST_NUMBER FROM USER_SEQUENCES WHERE SEQUENCE_NAME = 'SCHEDULE_SEQ';

ALTER SEQUENCE SCHEDULE_SEQ INCREMENT BY -1000;

SELECT SCHEDULE_SEQ.NEXTVAL FROM DUAL;

ALTER SEQUENCE SCHEDULE_SEQ INCREMENT BY 1;

SELECT tb3.PROJ_NAME, gw.WBS_ID, gw.WBS_FIN_DATE FROM WBS gw 
	JOIN (SELECT tb2.PROJ_NAME, tb2.DOC_ID, tb2.TOP_ID, gf.MID_ID, gf.FBS_NAME FROM FBS gf 
	JOIN (SELECT tb1.PROJ_NAME, gm.DOC_ID, gm.TOP_ID FROM TOPCATEGORY gm 
	JOIN (SELECT gp.PROJ_NAME, gd.DOC_ID FROM DOCUMENT gd JOIN PROJECT gp
		ON gd.PROJ_NAME = gp.PROJ_NAME) tb1
		ON gm.DOC_ID = tb1.DOC_ID) tb2
		ON gf.TOP_ID = tb2.TOP_ID) tb3
		ON gw.MID_ID = tb3.MID_ID;
	
SELECT * FROM WBS;

SELECT PROJ_NAME FROM PROJMEMLIST WHERE MEM_ID='GD001'; 


SELECT * FROM MEMBERLIST;

SELECT PROJ_NAME, WBS_ID, WBS_NAME, WBS_CONENT, WBS_START_DATE, WBS_END_DATE, WBS_MANAGER, WBS_FIN_DATE
			FROM WBS_VIEW;
		
SELECT COUNT(PROJ_PM) FROM PROJMEMLIST WHERE MEM_ID ='GD001';



