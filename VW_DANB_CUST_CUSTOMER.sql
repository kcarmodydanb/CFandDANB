CREATE OR REPLACE FORCE VIEW "VW_DANB_CUST_CUSTOMER" ("CUST_ID", "CUST_TY", "DISPLAY_NM", "SORTBY_NM", "UPR_DISPLAY_NM", "CREATE_DT", "CREATE_BY", "PREFIX_NM", "FIRST_NM", "MIDDLE_NM", "LAST_NM", "SUFFIX_NM", "DEGREE_NM", "INFORMAL_NM", "COMPANY_NM", "COMPANY_NM2", "TRADE_NM", "PHONE_TY", "PHONE_NUM_SEARCH", "PHONE_NUM", "PHONE_EXT", "PHONE_REMARK", "ADDR_TY", "CONTACT_TXT1_CONTACT_TXT2", "STREET1", "STREET2", "STREET3", "CITY_NM", "STATE_CD", "PROVINCE_NM", "POSTAL_CD", "COUNTRY_CD", "COUNTRY_NM", "COUNTY", "START_DT", "END_DT", "BAD_ADDR_DT", "CYBER_TY", "CYBER_TXT", "BAD_CYBER_DT") AS 
  SELECT 
	CEN_CUST_MAST.CUST_ID,
	CUST_TY,
	DISPLAY_NM,
	SORTBY_NM,
	UPR_DISPLAY_NM,
	CEN_CUST_MAST.CREATE_DT,
	CEN_CUST_MAST.CREATE_BY,
	PREFIX_NM,
	FIRST_NM,
	MIDDLE_NM,
	LAST_NM,
	SUFFIX_NM,
	DEGREE_NM,
	INFORMAL_NM ,
	COMPANY_NM,
	COMPANY_NM2,
	TRADE_NM,
	PHONE_TY,
	PHONE_NUM_SEARCH,
	PHONE_NUM,
	PHONE_EXT,
	PHONE_REMARK ,
	ADDR_TY,
	CONTACT_TXT1,
	CONTACT_TXT2,
	STREET1,
	STREET2,
	STREET3,
	CITY_NM,
	STATE_CD
	PROVINCE_NM,
	POSTAL_CD,
	COUNTRY_CD,
	COUNTRY_NM,
	COUNTY,
	START_DT,
	END_DT,
	CEN_CUST_ADDR.BAD_ADDR_DT ,
	CYBER_TY,
	CYBER_TXT, 
	CEN_CUST_CYBER.BAD_ADDR_DT AS BAD_CYBER_DT

FROM CEN_CUST_MAST
left JOIN CEN_CUST_PHONE on PHONE_SERNO = PREF_PHONE_SERNO
left JOIN CEN_CUST_ADDR ON ADDR_SERNO = PREF_ADDR_SERNO
left JOIN CEN_CUST_CYBER ON CYBER_SERNO = PREF_CYBER_SERNO
/
