

/* PPR Exam Score table */
SELECT 
	cust_id,
	exam_taken_dt,
	exam_cd,
	scaled_status,
	exam_scaled_score,
	state_cd
FROM VW_DANB_EXM_EXAM_AND_SECTION  eas
left join vw_exm_exam_submittal on exam_id = exam_serno
join VW_DANB_CUST_CUSTOMER cust on cust.cust_id = eas.cust_id
WHERE exam_cd = 'RHS' and exam_serno = 6017


/*  School data */