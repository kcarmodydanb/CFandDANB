CREATE OR REPLACE FORCE VIEW "VW_DANB_EXM_PDEP_RESULT" ("TX_SERNO", "CUST_ID", "CATEGORY_CD", "LEVEL1", "START_DT", "END_DT", "STATUS_CD", "CREDIT_PTS_REQUESTED", "CREDIT_PTS_ALLOWED", "CREDIT_PTS_APPROVED", "CREDIT_UNIT", "CREATE_DT", "RESULT_CD", "RESULT_SCORE", "PDEP_ARTICLE1_SCORE", "PDEP_ARTICLE2_SCORE", "PDEP_ARTICLE3_SCORE", "PDEP_ARTICLE4_SCORE", "PDEP_ARTICLE5_SCORE", "PDEP_OVERALL_STATUS", "PDEP_ID", "PDEP_FIRST_TRY_DATE", "PDEP_SECOND_TRY_DATE", "PDEP_DATE_MAILED", "PDEP_TOTAL_SCORE") AS 
  select tx.tx_serno,cust_id,category_cd,level1,start_dt,end_dt,status_cd,credit_pts_requested,credit_pts_allowed,credit_pts_approved,credit_unit,create_dt,result_cd,result_score,
pdep_article1_score,pdep_article2_score,pdep_article3_score,pdep_article4_score,pdep_article5_score,pdep_overall_status,pdep_id,pdep_first_try_date,pdep_second_try_date,pdep_Date_mailed,
pdep_total_score
 from CEN_CUST_TX tx
join VW_DANB_EXM_PDEP_ATTRIBUTE atr on tx.tx_serno = atr.tx_serno
where  tx.CATEGORY_CD='PDEP'
/
