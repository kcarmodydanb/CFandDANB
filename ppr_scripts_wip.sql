

/* school and school official data */

SELECT sch.cust_id,sch.display_nm,ind.display_nm,crt.cert_ty
FROM CEN_CUST_MAST sch
LEFT join CEN_CUST_EMP emp on sch.cust_id = emp.employer_id
LEFT join VW_DANB_CUST_CUSTOMER ind on ind.cust_id = emp.employee_id
LEFT join CRT_CUST_MAST crt on crt.cust_id = ind.cust_id and crt.level_id ='CERTIFIED'
WHERE sch.cust_id = '0172_SC'


SELECT 
  sc.cust_id, 
  street1,
  street2,
  street3,
  city_nm,
  state_cd,
  postal_cd,
  country_cd, 
  emp_cust.display_nm,
  CERT_TY
FROM CEN_CUST_MAST sc
  JOIN CEN_CUST_EMP emp on emp.employer_id = sc.cust_id
  JOIN CEN_CUST_MAST emp_cust  on emp_cust.cust_id = emp.employee_id
  LEFT JOIN CEN_CUST_ADDR ON ADDR_SERNO = sc.PREF_ADDR_SERNO
  LEFT join CRT_CUST_MAST crt on emp_cust.cust_id = crt.cust_id 
WHERE sc.cust_ty = 'SP'   -- SP - School Programs
 AND sc.cust_id = '0167_SC' 
 AND emp.Title_nm = 'Program Director'
 AND crt.level_id = 'CERTIFIED'


/* PPR Individual Exam Results list*/


SELECT 
      EXAM_TAKEN_DT,
      CUST_ID,
      STATE_CD,
      SCALED_STATUS,
      (CASE SCALED_STATUS WHEN 'PASS' THEN null else CASE WHEN One < 400 then 'C' Else 'M' End END) as One,
      (CASE SCALED_STATUS WHEN 'PASS' THEN null else CASE WHEN Two < 400 then 'C' Else 'M' End END) as Two,
      (CASE SCALED_STATUS WHEN 'PASS' THEN null else CASE WHEN Three < 400 then 'C' Else 'M' End END) as Three,
      (CASE SCALED_STATUS WHEN 'PASS' THEN null else CASE WHEN Four < 400 then 'C' Else 'M' End END) as Four
FROM VW_DANB_EXM_PPR_EXAM_RESULT 
WHERE EXAM_CD = 'RHS' and STATE_CD='IN' 
AND EXAM_TAKEN_DT between '12/1/2017' and '12/3/2017'
ORDER BY EXAM_TAKEN_DT


/* Program Average Performance for School */

SELECT  state_CD,   
      avg(EXAM_SCALED_SCORE) as average_scored_scale,
      avg(one) as One, 
      avg(two) as Two,
      avg(three) as Three,
      avg(four) as Four,
      count(CASE WHEN SCALED_STATUS = 'PASS' then 1  end) as Passing_count,
      count(*) as total_candidates,
      (count(CASE WHEN SCALED_STATUS = 'PASS' then 1  end)  / count(*) ) * 100 as percernt_passing
FROM VW_DANB_EXM_PPR_EXAM_RESULT 
WHERE EXAM_CD = 'RHS' and STATE_CD='IN' 
AND EXAM_TAKEN_DT between '12/1/2017' and '12/3/2017'
group by state_cd



/* PPR Exam Score table */

SELECT 
	cust.cust_id,
	exam_taken_dt,
	exam_cd,
	scaled_status,
	exam_scaled_score,
	state_cd
FROM VW_DANB_EXM_EXAM_AND_SECTION  eas
left join vw_exm_exam_submittal on exam_id = exam_serno
join VW_DANB_CEN_CUST_CUSTOMER cust on cust.cust_id = eas.cust_id
WHERE exam_cd = 'RHS' and exam_serno = 6017



/*  Exam Submittal */


CREATE OR REPLACE FORCE VIEW "VW_EXM_EXAM_SUBMITTAL" ("EXAM_ID", "SUBMITTAL_SERNO") AS 
  SELECT 
 tx.tx_serno as exam_id,
 qualifier_cd as submittal_serno 
from 
CEN_CUST_TX tx
join CEN_CUST_TX_CONTEXT text on tx.tx_serno= text.tx_serno
join sbm_submittal on qualifier_cd = submittal_serno 
where context_cd = 'SBM'