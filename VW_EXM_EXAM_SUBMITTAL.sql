CREATE OR REPLACE FORCE VIEW "VW_EXM_EXAM_SUBMITTAL" ("EXAM_ID", "SUBMITTAL_SERNO") AS 
  SELECT 
 tx.tx_serno as exam_id,
 qualifier_cd as submittal_serno 
from 
CEN_CUST_TX tx
join CEN_CUST_TX_CONTEXT text on tx.tx_serno= text.tx_serno
join sbm_submittal on qualifier_cd = submittal_serno 
where context_cd = 'SBM'
/
