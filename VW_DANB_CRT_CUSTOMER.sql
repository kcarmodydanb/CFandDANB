CREATE OR REPLACE FORCE VIEW "VW_DANB_CRT_CUSTOMER" ("CUST_ID", "CERT_TY", "CERT_DESCR", "SPEC_TY", "LEVEL_ID", "CERT_STATUS", "CURRENT_EXP_DATE", "CERT_SERNO", "CERTIFICATE_NO", "PERIOD_SERNO", "CERTIFIED_SINCE_DT", "CREATE_DT", "CREATE_BY", "LAST_UPDATE_DT", "LAST_UPDATE_BY", "PRINTED_DT") AS 
  SELECT crtMast.cust_id, 
  crtMast.cert_ty, 
  crtCfg.DESCR, 
  crtMast.spec_ty, 
  crtMast.level_id,
  crtMast.cert_status,
  crtMast.current_exp_date,
  crtMast.cert_serno,
  crtMast.certificate_no,
  crtMast.period_serno,
  crtMast.certified_since_dt,
  crtMast.create_dt,
  crtMast.create_by,
  crtMast.last_update_dt,
  crtMast.last_update_by,
  req.PRINTED_DT
FROM CRT_CUST_MAST crtMast
join CRT_CFG_TYPE crtCfg on crtCfg.cert_ty = crtMast.cert_ty
left join crt_corr_request req on req.requesting_period = crtMast.period_serno
/
