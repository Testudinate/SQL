
Разработка (Teradata)

CREATE MULTISET TABLE prd_db_stg.validator_check
    (     DATA_BASE_NAME VARCHAR(64),
        STRING    VARCHAR(64),
        B    BYTEINT,
        M    BYTEINT,
        E    BYTEINT
    )
PRIMARY INDEX(DATA_BASE_NAME,STRING);

SELECT TOP 100 * FROM PRD_DB_STG.VALIDATOR_CHECK

INSERT INTO PRD_DB_STG.VALIDATOR_CHECK VALUES ('PRD_VD_DM','V',1,0,0);

INSERT INTO PRD_DB_STG.VALIDATOR_CHECK VALUES ('PRD_VD_DM','ART',0,1,1);

INSERT INTO PRD_DB_STG.VALIDATOR_CHECK VALUES ('PRD_VD_DM','LNK',0,0,1);

INSERT INTO PRD_DB_STG.VALIDATOR_CHECK VALUES ('PRD_VD_DM','PRICE',0,1,1);

INSERT INTO PRD_DB_STG.VALIDATOR_CHECK VALUES ('PRD_VD_DM','LINE',0,1,1);

Заполнение таблицы prd_db_stg.validator_check
--------------------------------------------------------------------------------------------------------------
Добавил сокращения, аббревиатуры, окончания в табличку PRD_DB_STG.VALIDATOR_CHECK
          o SELECT TOP 200 * FROM PRD_DB_STG.VALIDATOR_CHECK; (база разработчиков)
--------------------------------------------------------------------------------------------------------------

replace procedure dev_db_stg.validator(p_schema varchar(64),p_object varchar(64))
DYNAMIC RESULT SETS 1
BEGIN
  -- Name    :  validator
  -- Purpose :
  -- Version :
  --            1.0 2014-03-05 Klevtsov S.
  -- Author  :  Klevtsov Stanislav

 -- ================  DECLARATION SECTION  ================
    DECLARE   v_step         INTEGER DEFAULT 0;
    DECLARE   c_prc_name     varchar(40) DEFAULT 'validator';

    DECLARE   v_sql_err_code
            , v_sql_warning_code
            , v_sql_state     INTEGER;

 -- ================  CURSOR DECLARATION  ================
    DECLARE RESULT_CUR CURSOR WITH RETURN ONLY FOR

        WITH RECURSIVE SUB (STR, DELIMETER, LVL, LEN, POS) AS
        (
        SELECT A.STR                           AS STR
              , A.DELIMITER                       AS DELIMITER
              , A.LVL                           AS LVL
              , CAST(LENGTH(A.STR) AS INTEGER) AS LEN
              , INDEX(A.STR, A.DELIMITER) AS POS
           FROM (SELECT p_object AS STR, '_' AS DELIMITER, 0 LVL ) A
        UNION ALL
        SELECT SUBSTR(STR,POS+1,LENGTH(STR))   AS STR_OUT
             , DELIMETER                       AS DELIMETER
             , LVL+1                            AS LVL
             , CAST(LENGTH(STR_OUT) AS INTEGER)AS LEN
             , INDEX(STR_OUT,DELIMETER)        AS POS
          FROM SUB
         WHERE POS>0
        )
        SELECT SUB.TEXT
             , SUB.STR
            , SUB.LVL
            , C.B
            , C.M
            , C.E
            , (SELECT MIN(SUB.LVL) FROM SUB )AS MIN_LVL
            , (SELECT MAX(SUB.LVL) FROM SUB )AS MAX_LVL
            , CASE WHEN SUB.STR = c.STRING AND MIN_LVL = MIN_LVL AND c.B = 1 THEN '+'
                  WHEN SUB.STR = c.STRING AND SUB.LVL > MIN_LVL AND SUB.LVL<MAX_LVL AND c.M = 1 THEN '+'
                    WHEN SUB.STR = c.STRING AND SUB.LVL = MAX_LVL AND c.E = 1 THEN '+'
              ELSE '-' end STATUS

          FROM (SELECT CASE WHEN s.POS>0 THEN SUBSTR(s.STR,1,s.POS-1)
                        ELSE s.STR
                   END STR
                 , s.LVL
                 , s.STR AS TEXT
                FROM SUB s) SUB
        LEFT JOIN PRD_DB_STG.VALIDATOR_CHECK c ON c.STRING = SUB.STR AND c.DATA_BASE_NAME = p_schema;
 -- ================  EXCEPTIOIN SECTION  ================
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
          SET v_sql_err_code = SQLCODE;
          SET v_sql_state =SQLSTATE;
          ROLLBACK;

          CALL db_admin.prc_log_dm_recalc(c_prc_name, v_step,'F', NULL,NULL,'ERROR! code : '|| v_sql_err_code ||', state: '|| v_sql_state );
          RESIGNAL;-- Propagation error to the outer environment
    END;

    DECLARE CONTINUE HANDLER FOR SQLWARNING
    BEGIN
          SET v_sql_warning_code = SQLCODE;
          SET v_sql_state =SQLSTATE;
          CALL db_admin.prc_log_dm_recalc(c_prc_name, v_step,'F', NULL,NULL,'Warning! code : '|| v_sql_warning_code ||', state: '|| v_sql_state );
    END;

  -- =======   MAIN SECTION         ============

  OPEN RESULT_CUR;
END;

call dev_db_stg.validator('PRD_VD_DM','V_ART_PRICE_LINE_LNK');
