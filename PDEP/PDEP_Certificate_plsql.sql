DECLARE CURSOR c_cust IS
SELECT cust_id, display_nm
FROM acgidata.VW_DANB_CEN_CUST_CUSTOMER
WHERE rownum < 5;
BEGIN sys.htp.p('<HTML>
<HEAD>
<META NAME="Author" CONTENT="Crystal Reports 14.0">
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=UTF-8">
</HEAD>
<BODY>
');
 FOR a in c_cust
   loop
      sys.htp.p('<li>' || a.cust_id || ' (' || a.display_nm || ')</li>' );
   end loop;
   sys.htp.p('</boday>');
end;

<!--- start html --->

<div class="ad1i91ep6vqd34-0" nowrap="true" style="z-index:25;top:279px;left:144px;width:696px;height:109px;text-align:center;"><table width="696px" border="0" cellpadding="0" cellspacing="0"><tbody><tr><td align="center"><span class="fc1i91ep6vqd34-0">Jose&nbsp;A&nbsp;Rios</span></td></tr></tbody></table></div>
