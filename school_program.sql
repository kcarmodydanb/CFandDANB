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
join CEN_CUST_EMP emp on emp.employer_id = sc.cust_id
join CEN_CUST_MAST emp_cust  on emp_cust.cust_id = emp.employee_id
left JOIN CEN_CUST_ADDR ON ADDR_SERNO = sc.PREF_ADDR_SERNO
left join CRT_CUST_MAST crt on emp_cust.cust_id = crt.cust_id 
where sc.cust_ty = 'SP'  
 and sc.cust_id = '0167_SC' 
 and emp.Title_nm = 'Program Director'
 and crt.level_id = 'CERTIFIED'
