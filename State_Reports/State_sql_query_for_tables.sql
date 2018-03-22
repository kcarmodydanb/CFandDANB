SELECT  
   cyber_txt as Email,
   display_nm as Name,
   cust.street1 || ' ' || cust.street2 || ' ' || cust.street3 || ' ' || cust.city_nm || ', ' || cust.state_cd || ' ' || cust.postal_cd AS Address, 
   NULL AS SCHOOL,
   EXAM_AUTHORIZATION as EXAM_ID, 
   EXAM_CD as EXAM,
   GRADE AS TEST_STATUS 
FROM VW_DANB_EXM_EXAM_AND_SECTION vxm
JOIN VW_DANB_CEN_CUST_CUSTOMER cust on vxm.cust_id = cust.cust_id
where exam_cd = 'GC' and state_cd = 'OK'
-- prompt user for parameter for start and end date... 
and exam_taken_dt between :startDate and :endDate
and rownum < 5