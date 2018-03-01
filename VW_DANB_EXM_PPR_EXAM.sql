CREATE OR REPLACE FORCE VIEW "VW_DANB_EXM_PPR_EXAM_RESULT" ("CUST_ID", "REGID", "EXAM_TAKEN_DT", "EXAM_CD", "SCALED_STATUS", "EXAM_SCALED_SCORE", "STATE_CD", "ONE", "TWO", "THREE", "FOUR", "FIVE", "SIX") AS 
  SELECT "CUST_ID","REGID","EXAM_TAKEN_DT","EXAM_CD","SCALED_STATUS","EXAM_SCALED_SCORE","STATE_CD","ONE","TWO","THREE","FOUR","FIVE","SIX"
FROM 
(
  SELECT eas.cust_id,
         eas.regid,
         eas.exam_taken_dt,
         eas.EXAM_CD,
         eas.scaled_status,
         eas.exam_scaled_score,
         cust.state_cd,
        nvl(eas.SECTION_SCALED_SCORE,0) as SECTION_SCALED_SCORE,
        eas.SECTION_ORDINAL
  from VW_DANB_EXM_EXAM_AND_SECTION eas
  --join DANB_SECTION_DESCR sdes on eas.exam_series_cd= sdes.exam_series_cd
  left join vw_exm_exam_submittal on exam_id = exam_serno
  join VW_DANB_CEN_CUST_CUSTOMER cust on cust.cust_id = eas.cust_id
)
PIVOT(
    MIN(SECTION_SCALED_SCORE)
     FOR SECTION_ORDINAL IN (
        1 as One,
        2 as Two,
        3 as Three,
        4 as Four,
        5 as Five,
        6 as Six
    )
)
/
